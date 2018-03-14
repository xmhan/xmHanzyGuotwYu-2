load mnist_all.mat;

T(1,:) = mean(train0);
T(2,:) = mean(train1);
T(3,:) = mean(train2);
T(4,:) = mean(train3);
T(5,:) = mean(train4);
T(6,:) = mean(train5);
T(7,:) = mean(train6);
T(8,:) = mean(train7);
T(9,:) = mean(train8);
T(10,:) = mean(train9);

for i = 1:10
    subplot(2,5,i);
    digitimage = reshape(T(i,:), 28, 28);
    image(rot90(flipud(digitimage), -1)), colormap(gray(256)), axis square tight off;
end