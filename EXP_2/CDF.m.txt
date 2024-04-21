%CDF

clc;
clear all;
close all;

mu1 = 0;
sigma1 = 1.5;
mu2 = 0;
sigma2 = 1;
mu3 = -2;
sigma3 = 2;
sample_size = 1000;

% Generate random samples
random_samples = mu1 + sigma1 * randn(sample_size, 1);

% Define range of x values
x = linspace(-5, 5, 1000);

% Calculate PDF values for each distribution
pdf_value1 = (1 / (sigma1 * sqrt(2*pi))) * exp(-(x-mu1).^2 / (2*sigma1^2));
pdf_value2 = (1 / (sigma2 * sqrt(2*pi))) * exp(-(x-mu2).^2 / (2*sigma2^2));
pdf_value3 = (1 / (sigma3 * sqrt(2*pi))) * exp(-(x-mu3).^2 / (2*sigma3^2));

% Calculate CDF values for the first distribution
cdf_value = 0.5 * (1 + erf((x - mu1) / (sigma1 * sqrt(2))));

% Plot PDFs
figure;
plot(x, pdf_value1, 'b-', 'LineWidth', 2);
hold on;
plot(x, pdf_value2, 'r-', 'LineWidth', 2); 
plot(x, pdf_value3, 'g-', 'LineWidth', 2); 
hold off;
lgd = legend('PDF1: \mu=0, \sigma=1.5', 'PDF2: \mu=0, \sigma=1', 'PDF3: \mu=-2, \sigma=2');
title('PDF of Gaussian Distributions');
xlabel('Random Variable (x)');
ylabel('PDF F(x)');
grid on;

% Plot CDF
figure;
plot(x, cdf_value, 'k-', 'LineWidth', 2);
title('CDF of Gaussian Distribution');
xlabel('Random Variable (x)');
ylabel('CDF F(x)');
grid on;
