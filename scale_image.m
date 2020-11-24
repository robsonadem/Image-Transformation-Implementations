clear all
img=rgb2gray(imread('cat.jpg')); % Read an image and turn the rgb(3D Matrix) to grayscale (2D Matrix)
img_size=size(img);% This gives the dimensions of the image in [length,width]
length=img_size(1); %extract the length value from the img_size vector
width=img_size(2); %extract the width value from the img_size vector
scaling_factor=.5; % set desired scaling factor
meanval = mean2(img); % finds the mean pixel value of the image 

% Create a new image by creating a new ones matrix with the desired scaling
% factor (floor to make sure its an integer) 
% and then multiply each value with the mean pixel value to normalize the
% interpolation 
new_length=floor(scaling_factor*length);
new_width=floor(scaling_factor*width);
new_img = meanval*ones(new_length,new_width, 'uint8');

%The nested for loop goes through the image and places the pixel value of (i,j)
% to its (scaled_i & scaled_j) location 
for i=1:length % Rows
    for j=1: width %Columns
        if(scaling_factor<1)
            %scaling 
            %(floor to make sure our row and columns indices are integers)
            % adding +1 to offset pixels at (1,1) because matlab's indexing
            % starts with 1 unlike other languages that start with 0
            new_img(floor(scaling_factor*i)+1,floor(scaling_factor*j)+1)=img(i,j); 
        else 
            %scaling 
            new_img(scaling_factor*i,scaling_factor*j)=img(i,j);
        end
    end
end
currentFolder = pwd;
File   = 'output2.jpg';
imwrite(new_img, fullfile(currentFolder, File));

