clc;
clear;
close all;
% read an image
a = rgb2gray(imread('m.jpg'));
sg = rgb2gray(imread('m1.jpg'));
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
figure
for i = 1:8
    f = reshape(bi2de(c(:,i)),m,n);
    subplot(2,4,i)
    imshow(f)
    title(['Plane - ',num2str(i)])
end
figure
%Reconstructing Image with 1 plane replaced with information and displaying it
%Inserting 5th plane information of signature
for i = 1:8
    d = c;
    if i == 1
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
    else
        d(:,i) = g(:,5);
        d3 = reshape(bi2de(d),m,n);
        subplot(2,4,i)
        imshow(uint8(d3))
        title([' ',num2str(i),'th plane modified'])
    end
 
end
