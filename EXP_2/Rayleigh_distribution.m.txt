% Rayleigh distribution
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
pdf_re_rv1 = (x ./ (sigma1^2)) .* exp(-(x).^2 / (2*sigma1^2));
pdf_re_rv2 = (x ./ (sigma2^2)) .* exp(-(x).^2 / (2*sigma2^2));
pdf_re_rv3 = (x ./ (sigma3^2)) .* exp(-(x).^2 / (2*sigma3^2));

% Plot PDFs
figure;
plot(x, pdf_re_rv1, 'b-', 'LineWidth', 2);
hold on;
plot(x, pdf_re_rv2, 'r-', 'LineWidth', 2);
plot(x, pdf_re_rv3, 'g-', 'LineWidth', 2);
hold off;

% Legend
lgd = legend({'\mu_1=0 ; \sigma_1=1.5', '\mu_2=0 ; \sigma_2=1', '\mu_3=-2 ; \sigma_3=5'}, 'TextColor', 'black');
title('PDF');
xlabel('Random Variable (x)');
ylabel('PDF f(x)');
grid on;
