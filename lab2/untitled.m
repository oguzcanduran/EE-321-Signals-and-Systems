% y_1
y_1 = calc(@x_1,60);
figure("Position",[100 50 1350 700])
subplot(1,2,2);
stem([0:99],y_1(1:100));
xlabel('n');
ylabel('Convoluted y_1[n]');
grid on
axis tight
title('Convoluted y_1[n] vs n');
subplot(1,2,1);
stem([0:99],a_1(99));
xlabel('n');
ylabel('numerical y_1[n]');
grid on
axis tight
title('numerical y_1[n] vs n');
disp(y_1);


% y_2
y_2 = calc(@x_2,60);
figure("Position",[100 50 1350 700])
subplot(1,2,2);
stem([0:99],y_2(1:100));
xlabel('n');
ylabel('Convoluted y_2[n]');
grid on
axis tight
title('Convoluted y_2[n] vs n');
subplot(1,2,1);
stem([0:99],b_1(99));
xlabel('n');
ylabel('numerical y_2[n]');
grid on
axis tight
title('numerical y_2[n] vs n');
disp(y_2);

% y_3
y_3 = calc(@x_3,60);
figure("Position",[100 50 1350 700])
subplot(2,2,2);
stem([0:99],real(y_3(1:100)));
xlabel('n');
ylabel('Convoluted Re {y_3[n]}');
grid on
axis tight
title('Convoluted Re {y_3[n]} vs n');
subplot(2,2,4);
stem([0:99],imag(y_3(1:100)));
xlabel('n');
ylabel('Convoluted Im {y_3[n]}');
grid on
axis tight
title('Convoluted Im {y_3[n]} vs n');

subplot(2,2,1);
stem([0:99],real(c_1(99)));
xlabel('n');
ylabel('Numerical Re {y_3[n]}');
grid on
axis tight
title('Numerical Re {y_3[n]} vs n');
subplot(2,2,3);
stem([0:99],imag(c_1(99)));
xlabel('n');
ylabel('Numerical Im {y_3[n]}');
grid on
axis tight
title('Numerical Im {y_3[n]} vs n');
disp(y_3);

% y_4
y_4 = calc(@x_4,60);
figure("Position",[100 50 1350 700])
subplot(1,2,2);
stem([0:99],y_4(1:100));
xlabel('n');
ylabel('Convoluted y_4[n]');
grid on
axis tight
title('Convoluted y_4[n] vs n');

subplot(1,2,1);
stem([0:99],d_1(99));
xlabel('n');
ylabel('numerical y_4[n]');
grid on
axis tight
title('numerical y_4[n] vs n');
disp(y_4);

% y_5
y_5 = calc(@x_5,60);
figure("Position",[100 50 1350 700])
subplot(1,2,2);
stem([0:99],y_5(1:100));
xlabel('n');
ylabel('Convoluted y_5[n]');
grid on
axis tight
title('Convoluted y_5[n] vs n');

subplot(1,2,1);
stem([0:99],e_1(99));
xlabel('n');
ylabel('numerical y_5[n]');
grid on
axis tight
title('numerical y_5[n] vs n');
disp(y_5);

% y_6
y_6 = calc(@x_6,60);
figure("Position",[100 50 1350 700])

subplot(2,2,2);
stem([0:99],y_6(1:100));
xlabel('n');
ylabel('Convoluted Re {y_6[n]}');
grid on
axis tight
title('Convoluted Re {y_6[n]} vs n');
subplot(2,2,4);
stem([0:99],imag(y_6(1:100)));
xlabel('n');
ylabel('Convoluted Im {y_6[n]}');
grid on
axis tight
title('Convoluted Im {y_6[n]} vs n');

subplot(2,2,1);
stem([0:99],f_1(99));
xlabel('n');
ylabel('Numerical Re {y_6[n]}');
grid on
axis tight
title('Numerical Re {y_6[n]} vs n');
subplot(2,2,3);
stem([0:99],imag(f_1(99)));
xlabel('n');
ylabel('Numerical Im {y_6[n]}');
grid on
axis tight
title('Numerical Im {y_6[n]} vs n');

disp(y_6);
%
% CONVOLUTION FUNCTION
function resu = calc(inp,inter)
   resu = zeros(1,121);
   for t= 0:120
       temp=zeros(1,121);
       for i= inter*(-1):inter
           temp(i+61)=inp(i).*(uf(t-i-3).*(8/9).^(t-i));
       end
       resu(t+1)=sum(temp);
   end
end
%
% UNIT FUNCTION
function  o_uf= uf(i)
    if(i>=0)
        o_uf = 1;
    else
        o_uf = 0;
    end
end

%INPUT FUNCTIONS 
% X_1





function x_1 = x_1(n)
    if(n<=9 && n>=0)
        x_1 = 2;
    else
        x_1 = 0;
    end
end

%
% X_2

function x_2 = x_2(n)
    if(n<=5 && n>=0)
        x_2 = 2;
    elseif(n<=9 && n>=6)
        x_2 = -2;
    elseif(n<=15 && n>=10)
        x_2 = -4;
    else
        x_2 = 0;
    end
end
%
% X_3

function x_3 = x_3(n)
    if(n<=23 && n>=3)
        x_3 = exp((n)*1i/4);
    else
        x_3 = 0;
    end
end
%
%X_4

function x_4 = x_4(n)
    x_4=(-2)*imag(x_3(n));
end
%
%X_5
function x_5 = x_5(n)
    x_5=real(x_3(n));
end
%
%X_6





function x_6 = x_6(n)
    x_6 = x_1(n)-1i*3*x_2(n);
end



%OUTPUTS 
%Y_1
function resu=a_1(n)
resu = zeros(1,100);
for t = 0:n
    if t<3 && t>-1
        resu(t+1)=0;
    elseif (t<=11 && t>=3)
        resu(t+1)= 18*(8/9)^3.*(1-(8/9)^(t-2));
    else
        resu(t+1)= 18*(8/9).^(t-9).*(1-(8/9)^(10));
    end
end
end

%Y_2

function resu=b_1(n)
resu = zeros(1,100);
for t = 0:n
    if t<3 && t>-1
        resu(t+1)=0;
    elseif (t<9 && t>=3)
        resu(t+1)= 18*(8/9)^3.*(1-(8/9).^(t-2));
    elseif (t<12 && t>=9)
        resu(t+1)= 18*(8/9)^3.*(1-(8/9).^(t-2))-36*(8/9)^3.*(1-(8/9).^(t-8));
    elseif (t<18 && t>=12)
        resu(t+1)= 18*(8/9)^(t-9).*(1-(8/9)^10)-36*(8/9)^3.*(1-(8/9).^(t-8));
    else
        resu(t+1)= 18*(8/9)^(t-9).*(1-(8/9)^10)-36*(8/9)^(t-15).*(1-(8/9)^10);
    end
end
end




%Y_3

function resu=c_1(n)
resu = zeros(1,100);
for t = 0:n
    z=(9/8).*exp(1i/4);
    if t<6 && t>-1
        resu(t+1)=0;
    elseif (t<26 && t>=6)
        resu(t+1)= (8/9).^(t-3).*exp(3*1i/4).*((1-z.^(t-5))/(1-(z)));
    else
        resu(t+1)= (8/9).^(t-3).*exp(3*1i/4).*((1-(z).^(21))/(1-(z)));
    end
end
end



%Y_4

function resu=d_1(n)
resu = zeros(1,100);
for t = 0:n
    z=(9/8).*exp(1i/4);
    p=(9/8).*exp(-1i/4);
    if t<6 && t>-1
        resu(t+1)=0;
    elseif (t<26 && t>=6)
        resu(t+1)= -((8/9).^(t-3).*exp(3*1i/4).*((1-z.^(t-5))/(1-(z)))    -    (8/9).^(t-3).*exp(-3i/4).*((1-p.^(t-5))/(1-(p))))./1i;
    else
        resu(t+1)= -((8/9).^(t-3).*exp(3*1i/4).*((1-(z).^(21))/(1-(z)))  - (8/9).^(t-3).*exp(-3i/4).*((1-(p).^(21))/(1-(p))))./1i            ;
    end
end
end





%Y_5
function resu=e_1(n)
resu = zeros(1,100);
for t = 0:n
    z=(9/8).*exp(1i/4);
    p=(9/8).*exp(-1i/4);
    if t<6 && t>-1
        resu(t+1)=0;
    elseif (t<26 && t>=6)
        resu(t+1)= ((8/9).^(t-3).*exp(3*1i/4).*((1-z.^(t-5))/(1-(z)))+        (8/9).^(t-3).*exp(-3*1i/4).*((1-p.^(t-5))/(1-(p))))./2;
    else
        resu(t+1)= ((8/9).^(t-3).*exp(3*1i/4).*((1-(z).^(21))/(1-(z)))  + (8/9).^(t-3).*exp(-3*1i/4).*((1-(p).^(21))/(1-(p))))./2            ;
    end
end
end




%Y_6
function resu=f_1(n)
resu = zeros(1,100);
for t = 0:n
    if t<3 && t>-1
        resu(t+1)=0;
    elseif (t<9 && t>=3)
        resu(t+1)= 18*(8/9)^3.*(1-(8/9)^(t-2))-(54*(1i)*(8/9)^3.*(1-(8/9).^(t-2)));
    elseif (t<12 && t>=9)
        resu(t+1)= 18*(8/9)^3.*(1-(8/9)^(t-2))-(3i).*(18*(8/9)^3.*(1-(8/9).^(t-2))-36*(8/9)^3.*(1-(8/9).^(t-8)));
    elseif (t<18 && t>=12)
        resu(t+1)= 18*(8/9).^(t-9).*(1-(8/9)^(10))-(3i).*(18*(8/9)^(t-9).*(1-(8/9)^10)-36*(8/9)^3.*(1-(8/9).^(t-8)));
    else
        resu(t+1)= 18*(8/9).^(t-9).*(1-(8/9)^(10))-(3i).*(18*(8/9)^(t-9).*(1-(8/9)^10)-36*(8/9)^(t-15).*(1-(8/9)^10));
    end
end
end