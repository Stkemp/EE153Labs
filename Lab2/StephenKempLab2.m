
% Lab # 2 - Sampling & Aliasing 
clear all; 
close all; 
clf; 
  
fs = 9000;  % sampling frequency 
dur = 0.1;  % duration in time 
freq1 = 1000;  % Frequency of the signal 
freq2 = 3500; 
freq3 = 5000; 
  
  
t = 0 : (1/fs) : dur; 
x =  cos(2*pi*t*freq3 ) + cos(2*pi*t*freq1 ); 
tms = t*1000; 
  
figure(1); 
hp = plot( tms, x ); 
set(hp,'LineWidth',2) 
title('x = cos(2*pi*freq*t) )','FontSize',16) 
set(gca,'FontSize',12) 
ylabel('Amplitude','FontSize',14) 
disp('<CR> to play sound'),  pause 
sound( x/max(abs(x)), fs ); 
% disp('<CR> to continue'); 
  
figure(2) 
[z,w] = dtft01(x, length(x)); 
w = w*fs/2/pi;
plot(w, abs(z)); 
ylabel('Amplitude','FontSize',14)
xlabel('Frequency (Hz)','FontSize',14)
grid minor; 

 
function [H, W] = dtft01(h, N) %DTFT   calculate DTFT at N equally spaced frequencies 
%   Usage:   [H, W] = dtft(h, N) 
%      h : finite-length input vector, whose length is L 
%      N : number of frequencies for evaluation over [-pi,pi) 
%              ==> constraint: N >= L  
%      H : DTFT values (complex) 
%      W : (2nd output) vector of freqs where DTFT is computed 
% 
%  Jim McClellan,  31-Oct-1997 
%   F. Dowla, 2018 
% 
N = fix(N); 
L = length(h);  h = h(:);  %<-- for vectors ONLY !!! 
if( N < L ) 
   error('DTFT: # data samples cannot exceed # freq samples') 
end 
W = (2*pi/N) * [ 0:(N-1) ]'; 
mid = ceil(N/2) + 1; 
W(mid:N) = W(mid:N) - 2*pi;   % <--- move [pi,2pi) to [-pi,0) 
W = fftshift(W); 
H = fftshift( fft( h, N ) );  %<--- move negative freq components
end