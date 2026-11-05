% Extract time and signal values from exported structure
t = out.simout.time;
y3 = out.simout.signals.values;

% Plot the amplified signal y3(t)
figure;
plot(t, y3, 'b-', 'LineWidth', 1.5);
grid on;
title('Task 3: Amplified Signal y_3(t) exported to Workspace');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('y_3(t) = 3 \cdot [x_1(t) + x_2(t)]');