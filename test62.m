load mnist_all.mat;

O = (train9(1,:))';
TARGET = [0; 0; 0; 0; 0; 0; 0; 0; 0; 1];
trainrate = 0.01+0.1*rand(1,1);

O1 = double(O);
W1 = rand(50, 784)*10-5;
W2 = rand(16, 50)*10-5;
W3 = rand(10, 16)*10-5;

NET1 = W1*O1;
NET2 = W2*NET1;
NET3 = W3*NET2;

for i = 1:10
    net1= fixptbestexp(-NET3(i),sfix(7));
    OUT(i,:) = 1/(1+net1);
end

ERROR = abs(TARGET - OUT);
sigma3 = NET3 .* (1-NET3) .* ERROR;
sigma2 = NET2 .* (1-NET2) .* (W3'*sigma3);
delta2 = trainrate * sigma2 * NET1';

W22 = W2 + delta2;
NET22 = W22*NET1;

ERROR2 = abs(NET22 - NET2);
sigma22 = NET22 .* (1-NET22) .* ERROR2;
sigma1 = NET1 .* (1-NET1) .* (W22'*sigma22);
delta1 = trainrate * sigma1 * O1';

W12 = W1 + delta1;
NET12 = W12*O1;
NET23 = W22*NET12;
NET32 = W3*NET23;

for j = 1:10
    net2= fixptbestexp(-NET32(i), sfix(7));
    OUT2(i,:) = 1/(1+net2);
end

display(OUT);
display(OUT2);

% After the computations, left-side Dj is equal to the right-side.
% Thus, the formula is correct. 