clear all; close all; clc;

%SYSTEM BEHAVIOUR & FINDING OPERATING VALUES X1 & X2
syms x1 x2
u0 = 2;
u = 1.3;
k1 = 0.06;
k2 = 0.3; 
k = 2; 
alpha = 0.7;

fn1 = ((u0*x1*x2)/(k1+x2+k2*(x2^2))) - (x1*u);
fn2 = (-(u0*x1*x2)/(alpha*(k1+x2+k2*(x2^2)))) + ((k-x2)*u); 
[solx1, solx2] = solve([fn1 == 0, fn2 == 0], [x1,x2], 'real', true); 
x1_roots = zeros; 
x1_roots = vpa(solx1);
x2_roots = zeros; 
x2_roots = vpa(solx2); 
x1_value = x1_roots(end);
x2_value = x2_roots(end); 
fprintf('The operating points are x1 = %f, x2 = %f\n', x1_value, x2_value); 

%TO DETERMINE STABILITY, CONTROLLABILITY & OBSERVABILITY 

A = [-5.1193e-08 -0.0535; -1.8571 -1.2236];
B = [-0.227147; 0.324495];
C = [1 0];
D = 0;

e=eig(A)                %For Stability 
Con_mat = ctrb(A,B);    %For Controllability 
Obs=obsv(A,C);          %For Observability  

length(A);
rank(Con_mat);
rank(A);
rank(Obs);

fprintf('Length of Matrix A = %d\n', length(A));
fprintf('Rank of Controllability Matrix = %d\n', rank(Con_mat)); 
fprintf('Rank of Matrix A = %d\n', rank(A));
fprintf('Rank of Observability Matrix = %d\n', rank(Obs));

