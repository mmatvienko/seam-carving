%imshow(removeVertical(imread('ut.jpg'), 100));

% n = removeHorizontal(imread('river.jpg'), 100);
% imshow(n);

num = 500;
img = imread('meta.jpg');
h = removeVertical(img, num);
subplot(1,3,1);
imshow(h);
g = removeHorizontal(img, num);
subplot(1,3,2);
imshow(g);
subplot(1,3,3);
z = removeHorizontal(h, num);
imshow(z);
