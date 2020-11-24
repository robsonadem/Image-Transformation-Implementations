clear all
img=(imread('cat.jpg')); % Read an image and turn the rgb(3D Matrix) to grayscale (2D Matrix)
img_size=size(img);% This gives the dimensions of the image in [length,width]
length=img_size(1); %extract the length value from the img_size vector
width=img_size(2); %extract the width value from the img_size
% When we perform 90 deg rotations we are in essence changing LxW to WxL as follows
new_length=width;
new_width=length;
% Create a new image by creating zeros matrix (black image)
% this enables us to see the translation of the image clearly
new_img = zeros(new_length, new_width, 'uint8');
%The nested for loop goes through the image and places the pixel value of (i,j)
% to its (rotated_i & rotated_j) IN CCW location
index=new_length;
for i=1:length % Rows
  for j=1: width %Columns
        new_img(index,i)=img(i,j);
        index=index-1;
  end
    index=new_length; % reset
end

currentFolder = pwd;
File   = 'output1.jpg';
imwrite(new_img, fullfile(currentFolder, File));

