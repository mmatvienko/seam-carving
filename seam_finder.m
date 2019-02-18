function [e] = seam_finder(gradient)
    e = gradient;
    sz = size(e);
    for i = 2:sz(1)
        for j = 1:sz(2)
            if j == 1 % cant check left of the image
                e(i,j) = e(i,j) + min(e(i-1,j),e(i-1,j+1));
            elseif j == sz(2) % cant check right of the image
                e(i,j) = e(i,j) + min(e(i-1,j-1),e(i-1,j));
            else % standard dp expression
                e(i,j) = e(i,j) + min(e(i-1,j-1),min(e(i-1,j),e(i-1,j+1)));
            end
        end
    end
end