/* Q9. Calculate the Deflection and slope in 10m propped cantilever at 3m from left support having udl 30
KN/m?(E=250*109 N/m2,I=250*10-6 m4).

Ans=(R1= 112.50 KN ,R2= 187.00 KN ,M1= -375.00 KNm , S.F.D= 22.5 KN , B.M.D= 202.5 KNm at 3m from left) */

disp('Analysis of Propped Cantilever beam having udl load fixed from right
side:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the udl load in KN\m:\n');
R1=w*3*L/8;
R2=w*5*L/8;
M1=R1*L-(w*L^2)/2;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
fprintf('M1=%6f KNm\n',M1);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 X1(k)=X(k);
 V(k)=R1-w*X1(k);
 M(k)=R1*X1(k)-w*(X1(k)^2)/2;
 Th(k)=(w/(48*E*I))*(L^2-9*L*X1(k)^2+8*X1(k)^3);
 def(k)=(w/(48*E*I))*((L^2)*X1(k)-3*L*X1(k)^3+2*X1(k)^4);
 fprintf('%4.0f%12.3f%14.3f%19.3e%19.3e\n',X(k),V(k),M(k),Th(k),def(k));
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
