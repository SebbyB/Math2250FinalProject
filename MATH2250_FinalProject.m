x_1850i = [6e2, 2.1e3, 7e2, 3.8e4, 4.8e7]

A = [0 , 120, 90.15, 0, 0; 120, 0, 0, 0, 0; 9, 0, 0, 5.3, 0; 0, 0, 5, 0, 0.3; 0.15, 0, 0.15, 0, 0]

[V,D] = eig(A)

tint = 1850


v1 = V(:,1)
v2 = V(:,2)
v3 = V(:,3)
v4 = V(:,4)
v5 = V(:,5)
eta = [v1,v2,v3,v4,v5]
Lambda = [D(1,1), D(2,2), D(3,3), D(4,4),  D(5,5)]
c = [c1,c2,c3,c4,c5]  

solve(eqn,x)

% x_1850i(1) == eta(1)*exp(Lambda(1)*tint)*c(1)


% x_1850i(n) == eta(n)*exp(Lambda(n)*tint)*c(n)

% for n = 1:5
% a = vpasolve(x_1850i(n) == eta(n)*exp(Lambda(n)*tint)*c(n),c(n))
% end