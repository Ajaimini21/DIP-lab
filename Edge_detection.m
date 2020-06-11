clc;
clear;
close all;
% read an image
a = rgb2gray(imread('m.jpg'));
sg = rgb2gray(imread('m.jpg'));
% Read image size
[m,n] = size(a);
b = double(a);
s = double(sg);
% convert each pixel into binary using matlab command "de2bi" which returns
% array of bits of pixel value
c = de2bi(b,8,'right-msb');
g = de2bi(s,8,'right-msb');
subplot(121)
imshow(a)
title('Original Image')
subplot(122)
imshow(sg)
title('Signature')
%Showing Each plane
Figure
for i = 1:8
    f = reshape(bi2de(c(:,i)),m,n);
    subplot(2,4,i)
    imshow(f)
    title(['Plane - ',num2str(i)])
End
Figure
%Reconstructing Image with 1 plane replaced with information and displaying it
%Inserting 5th plane information of signature
for i = 1:8;
    d = c;
    if i == 1;
%         d(:,1) = 0;
        d(:,1) = g(:,5);
        d1 = reshape(uint8(bi2de(d)),m,n);
        subplot(2,4,1)
        imshow(uint8(d1))
        title([' ',num2str(i),'st plane modified'])
    elseif i == 2
        d(:,2) = g(:,5);
        d1 = reshape(bi2de(d),m,n);
        subplot(2,4,2)
        imshow(uint8(d1))
        title([' ',num2str(i),'nd plane modified'])
    elseif i == 3
        d(:,3) = g(:,5);
        d1 = reshape(bi2de(d),m,n);
        subplot(2,4,3)
        imshow(uint8(d1))
        title([' ',num2str(i),'rd plane modified'])
    Else
        d(:,i) = g(:,5);
        d3 = reshape(bi2de(d),m,n);
        subplot(2,4,i)
        imshow(uint8(d3))
        title([' ',num2str(i),'th plane modified'])
    End
End
%% Edge Detection 
% Using Sobel, canny Filter and dwt2
im = rgb2gray(imread('flower.jpg'));


subplot(131)
imshow(im)
title('Original')
ed = edge(im,'sobel');
ed1 = edge(im,'canny');
subplot(132)
imshow(ed)
title('Using Sobel Filter')
subplot(133)
imshow(ed1)
title('Using Canny Filter')
%% High pass filtering
kerhp = [-1 -1 -1;-1 8 -1;-1 -1 -1];
kerlp = 1/9 * [1 1 1;1 1 1;1 1 1];
im = rgb2gray(imread('flower.jpg'));
subplot(131)
imshow(im)
title('Original')
hp = imfilter(im,kerhp);
lp = imfilter(im,kerlp);
subplot(132)
imshow(hp)
title('High pass filtered image')
subplot(133)
imshow(lp)
title('Low pass filtered image')
%% Watermarking using dwt2
watermark('lena.png','sign.jpg')
%% dwt2 edge detection
clc; clear;close all
rgbimage= rgb2gray(imread('flower.jpg'));
[numrows,numcols]=size(rgbimage);
%wfilters returns the pair of type filters associated with the orthogonal or biorthogonal wavelet wname.
[LoD,HiD] = wfilters('haar','d');
[cA,cH,cV,cD] = dwt2(rgbimage,LoD,HiD,'mode','symh');
subplot(2,2,1)
%plot using approximation coefficients.
imagesc(cA)
colormap gray
title('Approximation')
subplot(2,2,2)
%plot using horizontal coefficients.
imagesc(cH)
colormap gray
title('Horizontal')
subplot(2,2,3)
%plot using vertical coefficients.
imagesc(cV)
colormap gray
title('Vertical')
subplot(2,2,4)
%plot using diagonal coefficients.
imagesc(cD)
colormap gray
title('Diagonal')
