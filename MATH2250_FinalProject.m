clc
clear 

x_1850i = [6e2, 2.1e3, 7e2, 3.8e4, 4.8e7]

A = [0 , 120, 90.15, 0, 0; 120, 0, 0, 0, 0; 9, 0, 0, 5.3, 0; 0, 0, 5, 0, 0.3; 0.15, 0, 0.15, 0, 0];

[V,D] = eig(A);

t = 0;


v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
v4 = V(:,4);
v5 = V(:,5);
eta = [v1,v2,v3,v4,v5];
Lambda = [D(1,1), D(2,2), D(3,3), D(4,4),  D(5,5)];

syms c1 c2 c3 c4 c5 
c = [c1,c2,c3,c4,c5]  ;


% eqn = eta(1)*exp(Lambda(1)*tint)*c1 ==x_1850i(1);
% 
% a = eval(solve(eqn, c1))
% x_1850i(1) = eta(1)*exp(Lambda(1)*tint)*c(1)
% x_1850i(2) = eta(2)*exp(Lambda(2)*tint)*c(2)

% x_1850i(n) == eta(n)*exp(Lambda(n)*tint)*c(n)

a = zeros(1,5);
for n = 1:5;
eqn = eta(n)*exp(Lambda(n)*t)*c(n) ==x_1850i(n);

a(n) = eval(solve(eqn, c(n)));

end

Final = zeros(1,5);
Final(1)  =  eta(1)*exp(Lambda(1)*t)*a(1);

Final(2)  =  eta(2)*exp(Lambda(2)*t)*a(2);

Final(3)  =  eta(3)*exp(Lambda(3)*t)*a(3);

Final(4)  =  eta(4)*exp(Lambda(4)*t)*a(4);

Final(5)  =  eta(5)*exp(Lambda(5)*t)*a(5);

Final

PROOF = Final - x_1850i