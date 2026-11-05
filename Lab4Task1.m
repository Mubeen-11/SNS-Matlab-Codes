clear
clc
close all

%% 1. Symbolic Expression
syms x
f = x^4 - 3*x^2 + 2*x + 5;
val_f2 = subs(f, x, 2);
disp('1. Symbolic Expression f(2):');
disp(val_f2);

%% 2. Symbolic Equation
eqn2 = x^3 - 4*x == 0;
sol2 = solve(eqn2, x);
disp('2. Solutions to x^3 - 4*x = 0:');
disp(sol2);

%% 3. Simultaneous Equations
syms y
eqn3_1 = x + 2*y == 7;
eqn3_2 = 3*x - y == 7;
sol3 = solve([eqn3_1, eqn3_2], [x, y]);
disp('3. Simultaneous Equations Solution:');
disp('x ='); disp(sol3.x);
disp('y ='); disp(sol3.y);

%% 4. Differentiation
g = x^5 - 2*x^3 + 4*x^2 - 1;
d1 = diff(g, x);
d2 = diff(g, x, 2);
d3 = diff(g, x, 3);
d4 = diff(g, x, 4);
d5 = diff(g, x, 5);
disp('4. Derivatives of g(x):');
disp('d1 ='); disp(d1);
disp('d2 ='); disp(d2);
disp('d3 ='); disp(d3);
disp('d4 ='); disp(d4);
disp('d5 ='); disp(d5);

%% 5. Integration
h = 4*x^3 + 2*x + 1;
H_indef = int(h, x);
H_def = int(h, x, 0, 1);
check_int = diff(H_indef, x);
disp('5. Integration of h(x):');
disp('Indefinite Integral:'); disp(H_indef);
disp('Definite Integral (0 to 1):'); disp(H_def);
disp('Verification (diff of integral):'); disp(check_int);

%% 6. First-Order Differential Equation
syms y(t)
ode6 = diff(y, t) == 3*y;
cond6 = y(0) == 2;
sol6 = dsolve(ode6, cond6);

% Verification
check6 = simplify(diff(sol6, t) - 3*sol6);
disp('6. First-Order Differential Equation Particular Solution:');
disp(sol6);
disp('ODE Verification (should be 0):');
disp(check6);