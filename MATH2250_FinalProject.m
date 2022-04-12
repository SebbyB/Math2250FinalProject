x_1850i = [11e2, 2.1e3, 7e2, 3.8e4, 4.8e7]

x_1850 = x_1850i'

a= eye(5,5)*1850




A*x_1850

tint = 2020

tfin = 2020

tao = linspace((tint - tint), (tfin - tint), 5)
A = diag(tao)

A*x_1850
