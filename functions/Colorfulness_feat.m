function color_feature = Colorfulness_feat(I)
 F_color = color_feat(I);
 F_RelayP=Rayleigh_parameter(I);
 F_RelaKL= Rayleigh_KL(I);
 color_feature = [F_color  F_RelayP F_RelaKL];
end

function[feat]=color_feat(I)
feat=[]; 
I=double(I);
R =I(:,:,1);
G =I(:,:,2);
B =I(:,:,3);
rg = R-G;
by = 0.5*(R+G)-B;  
gray_I =rgb2gray(I);
[CE_gray CE_by CE_rg] = CE(I);
C2 =mean(mean(CE_rg));
C3 = mean(mean(CE_by));
C4 = mean(mean(CE_gray));
r1=mean(mean(by));
r2=mean(mean(rg));
d1=(std2(by))^2;
d2=(std2(rg))^2;
C5=0.3*((r1^2+r2^2)^(0.5)+(d1+d2)^(0.5));
I = rgb2hsv(I);
img_H=I(:,:,1);
img_S=I(:,:,2);
img_V=I(:,:,3);
[h w]=size(img_S);
C1=(sum(sum(img_S)))/(h*w);
feat=[feat C1 C2 C3 C4 C5];
end

function M=Rayleigh_parameter(I)
M=[];
I=double(I);
R =I(:,:,1)./255;
G =I(:,:,2)./255;
B =I(:,:,3)./255;
R1=reshape(R,[],1);
B1=reshape(B,[],1);
G1=reshape(G,[],1);
b1 =fitdist(R1,'rayleigh');
b2 =fitdist(G1,'rayleigh');
b3 =fitdist(B1,'rayleigh');
sigma1= b1.ParameterValues;
sigma2= b2.ParameterValues;
sigma3= b3.ParameterValues;
M=[M sigma1 sigma2 sigma3];
end

function F= Rayleigh_KL(I)
F=[];
I=double(I);
x=0.01:0.01:1;
ar=0.2343^2;
ag=0.2874^2;
ab=0.3081^2;
y1=x./ar.*exp(-(x.^2./(2*ar)));
y2=x./ag.*exp(-(x.^2./(2*ag)));
y3=x./ab.*exp(-(x.^2./(2*ab)));
s1=polyarea(x,y1);
s2=polyarea(x,y2);
s3=polyarea(x,y3);
y1=(0.01*y1)./s1;
y2=(0.01*y2)./s2;
y3=(0.01*y3)./s3;
R =I(:,:,1)./255;
G =I(:,:,2)./255;
B =I(:,:,3)./255;
R1=reshape(R,[],1);
B1=reshape(B,[],1);
G1=reshape(G,[],1);
br=histogram(R1,100,'normalization','probability');
br=br.Values;
bg=histogram(G1,100,'normalization','probability');
bg=bg.Values;
bb=histogram(B1,100,'normalization','probability');
bb=bb.Values;
A1= KL_JS_div(br,y1);
A2= KL_JS_div(bg,y2);
A3= KL_JS_div(bb,y3);
F=[F A1 A2 A3];
end





