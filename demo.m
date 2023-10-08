
clear;
clc;

load svrmodel.mat
img1= imread('0471.png');
feature =Feature_extraction(img1);
score = quality_prediction(feature, svrmodel);

disp(['quality score  = ' num2str(score, '%0.4f')]);
figure(1);imshow(img1)