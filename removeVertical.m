function [output] = removeVertical(im, numPixels)
    output = im;
    for k = 1:numPixels
        e = seam_finder(imgradient(rgb2gray(output)));
        [seam, output] = carving(e, output);
        % output = carving(e, output);
        disp(k);
    end
end

