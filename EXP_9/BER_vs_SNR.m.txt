% BER for AWGN


clear all; 
close all;  
clc; 

snr = -4:2:10; 
snr_linear = 10.^(snr/10); 
ber_awgn_exact = qfunc(sqrt(snr_linear)); 
ber_awgn_approx = 0.5*exp(-snr_linear./2);  
ber_rayleigh_exact = (0.5 - 0.5*sqrt(snr_linear./(snr_linear + 2))); 

figure;  
semilogy(snr, ber_awgn_exact, ':', 'linewidth', 3); 
title("AWGN Exact and Approx BER and Rayleigh"); 
xlabel("SNR (dB)"); 
ylabel("BER"); 
hold on; 
semilogy(snr, ber_awgn_approx, '--'); 
hold on;  
semilogy(snr, ber_rayleigh_exact, 'g');  
legend("AWGN Exact", "AWGN Approx", "Rayleigh Exact"); 
