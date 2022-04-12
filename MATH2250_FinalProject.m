x_1850i = [6e2, 2.1e3, 7e2, 3.8e4, 4.8e7]

A = [0 , 120, 90.15, 0, 0; 120, 0, 0, 0, 0; 9, 0, 0, 5.3, 0; 0, 0, 5, 0, 0.3; 0.15, 0, 0.15, 0, 0]

[V,D] = eig(A)

tint = 1850
v1 = V(:,1)
v2 = V(:,2)
v3 = V(:,3)
v4 = V(:,4)
v5 = V(:,5)

Lambda1 = D(1,1)
Lambda2 = D(2,2)
Lambda3 = D(3,3)
Lambda4 = D(4,4)
Lambda5 = D(5,5)

c2
c3
c4
c5
(c1)*(v1) == ((x_1850i(1))/exp(Lambda1*tint))
(c2)*(v2) == ((x_1850i(2))/exp(Lambda2*tint))
(c3)*(v3) == ((x_1850i(3))/exp(Lambda3*tint))
(c4)*(v4) == ((x_1850i(4))/exp(Lambda4*tint))
(c5)*(v5) == ((x_1850i(5))/exp(Lambda5*tint))