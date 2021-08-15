A = [-5.1193e-08 -0.0535; -1.8571 -1.2236];
B = [-0.227147; 0.324495];
C = [1 0];
D = 0;
Pc = [-2+j*0.3 -2-j*0.3];
Kc = place(A,B,Pc)
sys = ss(A-B*Kc, eye(2), eye(2), eye(2)); 
t= 0:0.01:5; 
x = initial(sys, [0.227147; 1.675505], t); 
x1 = [1,0]*x'; 
x2 = [0,1]*x';

title('Response of Controller to Initial Condition');
subplot(2,1,1); 
plot(t,x1);
ylabel('State Variable x1');
grid
subplot(2,1,2); 
plot(t,x2);
ylabel('State Variable x2');
grid 

%k=Kc; 
%open('controller') 
%sim('controller')