/* Q1.A Simple supported beam carrying an uniformly distributed load w KN\m of span L meters.Calculate
the Reactions ,Shear Force ,Bending moment at mid span and also calculate slope and deflection at
middile of span?(w=100KN\m,E=250*109 N/m2,I=250*10-6 m4,L=10m). 
Ans= (R1=R2=500KN, S.F.D=0 KN ,B.M.D= 1250 KNm ,Slope=0 ,Deflection= 2.083e-04 m for mid span) */

disp('Analysis of Simple supported beam having UDL:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the udl load in KN/m:\n');
R1=w*L/2;
R2=w*L/2;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 X1(k)=X(k);
 V(k)=w*((L/2)-X1(k));
 M(k)=w*(X1(k)/2)*(L- X1(k));
 Th(k)=(w/(24*E*I))*(L^3-6*L*X1(k)^2+4*X1(k)^3);
 def(k)=(w*X1(k)/(24*E*I))*(L^3-2*L*X1(k)^2+X1(k)^3);
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