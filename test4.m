O = input('Input inputs:\n');
W1 = input('Input first weights:\n');
W2 = input('Input second weights:\n');

NET1 = W1*O;
NET2 = W2*NET1;
n = length(NET2);

for i = 1:n 
    OUT(i,:) = 1/(1+exp(-NET2(i)));
end

display(OUT);