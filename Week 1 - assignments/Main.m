%MAIN - Execute this file to run the code
%
% Other m-files required: reduceIntensity.m, averageNeighbors.m,
% averageRegion.m
%
% See also: reduceIntensity.m,  averageNeighbors.m, averageRegion.m
% Author: Alvaro F. Quilez
% email: alvaro.fquilez@gmail.com
% March 2019; Last revision: 7-March-2019
%------------- BEGIN CODE --------------

addpath('Pictures/') 
I = imread('wolf-1.jpg');
%imshow(I);

disp('Options: 1. Reduce intensity 2. Spatial average 3. Rotation 4. Average a region');
n = input('Enter a number: ');

% Sanity check - display error
if  n > 4 || n < 1
    error('Error. \nInput must be >1 but <4')
else
    ;
end

switch n
    case 1        
    %% Intensity reduction
    levels = input('Enter number of levels: ');  
    %%% Reduce intensity method
    [reduced, gray] = reduceIntensity(I, levels);
    %%% Show results
    imshow([I, reduced]);
    title('original vs reduced');
    
    case 2
    %% Spatial average    
    neigh = input('Enter a neighborhood: ');  
    % Sanity check
    if neigh <= 0
        error('Error. Input must be >= 1')
    end
   
    I = rgb2gray(I);
    averaged = averageNeighbors(neigh, I);
    %%% Show results
    figure(1);
    imshow([I, averaged]);
    title('original vs averaged');

    %%% Check
    figure(2);
    h = fspecial('average', [neigh, neigh]);
    check = uint8(filter2(h, I));
    imshow([I, check]);
    title('Inbuilt matlab function original vs averaged');
    
    case 3
    %% Rotation of the image
    angle = input('Enter an angle: ');      
    rot = imrotate(I, angle, 'nearest', 'crop');
    imshow([I, rot]);
    title('original vs rotated');
    
    case 4
    %% Average a region
    region = input('Enter a region: ');
    % Sanity check
    if region <= 0
        error('Error. Input must be >= 1')
    end    
    I = rgb2gray(I);
    averageR = averageRegion(I, region);
    %%% Show results
    figure(1);
    imshow([I, averageR]);
    title('original vs averaged');
    
end
	

