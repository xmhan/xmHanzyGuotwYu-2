load mnist_all.mat;

O = (train0(1,:))';
O1 = double(O);
W1 = rand(100, 784);
W2 = rand(75, 100);
W3 = rand(50, 75);
W4 = rand(30, 50);
W5 = rand(20, 30);
W6 = rand(10, 20);

NET1 = W1*O1;
NET2 = W2*NET1;
NET3 = W3*NET2;
NET4 = W4*NET3;
NET5 = W5*NET4;
NET6 = W6*NET5;

for i = 1:10
    OUT(i,:) = 1/(1+exp(-NET6(i)));
end

display(OUT);