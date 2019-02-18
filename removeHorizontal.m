function [output] = removeHorizontal(im, numPixels)
    im = rot90(im);
    output = removeVertical(im, numPixels);
    
    output = rot90(output,3);
end