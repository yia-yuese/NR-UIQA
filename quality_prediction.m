function score= quality_prediction(feature, svrmodel)
test_label =76; % In the prediction phase, the test_label can be unknown. Here, we simply set to 1 .
[pred_mos, ~, ~] = svmpredict(test_label, feature, svrmodel);
score=pred_mos;