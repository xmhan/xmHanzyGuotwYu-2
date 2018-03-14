load mnist_all.mat;

O = (train9(1,:))';
TARGET = [0; 0; 0; 0; 0; 0; 0; 0; 0; 1];
trainrate = 0.01+0.1*rand(1,1);

O1 = double(O);
W1 = rand(16, 784)*10-5;
W2 = rand(10, 16)*10-5;

NET1 = W1*O1;
NET2 = W2*NET1;

for i = 1:10
     net= fixptbestexp(-NET2(i),sfix(7));
    OUT(i,:) = 1/(1+net);
end

ERROR = abs(TARGET - OUT);
sigma = OUT .* (1-OUT) .* ERROR;
delta = trainrate * sigma * NET1';

W22 = W2 + delta;
NET22 = W22*NET1;

for j = 1:10
     net2= fixptbestexp(-NET22(i),sfix(7));
    OUT2(i,:) = 1/(1+net2);
end

display(OUT);
display(OUT2);