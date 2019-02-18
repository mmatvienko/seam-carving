function [seam, carved] = carving(e, img)
    sz = size(img);
    carved = uint8(zeros([sz(1) sz(2) - 1 sz(3)]));
    arr = e(sz(1),:);
    [~, index] = min(arr);
    seam = index;

    count = 1;    
    % copy over all pixels in last row except minimum energy pixel
    for j = 1:sz(2) 
        if j ~= index
            carved(sz(1),count,1) = img(sz(1),j,1);
            carved(sz(1),count,2) = img(sz(1),j,2);
            carved(sz(1),count,3) = img(sz(1),j,3);

            count = count + 1;
        end
    end
    
    % start going up the image
    for i = (sz(1)-1):-1:1
        if index == sz(2) % on the right side
            [~, q] = min(e(i, index - 1:index));
            index = index - 2 + q;
        elseif index==1 % left side of image
             [~, q] = min(e(i, index:index + 1));
             index = index - 1 + q;
        else
            [~, q] = min(e(i, index - 1:index + 1));
            index = index - 2 + q;
        end
        
        count = 1; 
        % shift over row at height "i"
        for j = 1:sz(2)
            if j~=index
                carved(i,count,1) = img(i,j,1);
                carved(i,count,2) = img(i,j,2);
                carved(i,count,3) = img(i,j,3);
                count = count + 1;
            end
        end

        % add index to seam list
        seam = [seam, [index]];
    end
end