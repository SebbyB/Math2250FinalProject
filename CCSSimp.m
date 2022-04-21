
clc
clear
format long
Bios = (-120/2100)*0.01;
Atmos = 0.1*Bios;
x_1850i = [1100 2100 700]
B = [-210/600 , 120/2100, 90/700; ...
    120/600, -120/2100, 0; ...
    90/600 , 0, -90/700];
K = [0, 0, 0;...
    Atmos, -Bios, 0;...
    0, 0, 0];




[V,D] = eig(B-K);

t = 0;
a = V\x_1850i';
f = @(t) a.*exp(diag(D)*t);
x = @(t) V*f(t);
t = linspace(0,200);

X = x(t);
% plot(t,X(1:3,:))
hold on
% plot(2.2222,851.056,'r*')
figure(1)
plot(t,X(1,:),'r')
plot(t,X(2,:),'g')
plot(t,X(3,:),'b')
title('Emissions over Time with CCS - Simplified')
ylabel('Carbon Emissions (GigaTonnes)')
xlabel('Time (Years)')
Labels = ["Atmosphere" "BioSphere" "Surface Ocean"];
legend(Labels, "location", "best");


[V,D] = eig(B);

t = 0;
a = V\x_1850i';
f = @(t) a.*exp(diag(D)*t);
x = @(t) V*f(t);
t = linspace(0,200);

X = x(t);
% plot(t,X(1:3,:))
figure(2)
hold on
plot(t,X(1,:),'r')
plot(t,X(2,:),'g')
plot(t,X(3,:),'b')
title('Emissions over Time with immediate drop to zero - Simplified')
ylabel('Carbon Emissions (GigaTonnes)')
xlabel('Time (Years)')
Labels = ["Atmosphere" "BioSphere" "Surface Ocean"];
legend(Labels,"location", "best");
hold on
