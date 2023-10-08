function [score_KL, score_JS] = KL_JS_div(vec1, vec2)
% Input: vec1: vector 1, vec2: vector 2
% Output: score_KL: KL divergence, source_JS: JS divergence
% Author: kailugaji
% https://www.cnblogs.com/kailugaji/
 
% Make sure vec1 and vec2 sum to 1
if any(vec1(:))
    vec1 = vec1/sum(vec1(:));
end
  
if any(vec2(:))
    vec2 = vec2/sum(vec2(:));
end
 
% Compute Kullback-Leibler Divergence
score_KL = sum(sum(vec1.* log(eps + vec1./(vec2+eps))));
 
% Compute Jensen-Shannon Divergence
score_JS = (sum(sum(vec1.* log(eps + vec1./((vec1+vec2)./2+eps))))+sum(sum(vec2.* log(eps + vec2./((vec1+vec2)./2+eps)))))./2;
 
if vec1==vec2
    score_KL=0;
    score_JS=0;
end
