%x,y,theta variables are defined below
ix= 10; 
intervals=50;
[x,y]=meshgrid(-ix:1/intervals:ix);

theta = linspace(0,2*pi,intervals);

%adjustable parameters

U=10; %U=uniform flow velocity%
r=0.05;  %r=radius of cylinder%
AoA=30;     %AoA=angle of attack%
c=0.002;   %chord number
for i = 1 : length(x)
    for j = 1 : length(x)
        if (x(i,j)^2 + y(i,j)^2 <= r^2)
            x(i,j) = NaN;
            y(i,j) = NaN;
        end
    end
end
alpha=(AoA)/180*pi;
gamma=-4*pi*r*U*sin(alpha);

%zo=initial starting position, z=complex variable Fz=complex potential

z=x+1i*y;
zeta= (z) + ((r)^2./(z));
%complex potential of uniform flow at angle of attack

Fzu=(U*z*exp(-1i*alpha));

%complex potential of cylinder 
Fzc=(U*(r^2)*(1+c)^2*exp(1i*alpha))./(z+r*c)+(-1i*gamma*log(z+r*c))./(2*pi);

%complex potential of a cylinder with uniform flow at angle of attack
Fz=Fzu+Fzc;

%plotting the psi function followed by a solid circle
hold all;
[th, r2] = cart2pol(real(zeta), imag(zeta));
[nx, ny] = pol2cart(th-alpha, r2);
cinterval=300;
v2=-cinterval:0.01*cinterval:cinterval;
contour(nx,ny,imag(Fz),(v2),'c');
%contour(nx,ny,real(Fz),(-10:0.1:10),'r');%
%plotting the plate in zeta space
x2= r*(1+c)*cos(theta)-r*c;
y2= r*(1+c)*sin(theta);
z2= x2+1i*y2;
zeta2= z2 + (r^2)./z2;
[th, r3] = cart2pol(real(zeta2), imag(zeta2));
[nx2, ny2] = pol2cart(th-alpha, r3);
fill(nx2,ny2,'k');

%axis display options
grid on;
grid minor;
axis(0.5*[-ix ix -ix ix]);
pbaspect([1 1 1]);
