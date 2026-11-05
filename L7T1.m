clc;
clear;
close all;

%% Part A: Recording an Audio Signal
Fs = 8000;          
duration = 5;      

recObj = audiorecorder(Fs, 16, 1);

disp('Start speaking...');
recordblocking(recObj, duration); 
disp('Recording complete.');

audio = getaudiodata(recObj);

audiowrite('myRecording.wav', audio, Fs);

%% Part B: Importing and Plotting the Audio Signal
[x, Fs] = audioread('myRecording.wav');

N = length(x);
t = (0:N-1) / Fs;

figure;
plot(t, x);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Recorded Audio Signal');
grid on;

%% Part C: Playing the Audio Signal
disp('Playing complete recording...');
sound(x, Fs);
pause(length(x)/Fs + 1); 

% Divide into two halves and play separately
mid = floor(N/2);
firstHalf = x(1:mid);
secondHalf = x(mid+1:N);

disp('Playing first half...');
sound(firstHalf, Fs);
pause(length(firstHalf)/Fs + 1);

disp('Playing second half...');
sound(secondHalf, Fs);
pause(length(secondHalf)/Fs + 1);

% Extract and play middle one-third
startIndex = floor(N/3) + 1;
endIndex = floor(2*N/3);
middlePart = x(startIndex:endIndex);

disp('Playing middle one-third...');
sound(middlePart, Fs);
pause(length(middlePart)/Fs + 1);

%% Part D: Changing Playback Speed
disp('Normal playback...');
sound(x, Fs);
pause(length(x)/Fs + 1);

disp('Faster playback (1.5x)...');
sound(x, round(1.5*Fs));
pause(length(x)/(1.5*Fs) + 1);

disp('Slower playback (0.75x)...');
sound(x, round(0.75*Fs));
pause(length(x)/(0.75*Fs) + 1);

%% Part E: Exercises
disp('--- Running Part E Exercises ---');
% 1 & 2. Record 8-second audio, save, and plot
recObj_ex = audiorecorder(Fs, 16, 1);
disp('Start speaking for 8 seconds (Exercise)...');
recordblocking(recObj_ex, 8);
disp('Recording complete.');

x_new = getaudiodata(recObj_ex);
audiowrite('newRecording.wav', x_new, Fs);

N_new = length(x_new);
t_new = (0:N_new-1) / Fs;

figure;
plot(t_new, x_new);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('New 8-Second Audio Recording');
grid on;

% 3. Extract and play audio between 2 and 5 seconds
idx_start = round(2 * Fs) + 1;
idx_end = round(5 * Fs);
segment_2_to_5 = x_new(idx_start:idx_end);

disp('Playing audio between 2s and 5s...');
sound(segment_2_to_5, Fs);
pause(length(segment_2_to_5)/Fs + 1);

% 4. Play at twice the original playback speed
disp('Playing at double speed (2x)...');
sound(x_new, 2*Fs);
pause(length(x_new)/(2*Fs) + 1);

% 5. Determine total number of samples and display
fprintf('Total number of samples in new recording: %d\n', N_new);