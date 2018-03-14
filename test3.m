O = input('Input inputs:\n');
W = input('Input weights:\n');

[m, n] = size(O);
sum = 0;

for i = 1:m
    temp = O(i)*W(i);
    sum = sum + temp;
end;

NET = sum;
OUT = 1/(1+exp(-NET));

plot(NET, OUT, '--* r');

derivative = OUT*(1-OUT);
display(derivative);

% For small value of NET, the output of sigmoidal is approaching 0.
% For large value of NET, the output of sigmoidal is approaching 1.
% This sigmoidal function is commonly being used in the hidden layers of multilayer networks because it is differentiable.
% Another activation function can ve the pole linear.
% It is often used in the final layer of the multilayer since it is not differentiable.