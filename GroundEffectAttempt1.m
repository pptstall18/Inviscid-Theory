%x,y,theta variables are defined below
ix= 5; 
intervals=50;
[x,y]=meshgrid(-ix:1/intervals:ix);
line=20;
theta = linspace(0,2*pi,intervals);
%adjustable parameters U=uniform flow velocity, r=radius of cylinder,
%alpha=angle of attack, positionx= x coordinate position of centre,
%positiony= y coordinate position of centre, gamma= strength of vorticity
U=200; alpha=-pi/12;
r=1;
c=0.02;
for i = 1 : length(x)
    for j = 1 : length(x)
        if (x(i,j)^2 + y(i,j)^2 <= r^2)
            x(i,j) = NaN;
            y(i,j) = NaN;
        end
    end
end
airfoilx=0; airfoily=-2;
zp=airfoilx+1i*airfoily;

gamma=-4*pi*r*U*sin(alpha);
%zo=initial starting position, z=complex variable Fz=complex potential
positionx=-r*c; positiony=0;
zo=positionx+1i.*positiony;
z=x+1i*y;
zetao= (z) + ((r)^2./(z));
zeta= (z) + ((r)^2./(z))+zp;
zetab=(z) + ((r)^2./(z))-zp;
%complex potential of uniform flow at angle of attack

Fzu=(U*(z-zo)*exp(-1i*alpha));
Fzu2=(U*(z-zo)*exp(1i*alpha));
%complex potential of cylinder 
Fzc=(U*(r^2)*(1+c)^2*exp(1i*alpha))./(z-zo)+(1/(2*pi)*(-1i*gamma*log(z-zo)));
Fzc2=(U*(r^2)*(1+c)^2*exp(1i*-alpha))./(z-zo)+(1/(2*pi)*(1i*gamma*log(z-zo)));
%complex potential of a cylinder with uniform flow at angle of attack
Fz=Fzu+Fzc;
Fz2=Fzu2+Fzc2;
%plotting the psi function followed by a solid circle
figure (1);
hold on;
contour(x,y,imag(Fz),(21*ix),'c');
contour(x,y,real(Fz),(21*ix),'r');

figure (2);

hold all;
[th, r0] = cart2pol(real(zeta), imag(zeta));
[nx, ny] = pol2cart(th-alpha, r0);
%contour(nx,ny,imag(Fz+Fz2),(line*ix),'c');
contour(nx,ny,imag(Fz),(line*ix),'c');
x2= (r-positionx)*cos(theta)+positionx;
y2= (r-positionx)*sin(theta)+positiony;
z2= x2+1i*y2;
zeta2= (z2 + (r^2)./z2)+zp;
[th2, r2] = cart2pol(real(zeta2), imag(zeta2));
[nx2, ny2] = pol2cart(th2-alpha, r2);
fill(nx2,ny2,'k');

 [th3, r3] = cart2pol(real(zetab), imag(zetab));
 [nx3, ny3] = pol2cart(th3+alpha, r3);
 contour(nx3,ny3,imag(Fz2),(line*ix),'c');
 x3= (r-positionx)*cos(theta)+positionx;
 y3= (r-positionx)*sin(theta)-positiony;
 z3= x3+1i*y3;
 zeta2= (z3 + (r^2)./z3)-zp;
 [th5, r5] = cart2pol(real(zeta2), imag(zeta2));
 [nx4, ny4] = pol2cart(th5+alpha, r5);
 fill(nx4,ny4,'k');

%plotting the plate in zeta space


%axis display options
grid on;
grid minor;
axis([-ix ix -ix ix])
pbaspect([1 1 1]);

