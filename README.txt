1. Citation:
Please cite the following paper when using the code. 
Author: Xiao Yi, Qiuping Jiang, Wei Zhou 
Title: "Perceptual Quality Assessment of Underwater Image Enhancement,"
Displays 

2. Usage: 
   You can run 'demo.m' to get the feature vector and the predict score. 

   Input: 
        img: test image
   Output: 
        features: the feature vector
        score: the quality of the test image (Higher score means better image quality)

3. Train: 
    
We provide the folder ( i.e., Train).
Run SAUD_SVR.m / UID_SVR.m to predict the quality scores and calculate the correlation 
between subjective and objective scores.

note: the subjective and objective scores have already stored in ".mat" file (i.e., SAUD_MOS, UID_MOS.....)
   
    
4. Please contact with us if you have any question, by Email: 1664457169@qq.com or jiangqiuping@nbu.edu.cn
