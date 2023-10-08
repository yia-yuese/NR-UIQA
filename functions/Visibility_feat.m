function ENERGY = Visibility_feat(I)
I=rgb2gray(I);
[C,S] = wavedec2(I,3,'db1');
ENERGY=[];
cH1 = detcoef2('h',C,S,1);
cV1 = detcoef2('v',C,S,1);
cD1 = detcoef2('d',C,S,1);  % 1代表1级, 尺寸: 256x256
m = abs(cH1).^2;
n = abs(cV1).^2;
b = abs(cD1).^2;
[H W] = size(cH1);
p = 0.8;
ecH1 = log10(1+sum(sum(m,1),2)/(H*W));
ecV1 = log10(1+sum(sum(n,1),2)/(H*W));
ecD1 = log10(1+sum(sum(b,1),2)/(H*W));
E1 = (1-p)*(ecH1+ecV1)/2+p*ecD1;

cA2 = appcoef2(C,S,'db1',2); 
cH2 = detcoef2('h',C,S,2); 
cV2 = detcoef2('v',C,S,2);
cD2 = detcoef2('d',C,S,2);  % 2代表2级, 尺寸: 128x128
[i j]=size(cH2);
x = abs(cH2).^2;
y = abs(cV2).^2;
z = abs(cD2).^2;
ecH2 = log10(1+sum(sum(x,1),2)/(i*j));
ecV2 = log10(1+sum(sum(y,1),2)/(i*j));
ecD2 = log10(1+sum(sum(z,1),2)/(i*j));
E2 = (1-p)*(ecH2+ecV2)/2+p*ecD2;

cA3 = appcoef2(C,S,'db1',3); 
cH3 = detcoef2('h',C,S,3); 
cV3 = detcoef2('v',C,S,3);
cD3 = detcoef2('d',C,S,3);% 2代表2级, 尺寸: 64x64
[r z]=size(cH3);
x1 = abs(cH3).^2;
y1 = abs(cV3).^2;
z1 = abs(cD3).^2;
ecH3 = log10(1+sum(sum(x1,1),2)/(r*z));
ecV3 = log10(1+sum(sum(y1,1),2)/(r*z));
ecD3 = log10(1+sum(sum(z1,1),2)/(r*z));
E3 = (1-p)*(ecH3+ecV3)/2+p*ecD3;

ENERGY=[ENERGY;E1,E2,E3];
end

