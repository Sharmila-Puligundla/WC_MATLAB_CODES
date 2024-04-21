% uniform distribution


clear all; 
close all; 
clc; 

a = 5; 
b = 10; 
sample_size = 1000; 

x = linspace(a, b, 100); 
pdf = 1 / (b - a) * ones(size(x)); % PDF of uniform distribution
cdf = (x - a) / (b - a); 
cdf(cdf > 1) = 1; % Ensure CDF doesn't exceed 1

% Plot PDF
figure; 
plot(x, pdf, 'b-', 'LineWidth', 2); 
title('PDF of Uniform Distribution'); 
xlabel('Random Variable (x)'); 
ylabel('PDF f(x)'); 
grid on; 

% Plot CDF
figure; 
plot(x, cdf, 'r-', 'LineWidth', 2); 
title('CDF of Uniform Distribution'); 
xlabel('Random Variable (x)'); 
ylabel('CDF F(x)'); 
grid on; 
