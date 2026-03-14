%IIR using Chebyshev
clc;
close all;

rp = input('Enter passband ripple: '); %3
rs = input('Enter stopband ripple: '); %20
fs = input('Enter sampling frequency: '); %8000
fp = input('Enter passband frequency: '); %1200
fst = input('Enter stopband frequency: '); %1800

fn = fs / 2;
fpn = fp / fn;
fstn = fst / fn;

[N, wc] = cheb1ord(fpn, fstn, rp, rs); 
[b, a] = cheby1(N, rp, wc); 

[H, f] = freqz(b, a, 256, fs); 
Transferfunc = tf(b, a, (1/fs)); 
H_mag = 20 * log10(abs(H)); 

figure;
plot(f, H_mag);
grid on;
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');
title('Magnitude Response');