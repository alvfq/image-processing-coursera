function [new_image, gray] = reduceIntensity(image, levels)
%REDUCEINTENSITY Reduce the intensity of the image to the specified number
%of levels.
% The function takes as an input an RGB image and performs a reduction of
% its intensity levels. Additionally, the gray version of the image is also
% returned.
% Inputs:   image: RGB image (3 channels)
%           levels: intensity levels, multiple of 2
% Output:   Image with reduced intensity levels (quantized)
%           Gray version of the image
 
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

