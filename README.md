# NR-UIQA and the proposed method for underwater image enhancement quality assessment

- **Article title**: "Perceptual Quality Assessment of Underwater Image Enhancement"
- **Authors**: Xiao Yi, Qiuping Jiang, Wei Zhou 
- **Institution**: The School of Information Science and Engineering, Ningbo University
  
## 💡 Abstract
Due to the attenuation and scattering of light in the water medium, real-world underwater images usually suffer from diverse quality defects, such as color casts, low contrast,and reduced visibility, etc. These quality defects accordingly cause adverse effects on underwater images in practical applications. To tackle the problem, many underwater image enhancement (UIE) techniques have been proposed for improving the quality of raw underwater images, showing heterogeneous performances regarding the enhanced results. Therefore, designing an objective quality metric that can effectively predict the visual quality of enhanced underwater images is desirable. In this paper, we propose a highly efficient yet accurate no-reference quality assessment method to evaluate different UIE results by analyzing the statistics of underwater images. Specifically, we first extract quality-aware features in terms of three key aspects: 1) colorfulness; 2) contrast; 3) visibility. Then, a quality regression model is trained to map the extracted features to
subjective scores for enhanced underwater images. Given a testing underwater image, we also first extract its corresponding quality-aware feature vector and feed it into the previously trained quality regression model for quality prediction. We conduct extensive experiments on two publicly available databases to demonstrate the superiority of our proposed approach.

## 📃 Requirement
Matlab

## 🍎 Noting 
- **Usage** :
   You can run 'demo.m' to get the feature vector and the predict score. 
   > **Input**:   
        img: test image  
   > **Output**:   
        features: the feature vector  
        score: the quality of the test image (Higher score means better image quality)
- **Train** :  
We provide the folder ( i.e., Train).
Run SAUD_SVR.m / UID_SVR.m to predict the quality scores and calculate the correlation 
between subjective and objective scores.

## ✨ Statement
Please contact with us if you have any question, by Email: 1664457169@qq.com or jiangqiuping@nbu.edu.cn

