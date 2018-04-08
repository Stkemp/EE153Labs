% Written by Stephen Kemp
% For EE153 with Farid Dowla
% Lab 1 Problem 3
% 4/6/2018
clc;
clear all;
close all;

n = (1:50);
w = [0 : 0.01 : 3.1426];
x = cosineseq(n(end), 0.4);
y = expseq(n(end), 0, 0.5);
z = expseq(n(end), 0, -0.5);

X = dtft(x, w);
Y = dtft(y, w);
Z = dtft(z, w);

figure(1);
subplot(3,1,1);
stem(n,x);
title('Lab 1 Problem 3: Cosine Function');
ylabel('x');
xlabel('n(samples)');
subplot(3,1,2);
stem(w,abs(X));
ylabel('X Magnitude');
xlabel('\omega');
subplot(3,1,3);
stem(w,angle(X));
ylabel('X phase');
xlabel('\omega');

figure(2);
subplot(3,1,1);
stem(n,y);
title('Lab 1 Problem 3 Exponential Funtion \alpha = 0.5');
ylabel('y');
xlabel('n(samples)');
subplot(3,1,2);
stem(w,abs(Y));
ylabel('Y Magnitude');
xlabel('\omega');
subplot(3,1,3);
stem(w,angle(Y));
ylabel('Y phase');
xlabel('\omega');

figure(3);
subplot(3,1,1);
stem(n,z);
title('Lab 1 Problem 3 Exponential Funtion \alpha = -0.5');
ylabel('z');
xlabel('n(samples)');
subplot(3,1,2);
stem(w,abs(Z));
ylabel('Z Magnitude');
xlabel('\omega');
subplot(3,1,3);
stem(w,angle(Z));
ylabel('Z phase');
xlabel('\omega');

function [X] = dtft(x, w) 
% Computes Discrete-time Fourier Transform (DTFT) 
% [X] = dtft(x,n,w) 
% 
% X = DTFT values computed at frequencies given by the w  
% x = finite duration sequence  
% w = frequency (in omega) 
m = length(x); 
n = 1:m; 
numw = length(w); 
X = zeros(1,numw); 
for wi = 1:numw, 
    X(wi) = sum(x.*exp(-j.*w(wi).*n)); 
end 
stem(w, abs(X)) 
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