% Written by Stephen Kemp
% For EE153 with Farid Dowla
% Lab 1 Problems 1 and 2
% 4/6/2018
clc;
clear all;
close all;

n = (1:20);
n1 = (1:39);
x1_n = stepseq(n(end), floor(n(end)/3));
x2_n = stepseq(n(end), floor(2*n(end)/3));
y1_n = expseq(n(end), 10, 0.7);
y2_n = expseq(n(end), 5, 5);
z1_n = cosineseq(n(end), pi/4);
z2_n = cosineseq(n(end), pi/6);

% Problem 2
a_n = conv(x1_n,x2_n);
b_n = conv(x1_n,y1_n);
c_n = conv(x1_n,z1_n);
d_n = conv(y1_n, y2_n);
e_n = conv(z1_n, z1_n);
f_n = conv(z1_n, z2_n);

figure(1);
subplot(3,1,1);
stem(n, x1_n);
title('Lab 1 Problem 1');
ylabel('x1');
xlabel('samples');


subplot(3,1,2);
stem(n, y1_n);
ylabel('y1');
xlabel('samples');

subplot(3,1,3);
stem(n, z1_n);
ylabel('z1');
xlabel('samples');

figure(2);

subplot(3,2,1);
stem(n1, a_n);
title('part a');

subplot(3,2,2);
stem(n1, b_n);
title('part b');

subplot(3,2,3);
stem(n1, c_n);
title('part c');

subplot(3,2,4);
stem(n1, d_n);
title('part d');

subplot(3,2,5);
stem(n1, e_n);
title('part e');

subplot(3,2,6);
stem(n1, f_n);
title('part f');


function x = stepseq(n, n0) 
% n - length of the sequence 
% n0 - how many zeros before ones 
  
if ((n0 > n) | n0 < 0 | n < 0) 
    error('Arguments must satisfy n > 0, n0 > 0, n0 < n') 
end 
  
x = [zeros(1,n0) ones(1, n-n0)]; 
stem(x) 
end

function x = expseq(NN, n0, alpha) 
% NN -- number of points 
% n0 -- how many preceding zeros 
%  Generates x(n) = alpha^(n-n0)*u(n-n0) 
%  ------------------------------------------ 
if ((n0 > NN) | n0 < 0 | NN < 0) 
    error('Arguments must satisfy n > 0, n0 > 0, n0 < n') 
end 
for n=1:NN 
x(n) = [((n-n0) > 0).*(alpha.^(n-n0-1))]; 
end 
  
stem(x)
end

function x = cosineseq(n, omega) 
% n - length of the sequence 
% omega - frequency 
  
x = cos(omega * (0:n-1)); 
stem(x) 
end