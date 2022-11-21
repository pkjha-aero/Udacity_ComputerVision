%%
clc; 
clear all;
close all;

%import image;

%% Variables
hsize = 11; % Filter size
sigma = 5;  % Std. Dev.

%% Read an image
img = imread("Pankaj_HeadShot.png");
figure
imshow(img);

%% Add noise
img_noise = add_noise_gaussian (img, 128);
figure
imshow(img_noise)

%% Define and apply filter
h = fspecial('gaussian', hsize, sigma);
figure
surf (h);

figure
imagesc (h);

img_out = imfilter(img_noise, h);
figure
imshow(img_out);

%% Function definitions
%% Add Gaussian noise to an image
function result = add_noise_gaussian (img, sigma)
    noise = randn(size(img)).*sigma;
    result = round (double(img) + noise);
    %result = img
end