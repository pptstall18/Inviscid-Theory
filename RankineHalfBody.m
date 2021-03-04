clc;
clear all;
m=50;
U = 1;
%Mesh for fourth quadrant and corresponding stream value function
[X1,Y1] = meshgrid(.05:.1:30,-30:.1:-.05);
psi1 = U*Y1 + m/(2*pi)*atan(Y1./X1);
%Mesh for first quadrant and corresponding stream value function
[X2,Y2] = meshgrid(.05:.1:30,.05:.1:30);
psi2 = U*Y2 + m/(2*pi)*atan(Y2./X2);
%Mesh for second quadrant and corresponding stream value function
[X3,Y3] = meshgrid(-30:.1:-.05,.05:.1:30);
psi3 = U*Y3 + m/(2*pi)*atan(Y3./X3);
%Mesh for third quadrant and corresponding stream value function
[X4,Y4] = meshgrid(-30:.1:-.05,-30:.1:-.05);
psi4 = U*Y4 + m/(2*pi)*atan(Y4./X4);
figure (1)
A='on';
B = 2;
C = 2.5;
contour(X1,Y1,psi1,'k','showtext',A,'textstep',B,'levelstep',C);
hold on;
contour(X2,Y2,psi2,'k','showtext',A,'textstep',B,'levelstep',C);
hold on;
contour(X3,Y3,psi3,'k','showtext',A,'textstep',B,'levelstep',C);
hold on;
contour(X4,Y4,psi4,'k','showtext',A,'textstep',B,'levelstep',C);
hold off;
xlim([-30 30]);ylim([-30 30]);
xlabel('X');ylabel('Y');
grid on;