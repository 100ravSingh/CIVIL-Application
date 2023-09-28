/* Q3.A simple supported beam under the external point load 200 KN having span 15m acting on 7 m from
the left support. Calculate the Reactions ,Shear Force ,Bending moment ,slope and deflection at 10m
from left support?( E=250*109 N/m2,I=250*10-6 m4)
Ans= (R1=106.67 KN,R2=93.33 KN, S.F.D =-93.333 KN ,B.M.D= 466.667 KNm ,S lope=-3.772e-05 ,Deflection= 1.879e-04m ) */

disp('Analysis of Simple supported beam having Point Load:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the point load in KN:\n');
a=input('enter the position of point load from left support:\n');
b=L-a;
R1=w*b/L;
R2=w*a/L;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 if X(k)<=a
 X1(k)=X(k);
 V(k)=R1;
 M(k)=R1*X1(k);
 Th(k)=((w*b)/(6*E*I*L))*(L^2-b^2-3*X(k)^2);
 def(k)=((w*b*X1(k))/(6*E*I*L))*(L^2-b^2-3*X(k)^2);

fprintf('%4.0f%12.3f%14.3f%19.3e%19.3e\n',X(k),V(k),M(k),Th(k),def(k));
 else if a<X(k)<=L
 X2(k)=X(k);
 V(k)=R1-w;
 M(k)=R1*(X2(k))-w*(X2(k)-a);
 Th(k)=((w*a)*((-L*X2(k)*2)+X2(k)^2+a^2)+(L-X2(k))*((-L*X2(k)*2)+X2(k)^2+a^2))/(6*I*E*L);
 def(k)=(((w*a)*(L-X2(k))/(6*E*I*L))*(L*X2(k)*2-X2(k)^2-a^2));

fprintf('%4.0f%12.3f%14.3f%19.3e%19.3e\n',X(k),V(k),M(k),Th(k),def(k));
 end
 end
end
subplot(2,2,1);
plot(X,M)
title('BENDING MOMENT');
 xlabel('x(m)');
 ylabel('BENDING MOMENT(KN-m)');
 grid on;
 subplot(2,2,2);
 plot(X,V)
 title('SHEAR FORCE');
 xlabel('x(m)');
 ylabel('SHEAR FORCE KN');
 grid on
 subplot(2,2,3);
 plot(X,Th)
 title('Slope');
 xlabel('x(m)');
 ylabel('Slope in radian');
 grid on
 subplot(2,2,4);
 plot(X,def)
 title('deflection');
 xlabel('x(m)');
 ylabel('deflection in m');
 grid on
