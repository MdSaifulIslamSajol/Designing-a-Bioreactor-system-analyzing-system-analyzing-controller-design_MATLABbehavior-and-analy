clear all; close all; clc; 
A = [-5.1193e-08 -0.0535; -1.8571 -1.2236];
B = [-0.227147; 0.324495];
C = [1 0];
D = 0;

Pc = [-2+j*0.3 -2-j*0.3];
Po = [-10 -11];

Kc = place(A,B,Pc)
Ko = place(A',C',Po)'

sys = ss([A-B*Kc B*Kc; zeros(2,2) A-Ko*C], eye(4), eye(4), eye(4)); 
t=0:0.01:3; 
x= initial(sys,[0.227147;0;1.675505;0],t); 

x1= [1 0 0 0]*x';
x2= [0 1 0 0]*x';
e1= [0 0 1 0]*x';
e2= [0 0 0 1]*x';

subplot(2,2,1); plot(t,x1); grid 
title('Response of Observer to Initial Condition')
ylabel('State Variable x1') 

subplot(2,2,2); plot(t,x2); grid 
ylabel('State Variable x2') 

subplot(2,2,3); plot(t,e1); grid 
ylabel('Error State Variable e1') 

subplot(2,2,4); plot(t,e2); grid 
ylabel('Error State Variable e1')  

%j=Ko;
%k=Kc;
%open('observer') 
%sim('observer')