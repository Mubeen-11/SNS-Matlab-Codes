clear
clc
close all

t = -3:0.1:3;
z = 0.5*(t.^2) + 2;

figure
plot(t,z)
grid on
xlabel("Time(s)")
ylabel("Amplitude")
title("Graph of z(t) = 0.5t^2 + 2 ")