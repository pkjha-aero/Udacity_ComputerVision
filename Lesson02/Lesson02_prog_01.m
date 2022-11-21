%%
clc; 
clear all;
close all;

%import image;

%% Read an image and extract values
img = imread("Pankaj_HeadShot.png");
figure
imshow(img);

img2 = imread("Pic2.jpg");
figure
imshow(img2);

size1 = size(img);
size2 = size(img2);

row_min = min(size1(1), size2(1));
col_min = min(size1(2), size2(2));

img = img(1:row_min, 1:col_min, :);
img2 = img2(1:row_min, 1:col_min, :);

imgreen = img(:, :, 2);
figure
imshow(imgreen)

%%
disp('Image size: ')
disp(size(img));

disp('Image class: ')
disp(class(img));

disp('Extract a 2D slice between rows 101 to 103 and columns 201 to 203 (inclusive)')
disp(img(101:103, 201:203));

figure
line([1 512], [256, 256], 'color', 'r')

figure
plot(imgreen(256,:));

%% Increase Intensity
img_intensity_increased = scale(img, 1.5);
figure
imshow(img_intensity_increased)

%% Reduce Intensity
img_intensity_reduced = scale(img, 0.5);
figure
imshow(img_intensity_reduced)

%% Blend two images
blended_img = blend_images (img, img2, 0.75);
figure
imshow(blended_img)

%% Add noise
img_noise = add_noise_gaussian (img, 64);
figure
imshow(img_noise)

%% Difference of two images
img_diff = diff_images(img, img2);
figure
imshow(img_diff)

figure
imshow(blend_images (diff_images(img, img2), diff_images(img2, img), 0.5))

%% Gaussian distribution
gaussian (10000, 164)

%% Define functions
%% Gaussian distrubution
function gaussian (size_n, sigma)
    noise = randn([1, size_n]).*sigma;
    [n, x] = hist(noise, linspace(min(noise), max(noise), 21));
    %disp([x; n]);
    figure
    plot(x, n);
end

%% Scale an image
function result = scale (img, value)
    result = value .* img;
end

%% Blend two images
function blended_img = blend_images (img1, img2, alpha)
    blended_img = alpha*img1 + (1.0 - alpha)*img2;
end

%% Add Gaussian noise to an image
function result = add_noise_gaussian (img, sigma)
    noise = randn(size(img)).*sigma;
    result = round (double(img) + noise);
    %result = img
end

%% Difference of two images
function result = diff_images (img1, img2)
    result = abs(img1 - img2);
end