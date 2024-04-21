% AWGN

fs = 1000; 
t = 0:1/fs:1-1/fs; 
f1 = 10; 
A = 1; 
SNR_dB = 10; 

% Generate a sinusoidal signal
signal = A * sin(2*pi*f1*t);

% Generate AWGN
noise_power = 10^(-SNR_dB/10); % Noise power
noise = sqrt(noise_power) * randn(size(t)); 

% Add noise to the signal
noisy_signal = signal + noise;

% Plot the original signal and the noisy signal
figure;
plot(t, signal, 'b', t, noisy_signal, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('Effect of AWGN on Signal');
legend('Original Signal', 'Noisy Signal');
grid on;

