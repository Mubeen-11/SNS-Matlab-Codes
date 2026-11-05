%% Task 3 - Part A: Three-Term Convolution System Setup
clc;
clear;
close all;

x = [1 2 3 4 2 1 0 0];
h = [1 0.5 0.25];

y_matlab = conv(x, h);
disp('MATLAB convolution output:');
disp(y_matlab);

Ts = 1;

x_padded = [x zeros(1, length(h)-1)];

t = (0:length(x_padded)-1)' * Ts;
inputData = [t x_padded']; 