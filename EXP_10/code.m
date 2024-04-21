% Simulate Wired and Wireless Communication Systems (Binary PAM and BPSK)
clear all;
close all; 
clc;

% Parameters
SNR_dB = 0:1:10; 
N_bits = 1e5;    
M = 2;           
Eb = 1;        

% Generate binary data
data = randi([0,1],1,N_bits);

% Modulation (Binary PAM)
symbols_pam = 2*data - 1; % Binary PAM modulation

% Modulation (BPSK)
symbols_bpsk = 2*data - 1; % BPSK modulation

% Initialization
BER_pam = zeros(size(SNR_dB));
BER_bpsk = zeros(size(SNR_dB));

% Noise variance calculation (assuming AWGN channel)
for i = 1:length(SNR_dB)
    SNR_linear = 10^(SNR_dB(i)/10);
    sigma_pam = sqrt(Eb/(2*SNR_linear));
    sigma_bpsk = sqrt(Eb/SNR_linear);
    
    % Add noise for Binary PAM
    noise_pam = sigma_pam * randn(size(symbols_pam));
    received_pam = symbols_pam + noise_pam;
    demodulated_pam = received_pam > 0;
    BER_pam(i) = sum(demodulated_pam ~= data)/N_bits;
    
    % Add noise for BPSK
    noise_bpsk = sigma_bpsk * randn(size(symbols_bpsk));
    received_bpsk = symbols_bpsk + noise_bpsk;
    demodulated_bpsk = received_bpsk > 0;
    BER_bpsk(i) = sum(demodulated_bpsk ~= data)/N_bits;
end

% Plot
figure;
semilogy(SNR_dB,BER_pam,'b-o',SNR_dB,BER_bpsk,'r-o');
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Bit Error Rate Comparison for Binary PAM and BPSK');
legend('Binary PAM (Wired)', 'BPSK (Wireless)');
grid on;
