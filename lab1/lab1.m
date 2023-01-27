n=[0:127];

disp("-----------------------(1.a)-----------------------")

temp_x_1=cos(0.14*pi*n);
writematrix(temp_x_1,"x_1.csv");
x_1=readmatrix("x_1.csv");

fprintf("x_1[2] : %0.3f \nx_1[8] : %0.3f\nx_1[111] : %0.3f\nx_1[127] : %0.3f \n", x_1(2),x_1(8),x_1(111),x_1(127))

figure
stem(x_1,'.')
title('plot of x_1[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.14*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad \n", 0.14*pi)
fprintf("the fundamental period is %0.f \n", 100)




disp("-----------------------(2.a)-----------------------")

temp_x_2=cos(2.3*pi*n);
writematrix(temp_x_2,"x_2.csv");
x_2=readmatrix("x_2.csv");
fprintf("x_2[2] : %0.3f \nx_2[8] : %0.3f\nx_2[111] : %0.3f\nx_2[127] : %0.3f\n", x_2(2),x_2(8),x_2(111),x_2(127))

figure
stem(x_2,'.')
title('plot of x_2[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(2.3*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 2.3*pi)
fprintf("the fundamental period is %0.f \n", 20)



disp("-----------------------(3.a)-----------------------")

temp_x_3=cos(-1.7*pi*n);
writematrix(temp_x_3,"x_3.csv");
x_3=readmatrix("x_3.csv");
fprintf("x_3[2] : %0.3f \nx_3[8] : %0.3f\nx_3[111] : %0.3f\nx_3[127] : %0.3f\n", x_3(2),x_3(8),x_3(111),x_3(127))

figure
stem(x_3,'.')
title('plot of x_3[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(-1.7*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", -1.7*pi)
fprintf("the fundamental period is %0.f \n", 20)

disp("---------------Comparison (2) and (3)---------------")
disp("it is known that cos(a)=cos(a+2*pi*k)")
disp("using this fact, it can be seen that cos(-1.7*pi*n)=cos(-1.7*pi*n+2*pi*(2n))=cos(2.3*pi*n)")
disp("it has been shown that x_2 and x_3 are equal to each other for any values of n")

disp("-----------------------(4.a)-----------------------")

temp_x_4=cos(0.24*pi*n);
writematrix(temp_x_4,"x_4.csv");
x_4=readmatrix("x_4.csv");
fprintf("x_4[2] : %0.3f \nx_4[8] : %0.3f\nx_4[111] : %0.3f\nx_4[127] : %0.3f\n", x_4(2),x_4(8),x_4(111),x_4(127))

figure
stem(x_4,'.')
title('plot of x_4[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.24*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.24*pi)
fprintf("the fundamental period is %0.f \n", 25)



disp("-----------------------(5.a)-----------------------")

temp_x_5=cos(0.24*pi*n+0.4);
writematrix(temp_x_5,"x_5.csv");
x_5=readmatrix("x_5.csv");
fprintf("x_5[2] : %0.3f \nx_5[8] : %0.3f\nx_5[111] : %0.3f\nx_5[127] : %0.3f\n", x_5(2),x_5(8),x_5(111),x_5(127))

figure
stem(x_5,'.')
title('plot of x_5[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.24*pi*n+0.4)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.24*pi)
fprintf("the fundamental period is %0.f \n", 25)

disp("---------------Comparison (4) and (5)---------------")
disp("normally it is known that adding constant value to inside of a function is just shifting")
disp("so if these functions were continuous functions, 5 would be the shifting version of 4 to the left")
disp("however these functions are discrete")
disp("even if they have same period and of course same periods, it cannot be said that 5 is shifted version of 4")
disp("it is because the shifting value is not an integer (0.4) and that's why values of these functions cannot be matched with this shifting")



disp("-----------------------(6.a)-----------------------")

temp_x_6=cos(0.38*pi*n);
writematrix(temp_x_6,"x_6.csv");
x_6=readmatrix("x_6.csv");
fprintf("x_6[2] : %0.3f \nx_6[8] : %0.3f\nx_6[111] : %0.3f\nx_6[127] : %0.3f\n", x_6(2),x_6(8),x_6(111),x_6(127))

figure
stem(x_6,'.')
title('plot of x_6[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.38*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.38*pi)
fprintf("the fundamental period is %0.f \n", 100)




disp("-----------------------(7.a)-----------------------")

temp_x_7=cos(0.01*pi*n);
writematrix(temp_x_7,"x_7.csv");
x_7=readmatrix("x_7.csv");
fprintf("x_7[2] : %0.3f \nx_7[8] : %0.3f\nx_7[111] : %0.3f\nx_7[127] : %0.3f\n", x_7(2),x_7(8),x_7(111),x_7(127))

figure
stem(x_7,'.')
title('plot of x_7[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.01*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.01*pi)
fprintf("the fundamental period is %0.f \n", 200)



disp("-----------------------(8.a)-----------------------")

temp_x_8=cos(pi*n);
writematrix(temp_x_8,"x_8.csv");
x_8=readmatrix("x_8.csv");
fprintf("x_8[2] : %0.3f \nx_8[8] : %0.3f\nx_8[111] : %0.3f\nx_8[127] : %0.3f\n", x_8(2),x_8(8),x_8(111),x_8(127))

figure
stem(x_8,'.')
title('plot of x_8[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", pi)
fprintf("the fundamental period is %0.f \n", 2)



disp("-----------------------(9.a)-----------------------")

temp_x_9=cos(1.06*pi*n);
writematrix(temp_x_9,"x_9.csv");
x_9=readmatrix("x_9.csv");
fprintf("x_9[2] : %0.3f \nx_9[8] : %0.3f\nx_9[111] : %0.3f\nx_9[127] : %0.3f\n", x_9(2),x_9(8),x_9(111),x_9(127))

figure
stem(x_9,'.')
title('plot of x_9[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(1.06*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 1.06*pi)
fprintf("the fundamental period is %0.f \n", 100)



disp("-----------------------(10.a)-----------------------")

temp_x_10=cos(0.94*pi*n);
writematrix(temp_x_10,"x_10.csv");
x_10=readmatrix("x_10.csv");
fprintf("x_10[2] : %0.3f \nx_10[8] : %0.3f\nx_10[111] : %0.3f\nx_10[127] : %0.3f\n", x_10(2),x_10(8),x_10(111),x_10(127))

figure
stem(x_10,'.')
title('plot of x_1_0[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.94*pi*n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.94*pi)
fprintf("the fundamental period is %0.f \n", 100)

disp("---------------Comparison (9) and (10)---------------")
disp("it is know that cos(a)=cos(a+2*pi*k) and cos(b)=cos(-b)")
disp("using these facts, it can be seen that cos(0.94*pi*n)=cos(-0.94*pi*n)=cos(-0.94*pi*n+2*pi*n)=cos(1.06*pi*n)")
disp("it has been shown that x_9 and x_10 are equal to each other for any values of n")


disp("-----------------------(11.a)-----------------------")

temp_x_11=cos(n);
writematrix(temp_x_11,"x_11.csv");
x_11=readmatrix("x_11.csv");
fprintf("x_11[2] : %0.3f \nx_11[8] : %0.3f\nx_11[111] : %0.3f\nx_11[127] : %0.3f\n", x_11(2),x_11(8),x_11(111),x_11(127))

figure
stem(x_11,'.')
title('plot of x_1_1[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(n)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 1)
fprintf("it is not periodic since there is no integer k or period for the equation k*2*pi=period*n \n")



disp("-----------------------(12.a)-----------------------")

temp_x_12=cos(0.8*n+0.3);
writematrix(temp_x_12,"x_12.csv");
x_12=readmatrix("x_12.csv");
fprintf("x_12[2] : %0.3f \nx_12[8] : %0.3f\nx_12[111] : %0.3f\nx_12[127] : %0.3f \n", x_12(2),x_12(8),x_12(111),x_12(127))

figure
stem(x_12,'.')
title('plot of x_1_2[n] vs n')
xlabel('n for 0<=n<=127')
ylabel('cos(0.8*n+0.3)')
grid on
axis tight

fprintf("the value of w is %0.3f rad\n", 0.8)
fprintf("it is not periodic since there is no integer k or period for the equation k*2*pi=0.8*period \n\n")



fprintf("14) to have a period for discrete signals w must satisfy that T(period) must be an integer and w*(T)period must be a multiple of 2*pi \n\n")
disp("15) it is known that 2pi is the natural and fundamental period of a cosine signal,")
disp("and using this fact it is easily can be said that 2pi/w=T(period) for a continuous cosine")
disp("so for continuous cosine signals there is no periodicity condition ")
disp("however if the signal is a discrete cosine signal period must be integer and so w*T(period) must be a multiple of 2pi: w*T=k*2pi; k and T are integers")
disp("this is because unlike continuous functions, all the units function can take is integer and so their intervals are integer as well")
disp("since the period is one of those intervals, it must be an integer as well")



save lab_1.mat
load lab_1.mat


