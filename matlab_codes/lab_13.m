%IIR using butterworth
clc;
close all;

rp = input('Enter the passband ripple (in dB): '); %3.01
rs = input('Enter the stopband ripple (in dB): '); %15
fs = input('Enter the sampling frequency (in Hz): '); %2000
fp = input('Enter the passband frequency (in Hz): '); %500
fst = input('Enter the stopband frequency (in Hz): '); %750

fn = fs / 2; 
fpn = fp / fn;
fstn = fst / fn; 

[N, wc] = buttord(fpn, fstn, rp, rs); 
[b, a] = butter(N, wc); 
disp(N);
disp(wc);

[H, f] = freqz(b, a, 256, fs); 
Transferfunc = tf(b, a, (1/fs));
H_mag = 20 * log10(abs(H)); 
figure;
plot(f, H_mag);
grid on;
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');
title('Magnitude Response');
