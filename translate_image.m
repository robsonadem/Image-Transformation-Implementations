clear all
img=rgb2gray(imread('cat.jpg')); % Read an image and turn the rgb(3D Matrix) to grayscale (2D Matrix)
img_size=size(img);% This gives the dimensions of the image in [length,width]
length=img_size(1); %extract the length value from the img_size vector
width=img_size(2); %extract the width value from the img_size vector
translation_vector=[50;50]; % translation_vector
translation_factor_i=translation_vector(1);% extract translation factor for x dir (i)
translation_factor_j=translation_vector(2);% extract translation factor for y dir (j)
% Create a new image by creating zeros matrix (black image)
% this enables us to see the translation of the image clearly
new_length=length+translation_factor_i;
new_width=width+translation_factor_j;
new_img = zeros(new_length,new_width,'uint8');
%The nested for loop goes through the image and places the pixel value of (i,j)
% to its (translated_i & translated_j) location 
for i=1:length % Rows
    for j=1: width %Columns
        % Translate the image
        new_img(i+translation_factor_i,j+translation_factor_j)=img(i,j);
    end
end
currentFolder = pwd;
File   = 'output3.jpg';
imwrite(new_img, fullfile(currentFolder, File));

