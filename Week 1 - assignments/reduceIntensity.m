function [new_image, gray] = reduceIntensity(image, levels)
%REDUCEINTENSITY Summary of this function goes here
%   Detailed explanation goes here
% Inputs:   image: RGB image (3 channels)
%           levels: intensity levels, multiple of 2
% Output:   Image with reduced intensity levels (quantized)
 
if rem(levels, 2) ~= 0
    msg = 'The number of levels needs to be a power of 2!';
    error(msg)
else
    gray = rgb2gray(image);
    % 256 levels gray image - calculate the difference between required and old
    new_levels = 256/levels;

    new_image = uint8(floor(double(image)/new_levels));
end
   

end

