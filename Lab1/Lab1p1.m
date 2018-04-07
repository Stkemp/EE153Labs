% Written by Stephen Kemp
% For EE153 with Farid Dowla
% Lab 1 Problem 1
% 4/6/2018
clc;
clear all;
close all;

n = (1:20);
x_n = stepseq(n(end), floor(n(end)/3));
y_n = expseq(n(end), 10, 0.7);
z_n = cosineseq(n(end), pi/4);

figure(1);
subplot(3,1,1);
stem(n, x_n);
title('Lab 1 Problem 1');
ylabel('amplitude');


subplot(3,1,2);
stem(n, y_n);
ylabel('amplitude');

subplot(3,1,3);
stem(n, z_n);
ylabel('amplitude');
xlabel('samples');


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