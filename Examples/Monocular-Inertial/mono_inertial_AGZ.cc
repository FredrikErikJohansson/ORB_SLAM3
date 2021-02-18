#include<iostream>
#include<algorithm>
#include<fstream>
#include<chrono>
#include<iomanip>

#include<opencv2/core/core.hpp>

#include"System.h"
#include "ImuTypes.h"

using namespace std;

void LoadImages(const string &strFile, const string &timeFile, vector<string> &vstrImageFilenames,
                vector<double> &vTimestamps);

void LoadIMU(const string &strFile, vector<double> &vTimeStamps, vector<cv::Point3f> &vAcc, vector<cv::Point3f> &vGyro);

double ttrack_tot = 0;
int main(int argc, char **argv) {
    if(argc != 6)
    {
        cerr << endl << "Usage: ./mono_AGZ path_to_vocabulary path_to_settings path_to_sequence path_to_timestamps path_to_imu" << endl;
        return 1;
    }

    // Retrieve paths to images
    vector<string> vstrImageFilenames;
    vector<double> vTimestampsCam;
    vector<double> vTimestampsImu;
    vector<cv::Point3f> vAcc, vGyro;

    LoadImages(string(argv[3]), string(argv[4]), vstrImageFilenames, vTimestampsCam);
    cout << "IMAGES LOADED!" << endl;
    LoadIMU(string(argv[5]), vTimestampsImu, vAcc, vGyro);
    cout << "IMU LOADED!" << endl;
    int nImages = vstrImageFilenames.size();
    int nImu = vTimestampsImu.size();
    cout << "nImages: " << nImages << ", nImus: " << nImu << endl;
    int first_imu = 0;

    if((nImages<=0)||(nImu<=0))
    {
        cerr << "ERROR: Failed to load images or IMU" << endl;
        return 1;
    }

    // Find first imu to be considered, supposing imu measurements start first
    while(vTimestampsImu[first_imu]<=vTimestampsCam[0]) {
        first_imu++;
    }
    first_imu--; // first imu measurement to be considered

    // Create SLAM system. It initializes all system threads and gets ready to process frames.
    ORB_SLAM3::System SLAM(argv[1],argv[2],ORB_SLAM3::System::IMU_MONOCULAR, true);

    // Vector for tracking time statistics
    vector<float> vTimesTrack;
    vTimesTrack.resize(nImages);

    cout << endl << "-------" << endl;
    cout << "Start processing sequence ..." << endl;
    cout << "Images in the sequence: " << nImages << endl << endl;

    // Main loop
    cv::Mat im;
    vector<ORB_SLAM3::IMU::Point> vImuMeas;
    //cv::Ptr<cv::CLAHE> clahe = cv::createCLAHE(3.0, cv::Size(8, 8));
    for(int ni=0; ni<nImages; ni++)
    {
        // Read image from file
        im = cv::imread(string(argv[3]) + vstrImageFilenames[ni],cv::IMREAD_UNCHANGED);
        double tframe = vTimestampsCam[ni];

        // Clahe
        //clahe->apply(im, im);

        if(im.empty())
        {
            cerr << endl << "Failed to load image at: " << vstrImageFilenames[ni] << endl;
            return 1;
        }

        // Load imu measurements from previous frame
        vImuMeas.clear();

        if(ni>0)
        {
            while(vTimestampsImu[first_imu]<=vTimestampsCam[ni])
            {
                vImuMeas.push_back(ORB_SLAM3::IMU::Point(vAcc[first_imu].x,vAcc[first_imu].y,vAcc[first_imu].z,
                                                        vGyro[first_imu].x,vGyro[first_imu].y,vGyro[first_imu].z,
                                                        vTimestampsImu[first_imu]));
                first_imu++;
            }
        }

#ifdef COMPILEDWITHC11
        std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
#else
        std::chrono::monotonic_clock::time_point t1 = std::chrono::monotonic_clock::now();
#endif

        // Pass the image to the SLAM system
        SLAM.TrackMonocular(im,tframe,vImuMeas, vstrImageFilenames[ni]);

#ifdef COMPILEDWITHC11
        std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
#else
        std::chrono::monotonic_clock::time_point t2 = std::chrono::monotonic_clock::now();
#endif

        double ttrack= std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();

        vTimesTrack[ni]=ttrack;

        // Wait to load the next frame
        double T=0;
        if(ni<nImages-1)
            T = vTimestampsCam[ni+1]-tframe;
        else if(ni>0)
            T = tframe-vTimestampsCam[ni-1];

        if(ttrack<T)
            usleep((T-ttrack)*1e6);
    }

    // Stop all threads
    SLAM.Shutdown();

    // Tracking time statistics
    sort(vTimesTrack.begin(),vTimesTrack.end());
    float totaltime = 0;
    for(int ni=0; ni<nImages; ni++)
    {
        totaltime+=vTimesTrack[ni];
    }
    cout << "-------" << endl << endl;
    cout << "median tracking time: " << vTimesTrack[nImages/2] << endl;
    cout << "mean tracking time: " << totaltime/nImages << endl;

    // Save camera trajectory
    SLAM.SaveKeyFrameTrajectoryTUM("KeyFrameTrajectory.txt");    

    return 0;
}

void LoadImages(const string &strFile, const string &timeFile, vector<string> &vstrImageFilenames, vector<double> &vTimestamps)
{
    ifstream f;
    string strTimesFile = timeFile;
    cout << strTimesFile << endl;
    f.open(strTimesFile.c_str());

    while(!f.eof())
    {
        string s;
        getline(f,s);
        if (s[0] == '#')
            continue;

        if(!s.empty())
        {
            string item;
            size_t pos = 0;
            string data[3];
            int count = 0;
            while ((pos = s.find(',')) != string::npos) {
                if(count == 2) break;
                item = s.substr(0, pos);
                data[count++] = item;
                s.erase(0, pos + 1);
            }
            item = s.substr(0, pos);
            data[2] = item;
            vTimestamps.push_back(stod(data[0])/1e9);
            vstrImageFilenames.push_back(data[2] + ".jpg");
        }
    }
}

void LoadIMU(const string &strImuPath, vector<double> &vTimeStamps, vector<cv::Point3f> &vAcc, vector<cv::Point3f> &vGyro)
{
    ifstream f;
    string strImuFile = strImuPath;
    cout << strImuFile << endl;
    f.open(strImuFile.c_str());

    while(!f.eof())
    {
        string s;
        getline(f,s);
        if (s[0] == '#')
            continue;

        if(!s.empty())
        {
            string item;
            size_t pos = 0;
            double data[7];
            int count = 0;
            while ((pos = s.find(',')) != string::npos) {
                if(count == 7) break;
                item = s.substr(0, pos);
                data[count++] = stod(item);
                s.erase(0, pos + 1);
            }
            item = s.substr(0, pos);
            data[6] = stod(item);

            vTimeStamps.push_back(data[0]/1e9);
            vAcc.push_back(cv::Point3f(data[4],data[5],data[6]));
            vGyro.push_back(cv::Point3f(data[1],data[2],data[3]));
        }
    }
}
