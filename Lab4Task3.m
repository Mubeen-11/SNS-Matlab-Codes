clear
clc
close all

%%1. Symbolic Equation
syms x;
f = x^5 - 5*x^3 + 4*x;
f_2 = subs(f,x,2);
f_neg2 = subs(f,x,-2);
disp(' 1. Symbolic Analysis ');
disp('f(x) = '); disp(f);
disp('f(2) = '); disp(f_2);
disp('f(-2) = '); disp(f_neg2);

%%2. Equation Solving
eqn = f == 0;
solutions = solve(eqn, x);
verification_roots = subs(f, x, solutions);
disp(' 2. Equation Solving ');
disp('Solutions to f(x) = 0:'); disp(solutions);
disp('Verification (substituting roots into f(x), should be all 0s):'); 
disp(verification_roots);

%%3. Differnetiation
f_1 = diff(f,x);
f_2 = diff(f,x,2);
f_3 = diff(f,x,3);
f_4 = diff(f,x,4);
f_5 = diff(f,x,5);
f_6 = diff(f,x,6);
disp('1st Derivative (d1) = '); disp(f_1);
disp('2nd Derivative (d2) = '); disp(f_2);
disp('3rd Derivative (d3) = '); disp(f_3);
disp('4th Derivative (d4) = '); disp(f_4);
disp('5th Derivative (d5) = '); disp(f_5);
disp('6th Derivative (d6) = '); disp(f_6);

%%4. Indefinite Integral
f_indef = int(f,x);
check_f = diff(f_indef);
f_def = int(f,x,0,1);
f_dec = vpa(f_def);
disp(' 4. Integration ');
disp('Indefinite Integral F(x) = '); disp(f_indef);
disp('Verification (dF/dx, should recover original f(x)):'); disp(check_f);
disp('Definite Integral (0 to 1) Exact = '); disp(f_def);
disp('Definite Integral (0 to 1) Decimal = '); disp(f_dec);

%%5. Differential Equation
syms y(t);
ode = diff(y, t) == -2*y;
cond = y(0) == 3;
sol_ode = dsolve(ode,cond);
check_ode = simplify(diff(sol_ode, t) - (-2*sol_ode));
check_cond = subs(sol_ode, t, 0);
disp(' 5. Differential Equation ');
disp('Particular Solution y(t) = '); disp(sol_ode);
disp('ODE Verification (should be 0):'); disp(check_ode);
disp('Initial Condition Verification y(0) (should be 3):'); disp(check_cond);