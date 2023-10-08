clear all;clc;tic;

%% Load data
load('SAUD_feature_mat.mat');
feature_vector_num = 42;

feature_mat_scaled = zeros(size(SAUD_feature_mat));
for i = 1:size(feature_mat_scaled,2)
    feature_mat_scaled(:,i) = mapminmax(SAUD_feature_mat(:,i)')';
end
save feature_mat_scaled feature_mat_scaled

SAUD_feature_mat = feature_mat_scaled;

load('SAUD_MOS.mat');  %加载主观分数
score_matrix =SAUD_MOS;

%% Completely randomly selected, 80% data were trained and 20% data were tested
num_image = 1000;
N=10;
cost = 16384;
gamma = 0.0043;
c_str = sprintf('%f',cost);
g_str = sprintf('%.2f',gamma);
libsvm_options = ['-s 3 -t 2 -g ',g_str,' -c ',c_str];
train_data = zeros(num_image*0.8,feature_vector_num);
train_label = zeros(num_image*0.8,1);
test_data = zeros(num_image*0.2,feature_vector_num);
test_label = zeros(num_image*0.2,1);
spear_results = zeros(1,N);

Kendall_results = zeros(1,N);

sumplcc = zeros(1,10);
sumsrcc = zeros(1,10);
sumrmse = zeros(1,10);
sumkrcc = zeros(1,10);

for i = 1:N
    %train/test label
    rand_array = randperm(num_image);
    train_array = rand_array(1:num_image*0.8);
    test_array = rand_array(num_image*0.8+1:num_image);

for j = 1:length(train_array)
    train_data(j,:) = SAUD_feature_mat(train_array(j),:);
    train_label(j) = score_matrix(train_array(j),:)';    
end

for k = 1:length(test_array)
    test_data(k,:) = SAUD_feature_mat(test_array(k),:);
    test_label(k) = score_matrix(test_array(k),:)'; 
end

%% SVR 
svrmodel = svmtrain(train_label,train_data,libsvm_options); 
[predict_score, ~, ~] = svmpredict(test_label, test_data, svrmodel);
save svrmodel

fsimValues = predict_score;
premos = test_label;
scatter(fsimValues,premos,20,'b','filled');

beta(1) = max(premos);
beta(2) = 10;
beta(3) = mean(fsimValues);
beta(4) = 0.1;
beta(5) = 0.1;

[bayta ehat,J] = nlinfit(fsimValues,premos,@logistic,beta);
[ypre junk] = nlpredci(@logistic,fsimValues,bayta,ehat,J);
%% Performance
plcc = corr(premos, ypre, 'type','Pearson'); %pearson linear coefficient
srcc = corr(predict_score, test_label, 'type', 'Spearman');
krcc = corr(predict_score, test_label, 'type', 'kendall'); 
rmse = sqrt(sum((ypre - premos).^2) / length(premos));
sumplcc(1,i) = plcc;
sumsrcc(1,i) = srcc;
sumkrcc(1,i) = krcc;
sumrmse(1,i) = rmse;
 end
%% Results (1000 iterations)
disp([mean(sumsrcc) mean(sumkrcc) mean(sumplcc) mean(sumrmse)])
%% %%%%
toc;