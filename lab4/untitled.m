
%% Q1
T_s = 1/8;
n = -30:225;
disc = n.*T_s ;
T = 16;
y_t = @(disc) 0.*(0<=mod(disc,T) & mod(disc,T)<6)...
    + 4.*(6<=mod(disc,T) & mod(disc,T)<10)...
    + 0.*(10<=mod(disc,T) & mod(disc,T)<16);
y_n = y_t(disc);

% PART A
figure();
plot(n,y_n,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight

figure();
stem(n,y_n,'r');
title('Discrete plot of y[n])');
xlabel('n');
ylabel('y[n]');
axis tight


% Part D


arraylen=120;
akarr1=a_k1(arraylen);
figure();
plot(n, fourier(disc,T,akarr1));
titl= sprintf('y_a approximating in [-120,120] (FSE)');
title(titl);
xlabel('n');
ylabel('Z_{120}[n]');
axis tight

%Part E1,E2,F,G,H

NS=[60,30,5,3,1];
for N=NS
    arraylen=N;
    akarr=a_k1(arraylen);
    figure();
    plot(n, fourier(disc,T,akarr));
    titl= sprintf('y_a approximating in [-%d , %d] ',N,N);
    title(titl);
    lbe=sprintf("Z_{%d}[n]",N);
    xlabel('n');
    ylabel(lbe);
    axis tight
end

figure();
subplot(1,2,1);
plot(n,y_n,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight
subplot(1,2,2);
plot(n, fourier(disc,T,a_k1(120)),'b');
hold on
plot(n, fourier(disc,T,a_k1(30)),'r');
hold on
plot(n, fourier(disc,T,a_k1(5)),'k');
hold on
plot(n, fourier(disc,T,a_k1(1)),'m');
hold off
title('Comparison of Functions From d to h')
legend('z_{120}[n]','z_{30}[n]','z_{5}[n]','z_{1}[n]');
xlabel('n');
ylabel('Z_N[n]');
axis tight
grid on




% PART I
% Plot the harmonics
spec_len=100;
magnitudes_1=a_k1(spec_len);
figure();
plot(disc, harmonik(disc, 0, magnitudes_1, T),'b');
hold on
plot(disc, harmonik(disc, 1, magnitudes_1, T),'r');
hold on
plot(disc, harmonik(disc, 2, magnitudes_1, T),'k');
hold on
plot(disc, harmonik(disc, 3, magnitudes_1, T),'m');
title('Zeroth to Third Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('Zeroth Harmonic (DC)','First Harmonic' ...
    ,'Second Harmonic','Third Harmonic');
hold off

%% Q2
T_2 = 8;
y_t2 = @(disc) abs(3*cos(pi*disc/8));
y_n2 = y_t2(disc);

% PART A
figure();
plot(n,y_n2,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight

figure();
stem(n,y_n2,'r');
title('Discrete plot of y[n])');
xlabel('n');
ylabel('y[n]');
axis tight


% Part D


arraylen=120;
akarr2=a_k2(arraylen);
figure();
plot(n, fourier(disc,T_2,akarr2));
titl= sprintf('y_a approximating in [-120,120] (FSE)');
title(titl);
xlabel('n');
ylabel('Z_N[n]');
axis tight

%Part E1,E2,F,G,H

NS=[60,30,5,3,1];
for N=NS
    arraylen=N;
    akarr_2=a_k2(arraylen);
    figure();
    plot(n, fourier(disc,T_2,akarr_2));
    titl= sprintf('y_a approximating in [-%d , %d] ',N,N);
    title(titl);
    xlabel('n');
    ylabel('Z_N[n]');
    axis tight
end

figure();
subplot(1,2,1);
plot(n,y_n2,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight
subplot(1,2,2);
plot(n, fourier(disc,T_2,a_k2(120)),'b');
hold on
plot(n, fourier(disc,T_2,a_k2(30)),'r');
hold on
plot(n, fourier(disc,T_2,a_k2(5)),'k');
hold on
plot(n, fourier(disc,T_2,a_k2(1)),'m');
hold off
title('Comparison of Functions From d to h')
legend('z_{120}[n]','z_{30}[n]','z_{5}[n]','z_{1}[n]');
xlabel('n');
ylabel('Z_N[n]');
axis tight
grid on




% PART I
% Plot the harmonics
magnitudes_2=a_k2(spec_len);
figure();
plot(disc, harmonik(disc, 0, magnitudes_2, T_2),'b');
hold on
plot(disc, harmonik(disc, 1, magnitudes_2, T_2),'r');
hold on
plot(disc, harmonik(disc, 2, magnitudes_2, T_2),'k');
hold on
plot(disc, harmonik(disc, 3, magnitudes_2, T_2),'m');
title('Zeroth to Third Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('Zeroth Harmonic (DC)','First Harmonic', ...
    'Second Harmonic','Third Harmonic');
hold off


%% Q3

T_3 = 16;

y_t3 = @(disc) abs(3*cos(pi*disc/8)).*(0<=mod(disc,T) ...
    & mod(disc,T)<4)...
    + 0.*(4<=mod(disc,T) & mod(disc,T)<12)...
    + abs(3*cos(pi*disc/8)).*(12<=mod(disc,T) & mod(disc,T)<16);
y_n3 = y_t3(disc);

% PART A
figure();
plot(n,y_n3,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight

figure();
stem(n,y_n3,'r');
title('Discrete plot of y[n])');
xlabel('n');
ylabel('y[n]');
axis tight



% Part D


arraylen=120;
akarr3=a_k3(arraylen);
figure();
plot(n, fourier(disc,T_3,akarr3));
titl= sprintf('y_a approximating in [-120,120] (FSE)');
title(titl);
xlabel('n');
ylabel('Z_N[n]');
axis tight

%Part E1,E2,F,G,H

NS=[60,30,5,3,1];
for N=NS
    arraylen=N;
    akarr_3=a_k3(arraylen);
    figure();
    plot(n, fourier(disc,T_3,akarr_3));
    titl= sprintf('y_a approximating in [-%d , %d] ',N,N);
    title(titl);
    xlabel('n');
    ylabel('Z_N[n]');
    axis tight
end

figure();
subplot(1,2,1);
plot(n,y_n2,'r');
title('Plot of y_a(t)');
xlabel('t');
ylabel('y_a(t)');
axis tight
subplot(1,2,2);
plot(n, fourier(disc,T_3,a_k3(120)),'b');
hold on
plot(n, fourier(disc,T_3,a_k3(30)),'r');
hold on
plot(n, fourier(disc,T_3,a_k3(5)),'k');
hold on
plot(n, fourier(disc,T_3,a_k3(1)),'m');
hold off
title('Comparison of Functions From d to h')
legend('z_{120}[n]','z_{30}[n]','z_{5}[n]','z_{1}[n]');
xlabel('n');
ylabel('Z_N[n]');
axis tight
grid on




% PART I
% Plot the harmonics
magnitudes_3=a_k3(spec_len);
figure();
plot(disc, harmonik(disc, 0, magnitudes_3, T_3),'b');
hold on
plot(disc, harmonik(disc, 1, magnitudes_3, T_3),'r');
hold on
plot(disc, harmonik(disc, 2, magnitudes_3, T_3),'k');
hold on
plot(disc, harmonik(disc, 3, magnitudes_3, T_3),'m');
title('Zeroth to Third Harmonics of y(t)');
xlabel('t');
axis tight
grid on
legend('Zeroth Harmonic (DC)','First Harmonic', ...
    'Second Harmonic','Third Harmonic');
hold off







%%
function result = fourier(n,T, ak)
result = 0;
l=(length(ak)-1)/2;
for j = -l:l
    result = result + ak(j+l+1).* exp(1i*(2*pi/T).*j.*n);
end
end

function result = a_k1(len)
result = zeros(0,len);
borders = -1*len:len;
for k = borders
    if(k==0)
        temp = 1;
    else
        temp = ((4)/(pi*k)) * cos(pi*k).*sin(pi*k/4) ;
        %temp = ((4i)/(2*pi*k)) * (exp(-10i*k*pi/8) - exp(-6i*pi*k/8));
    end
    result(k+len+1) = temp;
end
end


function result = a_k2(len)
result = zeros(0,len);
borders = -1*len:len;
for k = borders
    if (k==-1/2)  || (k==1/2)
        temp = 3/2;
    else
        temp = (6)*cos(pi*k) /  (pi*(1-4*k^2))   ;
    end
    result(k+len+1) = temp;
end
end


function result = a_k3(len)
result = zeros(0,len);
borders = -1*len:len;
for k = borders
    if (k==-1)  || (k==1)
        temp = 3/4;
    else
        temp = (3)*cos(pi*k/2) /  (pi*(1-k^2))   ;
    end
    result(k+len+1) = temp;
end
end




function result = harmonik(disc, k, ak, T)
len=(length(ak)-1)/2;
if k == 0
    result = ak(len+1).* exp((2i*pi/T).*k.*disc);
else
    result = ak(len+k+1).* exp((2i*pi/T).*k.*disc) ...
        + ak(len-k+1).* exp(-(2i*pi/T).*k.*disc);
end
end


