/* Q4. A cantilever beam under the external point load 1000 KN having span 20m acting on 10 m from the
left free hand. Calculate the Reactions ,Shear Force ,Bending moment ,slope and deflection at 17m from
left free?( E=250*109 N/m2,I=250*10-6 m4)

Ans = (R1= 1000.00 KN,M1= -10000.00 KNm, S.F.D= -1000.000 KN, B.M.D= -7000.000 KNm, slope=-5.760e-04, deflection = 6.480e-04m at x=17m) */

disp('Analysis of Cantilever beam having Point Load and left side free end:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the point load in KN:\n');
a=input('enter the position of point load from left side:\n');
b=L-a;
R1=w;
M1=-w*b;
fprintf('R1=%6f KN\n',R1);
fprintf('M1=%6f KNm\n',M1);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 if X(k)<=a
 X1(k)=X(k);
 V(k)=0;
 M(k)=0;
 Th(k)=((w*b^2)/(6*E*I))*(-3);
 def(k)=((w*b^2)/(6*E*I))*(-3*L-3*X1(k)-b);

fprintf('%4.0f%12.3f%14.3f%19.3e%19.3e\n',X(k),V(k),M(k),Th(k),def(k));
 else if a<X(k)<=L
 X2(k)=X(k);
 V(k)=-w;
 M(k)=-w*(X2(k)-a);
 Th(k)=((w)/(6*E*I))*(-2*(L-X2(k))*((3*b-L+X2(k))+(L-X2(k))^2));
 def(k)=((w*(L-X2(k))^2)/(6*E*I))*(3*b-L+X2(k));

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