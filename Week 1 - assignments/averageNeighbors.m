function averaged = averageNeighbors(neigh, image)
%AVERAGENEIGHBORS Replaces the pixel value by the average of the specified
%area around him.
% We simply use a 2D convolution which can be considered a weighted average
% (in this case we weight by 1/num_pixels^2)
%
% Inputs:   image: RGB image (3 channels)
%           neigh: number of neigbors to average (assumes neigh by neigh)
%
% Outputs:  averaged: averaged image

B = ones(neigh, neigh)/ (neigh^2);
averaged = image;

for c = 1:size(image, 3)
    % Convolution - "weighted" average
    averaged(:, :, c) = conv2(image(:, :, c), B,'same');
end

averaged = uint8(averaged);

