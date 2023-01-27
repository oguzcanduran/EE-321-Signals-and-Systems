[ht,F2] = audioread("impulse response.m4a"); 
[xt,F1] = audioread("mozart_vl2_6.mp3");
yt = conv(xt,ht);
audiowrite('Output.wav', yt, F1);

figure
plot(xt);
xlabel('t(s)');
ylabel('x(t)');
title('Input Function');
axis tight;
grid on;

figure
plot(ht);
xlabel('t(s)');
ylabel('h(t)');
title('Impulse Response');
axis tight;
grid on;

figure
plot(yt);
xlabel('t(s)');
ylabel('y(t)');
title('Output Function');
axis tight;
grid on;