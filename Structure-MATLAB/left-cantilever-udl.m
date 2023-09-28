/* Q2.A Cantilever beam carrying an uniformly distributed load w KN\m of span L meters free hand at
right side such that udl span same as beam span.Calculate the Reactions ,Shear Force ,Bending moment
at fixed end and also calculate slope and deflection at free end?(w=80KN\m ,E=250*109 N/m2,I=250*10-6 m4,L=20m).

Ans= (R1=S.F.D=1600.00 KN,M1=B.M.D=-16000.00 KNm (fixed end) Slope=-1.707e-03 ,Deflection=2.560e-02m free end) */

disp('Analysis of cantilever beam having UDL:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the udl load in KN/m:\n');
R1=w*L;
M1=-(w*L^2)/2;
fprintf('R1=%6f KN\n',R1);
fprintf('M1=%6f KNm\n',M1);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 X1(k)=X(k);
 V(k)=w*X1(k);
 M(k)=-w*((X1(k)^2)/2);
 Th(k)=(w/(24*E*I))*(4*X1(k)^3-4*L^3);
 def(k)=(w/(24*E*I))*(X1(k)^4-4*L^3*X1(k)+3*L^4);
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
