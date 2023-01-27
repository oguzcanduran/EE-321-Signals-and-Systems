clear all 
close all


%% Q5
load('xg.mat');
TS = sqrt(pi/(1000*8192));
out_1 = x_g;
for i = 1:3
out_1 = [out_1 x_g];
end
sound(out_1, 1/TS);

%% Q6
load('y_2.mat');
TS = sqrt(pi/(1000*8192));
out_2 = y_2;
for i = 1:3
out_2 = [out_2 y_2];
end
sound(out_2, 1/TS);


%% Q9
load("h_n.mat");
[y,Fs] = audioread('record.m4a');
music_new_1 = y(:,1);
music_new_2=y(:,2);
music_new = [conv(music_new_1,h_n),conv(music_new_1,h_n)];

audiowrite('record_out.wav',music_new,Fs);

