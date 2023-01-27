close all;
%% Q1

pol = [40*pi/180, -40*pi/180, 50*pi/180, -50*pi/180, 60*pi/180, -60*pi/180];
zer = [ 1*pi/99, -1*pi/99, 2*pi/3, -2*pi/3, 4*pi/5, -4*pi/5 ]; 

c_p = real(poly(9*(exp(1i.*pol))/10));
c_z = real(poly(exp(1i.*zer)));

disp(c_z);
disp(c_p);

hn = zeros(2000,1);
x = zeros(2000,1);
x(1:7) = coef_z(1:7);
for i = 9:2000
    hn(i)=x(i-8);
    for k=2:7
    hn(i)=hn(i)-coef_p(k)*hn(i-k+1);
    end
    hn(n)=hn(i)/coef_p(1);
end
save('hn.mat', 'hn');
disp(hn(1:80));
figure(1)
indis = 0:1:64;
hn = hn(6:70);
stem(indis,hn);
title('h[n] vs n')
ylabel('h[n]');
xlabel('n');



k = -1:0.001:1;
ome = 0:pi/500:2*pi;
figure(2);
hold on
plot(cos(ome), sin(ome));
hold on
scatter(real((exp(1i.*z))),imag((exp(1i.*z))),'r');
axis tight;
hold on
scatter(real(9*(exp(1i*p))/10),imag(9*(exp(1i*p))/10),'x');
axis tight
title('Poles and Zeros of H(z)')
ylabel('Im \{z\}');
xlabel('Re \{z\}');
w = -pi:0.001:pi-0.001;
s=size(w,2);
for i = 1:s
x = 1;
for k = 1:6
x = x*(exp(1j*w(i))-9*(exp(1j.*p(k)))/10);
end
p1(i)=1/x;
end


for i = 1:s
x = 1;
for k = 1:6
x = x*(exp(1j*w(i))-(exp(1j.*z(k))));
end
z1(i)= x;
end


figure(3);
hz = z1 .* p1/1021;
plot(w,abs(hz));
title('|H(e^j^w)| vs \omega');
xlabel('\omega (rad/s)');
ylabel("|H(e^j^w)|")
axis tight


%% Q2
n_2 = 0:1:1023;
xf = cos((n_2.^2).*(pi/512));
figure(4);
plot(n_2,xf)
save('x_f.mat', 'xf');
xlabel('n');
ylabel('x_1[n]');
title('x_1[n]');
axis tight
n_3 = 0:1:8191;
xg = cos((n3.^2).*(pi/8192));
save('x_g.mat', 'xg');
figure(5);
plot(n3,xg);
title('x_2[n]');
ylabel('x_2[n]');
xlabel('n');
axis tight
%% Q3

y1= zeros(1, 1024);
for n=9:1024
    for i= 1:7
        y1(n)=y1(n)+coef_z(i)*xf(n-i+1);
    end
end

figure(6);
stem(1:1024,y1)
axis tight
title('y_1[n] vs n');
xlabel('n');
ylabel('y_1[n]');




y2= zeros(8192, 1);
for n=9:8192
    for i= 1:7
        y2(n)=y2(n)+coef_z(i)*xg(n-i+1)-coef_p(i)*y2(n-i+1);
    end
end


figure(7);
stem(1:8192,y2)
title('y_2[n] vs n');
xlabel('n');
ylabel('y_2[n]');
axis tight

%% Q4 5 
y_1 =conv(hn, xf);
figure(10);
plot(1:1024,y_1(1:1024));
title('y1[n] vs n');
ylabel('y1[n]');
xlabel('n');
axis tight
sound(y1);
save('q4.mat', 'y_1');
audiowrite('q4.wav',y_1,48000);

y_2 = conv(hn,xg);
figure(11);
plot(1:8192,y_2(1:8192));
title('y2[n] vs n');
ylabel('y2[n]');
xlabel('n');
axis tight
sound(xg);
sound(y_2);
save('q5.mat', 'y_2');
audiowrite('q5.wav',y_2,48000);


%% Q6

Ts = sqrt(pi/8192000);
weq = -pi/Ts:0.001/(fix(1/Ts+1)*Ts):pi/Ts-0.001/Ts;
Heq=zeros(length(weq),1);
for i=1:length(weq)-4000
    Heq(i)= hz(fix(i*Ts+1)) + 1j*(hz(fix(i*Ts+1))-hz(fix(i*Ts)+2))/fix(1/Ts);
end
figure(12);
plot(weq,abs(Heq));
title("|H_{eq}(e^j^w)| vs \omega")
ylabel("|H_{eq}(e^j^w)|")
xlabel("\omega (rad/s)")


%% Q7
load("hn.mat");
[yy_1,Fs] = audioread('mozart_vl2_6.mp3');
music_new = yy_1(250000:500000,1);
music_new = conv(music_new,hn);
sound(music_new,Fs);
audiowrite('out_song.wav',music_new,Fs);


%% Q8

load("hn.mat");
music_new_1 = yy_2(:,1);
music_new_2=yy_2(:,2);
music_neww = [conv(music_new_1,hn),conv(music_new_1,hn)];
audiowrite('record_out.wav',music_neww,Fs);





