function Contrast_feature = Contrast_feat(I)
 Edi= Con_entropy(I); 
 n_Edi = Con_nEntropy(I);
 Moment= Con_Moment(I);
 Contrast_feature = [Edi  n_Edi Moment];
end

function Edi=  Con_entropy (I)
M=entropy(I);
Edi=[];
Imi=I-120;
I1 = min(max(Imi,0),255);
E1=entropy(I1)-entropy(I);
Imi=I-90;
I2 = min(max(Imi,0),255);
E2=entropy(I2)-entropy(I);
Imi=I-60;
I3 = min(max(Imi,0),255);
E3=entropy(I3)-entropy(I);
Imi=I-30;
I4 = min(max(Imi,0),255);
E4=entropy(I4)-entropy(I);
Imi=I+30;
I5 = min(max(Imi,0),255);
E5=entropy(I5)-entropy(I);
Imi=I+60;
I6 = min(max(Imi,0),255);
E6=entropy(I6)-entropy(I);
Imi=I+90;
I7 = min(max(Imi,0),255);
E7=entropy(I7)-entropy(I);
Imi=I+120;
I8 = min(max(Imi,0),255);
E8=entropy(I8)-entropy(I);
Edi=[Edi E8 E7 E6 E5 E4 E3 E2 E1];
end

function n_Edi = Con_nEntropy(I)
M=8;N=8;% M/N设置
[m,n,c]=size(I);
xb=round(m/M)*M;yb=round(n/N)*N;%找到能被整除的M,N
I=imresize(I,[xb,yb]);
[m,n,c]=size(I);
count =1;
mb=[];
for i=1:M
for j=1:N
  block =I((i-1)*m/M+1:m/M*i,(j-1)*n/N+1:j*n/N,:);%图像分成块
  Edi = Con_entropy (block);
  mb=[mb;Edi];
  n_Edi=mean(mb);
count = count+1;
end
end   
end

function moment = Con_Moment(I)
moment = [];
vector = Con_Moments(I);
moment = [moment;vector];
moment = abs(moment);
end