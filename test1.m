load mnist_all.mat;

digit= test0(1,:);
digitImage = reshape(digit, 28, 28);
image(rot90(flipud(digitImage), -1)), colormap(gray(256)), axis square tight off;