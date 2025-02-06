%% part 1
clc;clear;
% try to use the build in function conv2 to solve the edge dection problem
img =double(rgb2gray(imread('picture/input.png')))/255; %load the inmage in

% 1. add some noise to the image and remove the noise
imgn = imnoise(img, 'salt & pepper', 0.02);
figure;imshow((imgn));
% try to use the average filter to reduces noise
filter = 1/9*[1 1 1;1 1 1;1 1 1];
imgdn = conv2(imgn, filter,'same');
figure(2);imshow([imgn,imgdn]);

imgdn2 = filter2(filter,imgn,'same');
figure(3);imshow([imgn,imgdn2]);

% 2 try differet filters to do the edge detection
filter_edge = [-1,0,1]; %you can change the edge filte whatever you like here
img_edge = conv2(img, filter_edge,'same');
imshow([img,img_edge])

% 3 horizontal and vertical edges.
filter_edge = [-1,0,1]; %you can change the edge filte whatever you like here
edgeh = conv2(img, filter_edge,'same');
edgev = conv2(img, filter_edge','same');
figure(4);
imshow([img,edgeh,edgev,sqrt(edgeh.^2 + edgev.^2)]); title('1. Image, 2. Horizontal Edge, 3. Vertical Edge, 4. Magnitudes');

%% Part 2 
% try to write your own convolution function to compute the edge in the picture
clc;clear;
img = double(rgb2gray(imread('picture/input.png')))/255;
filter_own =[-1,0,1;-2,0,2;-1,0,1]; % you can define the filter whatever you like
edge_new_conv = new_conv(img,filter_own); %Note: Written more for clarity than efficiency!
figure(5); imshow(edge_new_conv); % to visualise the result