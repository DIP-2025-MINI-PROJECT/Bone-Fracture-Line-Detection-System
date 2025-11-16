clc;
clear;
close all;

img_orig = imread("C:\Users\shrey\OneDrive\Documents\Desktop\single bone.png");

% grayscale (xrays are always obviously "black and white"- but in case if an input is a three channel image) 
if size(img_orig,3) == 3
    img_gray = rgb2gray(img_orig);
else
    img_gray = img_orig;   
end

% double 
img_double = im2double(img_gray);

figure('Name', 'Fracture Detection Pipeline', 'WindowState', 'maximized');
subplot(2, 3, 1);
imshow(img_gray);
title('1. Original X-Ray Image');

%% image enhancement
img_enhanced = imadjust(img_double);
% anisotropic diffusion
img_enhanced = imdiffusefilt(img_enhanced, 'NumberOfIterations', 5);
subplot(2, 3, 2);
imshow(img_enhanced);
title('2. Enhanced & Denoised Image');

%% edge detection (canny)
canny_sigma = 1.5;
canny_thresh = [0.05 0.2]; 
edge_img = edge(img_enhanced, 'Canny', canny_thresh, canny_sigma);
subplot(2, 3, 3);

imshow(edge_img);
title('3. All Edges (Canny)');


%% region growing
[rows, cols] = size(img_enhanced);
figure; imshow(img_enhanced);
title('Click a point inside the bone for region growing');
[p_col, p_row] = ginput(1); %manual seed

seed_row = round(p_row);
seed_col = round(p_col);

close;   
tolerance = 0.1; 
%region growing
bone_mask = grayconnected(img_enhanced, seed_row, seed_col, tolerance);
bone_mask = imfill(bone_mask, 'holes');    % fill holes
bone_mask = bwareaopen(bone_mask, 200);    % remove small noise regions

subplot(2, 3, 4);
imshow(bone_mask);
title('4. Bone Mask (from Region Growing)');

%% all edges - bone outline = internal edges....basically the "fracture"

bone_outline = bwperim(bone_mask);
se_dilate = strel('disk', 2);
bone_outline_dilated = imdilate(bone_outline, se_dilate);
fracture_candidates = edge_img & ~bone_outline_dilated;
subplot(2, 3, 5);
imshow(fracture_candidates);
title('5. Fracture Candidates (Edges - Outline)');


%% output
min_fracture_size = 50; 
final_fractures = bwareaopen(fracture_candidates, min_fracture_size);
se_final = strel('disk', 1);
final_fractures_dilated = imdilate(final_fractures, se_final);
overlay_img = imoverlay(img_gray, final_fractures_dilated, 'red');
subplot(2, 3, 6);
imshow(overlay_img);
title('6. Final Detected Fracture (Overlay)');


