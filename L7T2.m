clc;
clear;
close all;

% Import recorded audio file from Task 1
[x, Fs] = audioread('myRecording.wav');

%% Part A: Convolution with a Short Sequence
h1 = [0.5, 0.5];          
y1 = conv(x, h1);        

tx = (0:length(x)-1) / Fs;
ty1 = (0:length(y1)-1) / Fs;

figure;
subplot(2,1,1);
plot(tx, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(ty1, y1);
title('Audio Signal After Convolution (h1 = [0.5 0.5])');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

disp('Playing original audio...');
sound(x, Fs);
pause(length(x)/Fs + 1);

disp('Playing processed audio (y1)...');
sound(y1, Fs);
pause(length(y1)/Fs + 1);

%% Part B: Convolution with Multiple Delayed Samples
h2 = [1, 0.5, 0.25, 0.125]; 
y2 = conv(x, h2);           

ty2 = (0:length(y2)-1) / Fs;

figure;
plot(ty2, y2);
title('Audio Signal After Convolution (h2)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

y2_play = y2 / max(1, max(abs(y2)));
disp('Playing processed audio (y2)...');
sound(y2_play, Fs);
pause(length(y2)/Fs + 1);

%% Part C: Producing an Audible Delay (Echo)
delayTime = 0.25;                  
D = round(delayTime * Fs);         

h3 = zeros(1, D + 1);
h3(1) = 1;                        
h3(D + 1) = 0.6;                   

y3 = conv(x, h3);

y3_play = y3 / max(1, max(abs(y3)));
disp('Playing audio with 0.25s echo delay...');
sound(y3_play, Fs);
pause(length(y3)/Fs + 1);

ty3 = (0:length(y3)-1) / Fs;
figure;
subplot(2,1,1);
plot(tx, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(ty3, y3);
title('Audio Signal with 0.25s Echo Delay (h3)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

%% Part D: Independent Investigation
experiments = [
    0.3, 0.25; 
    0.8, 0.25;  
    0.5, 0.75   
];

for k = 1:size(experiments, 1)
    a = experiments(k, 1);
    d_sec = experiments(k, 2);
    
    D_exp = round(d_sec * Fs);
    h_exp = zeros(1, D_exp + 1);
    h_exp(1) = 1;
    h_exp(D_exp + 1) = a;
    
    y_exp = conv(x, h_exp);
    y_exp_play = y_exp / max(1, max(abs(y_exp)));
    
    fprintf('Playing Experiment %d: a = %.1f, delay = %.2fs...\n', k, a, d_sec);
    sound(y_exp_play, Fs);
    pause(length(y_exp)/Fs + 1);
end