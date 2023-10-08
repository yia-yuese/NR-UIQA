function vectors = Con_Moments(img)
    lab = rgb2lab(img);
    L_Img = lab(:,:,1);
    A_Img = lab(:,:,2);
    B_Img = lab(:,:,3);
    [m,n] = size(L_Img);
    N = m*n;
 
    % 求一阶矩-均值
    hMean = mean2( L_Img );
    sMean = mean2( A_Img );
    vMean = mean2( B_Img );
 
    % 求二阶矩-方差
    hSig = sqrt( sum(sum((L_Img-hMean).^2))/N );
    sSig = sqrt( sum(sum((A_Img-sMean).^2))/N );
    vSig = sqrt( sum(sum((B_Img-vMean).^2))/N );
 
    % 求三阶矩-斜度
    h3   = sum( sum( (L_Img-hMean).^3 ) );
    hSke = ( h3/N )^(1/3);
    s3   = sum( sum( (A_Img-sMean).^3 ) );
    sSke = ( s3/N )^(1/3);
    v3   = sum( sum( (B_Img-vMean).^3 ) );
    vSke = ( v3/N )^(1/3);
    
    %求四阶矩—峰度
     h4   = sum( sum( (L_Img-hMean).^4 ) );
    hKu = ( h4/N )^(1/4)-3;
    s4   = sum( sum( (A_Img-sMean).^4 ) );
    sKu = ( s4/N )^(1/4)-3;
    v4   = sum( sum( (B_Img-vMean).^4 ) );
    vKu = ( v4/N )^(1/4)-3;
 
    vectors = [ hMean, hSig, hSke,hKu, sMean, sSig, sSke,sKu, vMean, vSig, vSke,vKu ];
end