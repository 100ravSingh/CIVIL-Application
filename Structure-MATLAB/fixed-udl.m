/* Q6. A fixed beam carrying an uniformly distributed load w KN\m of span L meters.Calculate the
Reactions,Shear Force, Bending moment ,slope and deflection at middile ofspan?\
(w=123KN\m,E=250*109 N/m2,I=250*10-6 m4,L=22m).

Ans= (R1=R2= 1353.00 KN, M1=M2= -4961.00 KNm, S.F.D=0.00 KN , B.M.D= 2480.500 KNm, slope=0.000e+00, Deflection= 1.201e-03m middile of the span) */

disp('Analysis of fixed beam having UDL:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the udl load in KN/m:\n');
R1=w*L/2;
R2=w*L/2;
M1=-(w*L^2)/12;
M2=-(w*L^2)/12;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
fprintf('M1=%6f KNm\n',M1);
fprintf('M2=%6f KNm\n',M2);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 X1(k)=X(k);
 V(k)=w*((L/2)-X1(k));
 M(k)=(w/12)*(6*L*X1(k)-L^2-6*X1(k)^2);
 Th(k)=w*(2*X1(k)*L^2-6*L*X1(k)^2+4*X1(k)^3)/(24*E*I);
 def(k)=(w*X(k)^2)*(L^2-2*L*X1(k)+X1(k)^2)/(24*E*I);
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