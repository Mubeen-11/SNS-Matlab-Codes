clear
clc
close all

%% 1. Algebraic Equation
syms x
eqn1 = x^4 - 5*x^2 + 4 == 0;
sol1 = solve(eqn1, x);
disp('1. Solutions to x^4 - 5*x^2 + 4 = 0:');
disp(sol1);

% Verification of first solution
check_sol1 = subs(x^4 - 5*x^2 + 4, x, sol1(1));
disp('Verification of first root (should be 0):');
disp(check_sol1);

%% 2. Simultaneous Equations
syms y
eqn2_1 = 2*x + 3*y == 12;
eqn2_2 = x - y == 1;
sol2 = solve([eqn2_1, eqn2_2], [x, y]);
disp('2. Simultaneous Equations Solution:');
disp('x ='); disp(sol2.x);
disp('y ='); disp(sol2.y);

% Verification
v1 = subs(2*x + 3*y, [x, y], [sol2.x, sol2.y]);
v2 = subs(x - y, [x, y], [sol2.x, sol2.y]);
disp('Verification Eqn1 (should be 12):'); disp(v1);
disp('Verification Eqn2 (should be 1):'); disp(v2);

%% 3. Differentiation
f = 3*x^5 - 2*x^4 + x^3 - 5*x + 7;
d1 = diff(f, x);
d2 = diff(f, x, 2);
d3 = diff(f, x, 3);
d4 = diff(f, x, 4);
d5 = diff(f, x, 5);
d6 = diff(f, x, 6);
disp('3. Derivatives:');
disp('d1 ='); disp(d1);
disp('d2 ='); disp(d2);
disp('d3 ='); disp(d3);
disp('d4 ='); disp(d4);
disp('d5 ='); disp(d5);
disp('d6 ='); disp(d6);

%% 4. Integration
g = 5*x^4 + 2*x^2 + 3;
G_indef = int(g, x);
G_def = int(g, x, 0, 1);
G_def_dec = vpa(G_def);
check_g = diff(G_indef, x);

disp('4. Integration of g(x):');
disp('Indefinite Integral:'); disp(G_indef);
disp('Definite Integral (exact):'); disp(G_def);
disp('Definite Integral (decimal):'); disp(G_def_dec);
disp('Verification via diff:'); disp(check_g);

%% 5. First-Order Differential Equation
syms y(t)
ode5 = diff(y, t) == -2*y;
cond5 = y(0) == 5;
sol5 = dsolve(ode5, cond5);

check_ode5 = simplify(diff(sol5, t) - (-2*sol5));
check_cond5 = subs(sol5, t, 0);

disp('5. ODE dy/dt = -2y Solution:');
disp(sol5);
disp('ODE Verification (should be 0):'); disp(check_ode5);
disp('Condition Verification (should be 5):'); disp(check_cond5);

%% 6. Second-Order Differential Equation
ode6 = diff(y, t, 2) + y == 0;
cond6_1 = y(0) == 1;
cond6_2 = subs(diff(y, t), t, 0) == 0;
sol6 = dsolve(ode6, cond6_1, cond6_2);

check_ode6 = simplify(diff(sol6, t, 2) + sol6);
check_cond6_1 = subs(sol6, t, 0);
check_cond6_2 = subs(diff(sol6, t), t, 0);

disp('6. Second-Order ODE Solution:');disp(sol6);
disp('ODE Verification (should be 0):'); disp(check_ode6);
disp('Condition 1 Verification (should be 1):'); disp(check_cond6_1);
disp('Condition 2 Verification (should be 0):'); disp(check_cond6_2);