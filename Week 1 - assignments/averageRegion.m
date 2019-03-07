function averaged = averageRegion(image, region)
%AVERAGENEIGHBORS Replaces the pixel value by the average of a prespecified
%region
%  We simply iterate for each pixel and we assume the starting position is the
% upper left corner of the image. In addition, we move to the right
% (lateral displacement).
%
% Inputs:   image: RGB image (3 channels)
%           region: size of the region to average
%
% Outputs:  averaged: averaged image

B = ones(region, region)/ (region^2);
averaged = image;

for c = 1:size(image, 3)
    % Convolution - "weighted" average
    averaged(1:region, 1:region, c) = conv2(image(1:region, 1:region, c), B,'same');
end

averaged = uint8(averaged);

