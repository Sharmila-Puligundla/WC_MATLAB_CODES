% Two ray model

clear all; 
close all;  
clc;  

freq = 9*10^8;  
d = 1:0.1:100000; 
ht = 50; 
hr = 2; 
Gref = 1; 
Glos = 1; 
Pt = 10^-3;

% Two-ray ground reflection model  
dlos = sqrt(d.^2 + (ht - hr)^2); 
dref = sqrt(d.^2 + (ht + hr)^2); 

lambda = 3*10^8 / freq; 
gamma = 1; 

phi = (2*pi*(dref - dlos)) / lambda; % Phase difference

% Received power calculation
Pr = Pt * (lambda / (4 * pi))^2 * abs((sqrt(Glos) ./ dlos) + (gamma * sqrt(Gref) * exp(-1i * phi)) ./ dref).^2; 

% Plotting the received power vs distance
figure; 
semilogx(d, Pr); 
xlabel('Distance (m)'); 
ylabel('Power (W)');  
title('Received Power vs Distance');  

% Plotting in dB scale
figure; 
semilogx(d, 10*log10(Pr)); 
xlabel('Distance (m)'); 
ylabel('Power (dB)');  
title('Received Power vs Distance (dB)');
