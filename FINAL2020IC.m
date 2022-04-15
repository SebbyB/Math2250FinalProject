clc
clear 
format long
x_1850i = [600, 2.1e3, 7e2, 3.8e4, (4.8*10^7)];

A = [-210.15/600 ,2/35, 9/70, 0, .15/4.8e7; ...
    1/5, -2/35, 0, 0, 0; ...
    90.5/600, 0, -95.3/700, 5/38000, .15/4.8e7;...
    0, 0, 5.3/700, -5.3/38000, 0;...
    0, 0, 0, .3/38000, -.3/4.8e7];

[V,D] = eig(A);

t = 0 ;

syms tFinal


v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
v4 = V(:,4);
v5 = V(:,5);
eta = [v1,v2,v3,v4,v5];
Lambda = [D(1,1), D(2,2), D(3,3), D(4,4),  D(5,5)];

syms c1 c2 c3 c4 c5 
c = [c1,c2,c3,c4,c5];


% eqn = eta(1)*exp(Lambda(1)*tint)*c1 ==x_1850i(1);
% 
% a = eval(solve(eqn, c1))
% x_1850i(1) = eta(1)*exp(Lambda(1)*tint)*c(1)
% x_1850i(2) = eta(2)*exp(Lambda(2)*tint)*c(2)

% x_1850i(n) == eta(n)*exp(Lambda(n)*tint)*c(n)

a = zeros(1,5);
for n = 1:5
eqn = eta(n)*exp(Lambda(n)*t)*c(n) ==x_1850i(n);

a(n) = eval(solve(eqn, c(n)));
syms k

end
at = [500, 0 , 0 , 0, -500]';



% xFinal = ([(11*10^2), 2.1e3, 7e2, 3.8e4, (4.8*10^7)-500]) / 2
% for n = 1:5
% eqn = eta(n)*exp(Lambda(n)*(tFinal))*a(n) == xFinal(n);
% 
% p(n) = eval(solve(eqn, tFinal));
% 
% end
% p
% tFinal = norm(p)
fprintf("Code finshed...\n")
