close all ;
clear all;

N_1=7;
N_2=1;
M_1=N_1+2;
M_2=N_2+2;
L=11+N_1;

n=0:17;
%% Q1

zeros_array= [ 0.04*pi,0.7*pi,0.71*pi,0.72*pi,0.724*pi,...
    0.834*pi,0.944*pi,0.95*pi,-0.95*pi,pi,-0.04*pi,-0.7*pi,...
    -0.71*pi,-0.72*pi,-0.724*pi,-0.834*pi,-0.944*pi];


h_n=real(poly(exp(1i.*zeros_array)));
disp(h_n);
figure();
stem(n,real(h_n))
title('h[n] vs n')
ylabel('h[n]')
xlabel('n')

save('h_n.mat','h_n')


ome = 0:pi/500:2*pi;

figure();
hold on
plot(cos(ome), sin(ome));
hold on

scatter(real(exp(1j*zeros_array)),imag(exp(1j*zeros_array)));
ylabel('J Im \{z\}')
xlabel('Re \{z\}')
title('Zeros of H(z)')
axis on
hold off
% H(z)
w=[-pi:pi*0.002:pi];

Hz=sum(h_n.'.*exp(n.'.*(-1j).*w));
figure();
plot(w,abs(Hz))
title("|H(z)| vs \omega")
xlabel("\omega (rd/sample)")
ylabel("|H(z)|")

pha=zeros(1,1001);
for q=1:1001
    pha(1,q)= atan(imag(Hz(q))/real(Hz(q)));
end
figure();
plot(w,pha);
title("Phase plot of H(z)")
xlabel("\omega (rd/sample)")
ylabel("Phase")

%%  Q2
k=0:1:1023;
x_f=cos(k.^2*(1*pi/512));
figure

stem(k,x_f)

title('x_f[n] vs n')
xlabel('n')
ylabel('x_f[n]')
save('xf1.mat','x_f');
N=0:0.00001:1;
x_f_2=cos(1000*N.^2);
figure();
plot(N,x_f_2)
title('x_f(t) vs t')
ylabel('x_f(t)')
xlabel("t (sec)")

save('xf2.mat','x_f_2')

%% Q3
n_3=0:1:8191;
x_g = cos((pi/8192).*(n_3.^2));
save('xg.mat', 'x_g');
figure();
stem(n_3,x_g);
xlabel('n');
ylabel('x_g[n]');
title('x_g[n] vs n');


%% Q4
y_1=conv(h_n,x_f );
figure();
plot(0:1040, y_1(1:1041));
xlabel('n');
ylabel('y1[n]');
title('y1[n] vs n');
save('q4.mat', 'y_1');
y_2 = conv(h_n,x_g);
figure();
plot(0:8208,y_2(1:8209))
xlabel('n');
ylabel('y2[n]');
title('y2[n] vs n');
save('y_2.mat', 'y_2');


%% Q7
T_s_7=sqrt(pi./(1000*8192));
w_2 = [-pi:(pi*0.002)*T_s_7:pi];
Heq = abs(sum(h_n.'.*exp(n.'.*(-1j).*w_2)));
figure();
plot(w_2,abs(Heq));
axis tight
title('|H_{eq}(e^{j\omega})| vs \omega');
xlabel('\omega (rad/sec)');
ylabel("|H_{eq}(e^{j\omega})|")


%% Q8

[y,Fs] = audioread('mozart_vl2_6.mp3');
info = audioinfo('mozart_vl2_6.mp3');
music_new = y(250000:750000,1);
music_new = conv(music_new,h_n);
sound(music_new,Fs);
audiowrite('out_song.wav',music_new,Fs);





