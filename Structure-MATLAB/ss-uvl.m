/* Q5. .A Simple supported beam carrying an uniformly varying load 77 KN\m of span 14 meters.Calculate
the Reactions ,Shear Force ,Bending moment , slope and deflection at 4m from right end?(E=250*10+9N/m2,I=250*10-6 m4). 

Ans= (R1= 179.67 KN, R2=-359.33 KN, S.F.D =-95.333 KN,B.M.D= 880.000 KNm, slope= 1.071e-04 , B.M.D=4.058e-04m at 4m fro right support) */

disp('Analysis of Simple supported beam having UVL:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the uvl load in KN/m:\n');
R1=w*L/6;
R2=-w*L/3;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 X1(k)=X(k);
 V(k)=w*(L/6-(X1(k)^2)/(2*L));
 M(k)=w*(X1(k)/6)*(L-(X1(k)^2)/L);
 Th(k)=(w*L*(X1(k)^2)/12-w*(X1(k)^4)/(24*L))/(E*I);
 def(k)=(w*L*(X1(k)^3)/36-w*(X1(k)^5)/(120*L))/(E*I);
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