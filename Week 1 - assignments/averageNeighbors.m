function averaged = averageNeighbors(neigh, image)
%AVERAGENEIGHBORS Replaces the pixel value by the average of a 3x3 area
%around him
% For now the function assumes the average is computed using a 3x3 area. We
% simply iterate for each pixel and we assume the starting position is the
% upper left corner of the image. In addition, we move to the right
% (lateral displacement).
%
% Inputs:   image: RGB image (3 channels)
%           neigh: number of neigbors to average (assumes neigh by neigh)
%
% Outputs:  averaged: averaged image

% Assume we move around the 3x3 area - maximum number of movements
B = ones(3,3)/9;
averaged = image;

for c = 1:size(image, 3)
    % Convolution - "weighted" average
    averaged(1:neigh, 1:neigh, c) = conv2(image(1:neigh, 1:neigh, c), B,'same');
end

averaged = uint8(averaged);

