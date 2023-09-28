/* Q7.Analysis the propped cantilever beam under the load of 120 KN at a distance 9m from the left hinged
support having span of 20m. Calculate the Reactions ,Shear Force ,Bending moment , slope and
deflection at 18m from left support ?(E=250*109 N/m2,I=250*10-6 m4).

Ans- R1=44.46 KN,R2=30.982 KN, S.F.D =-75.532 KN ,B.M.D= -279.585 KNm ,S lope=1.572e-05,Deflection= -1.539e-05m at 18 m from left) */

disp('Analysis of Propped Cantilever beam having point load fixed from
right side:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the Concentrated load in KN:\n');
a=input('enter the position of point load from left support:\n');
b=L-a;
R1=w*(3*(b^2)*L-b^3)/(2*L^3);
R2=w*(3*(a^2)*L-a^3)/(2*L^3);
M1=R1*L-w*b;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
fprintf('M1=%6f KNm\n',M1);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm) theta(radian) deflection(m)\n');
for k=1:1:(L+1)
 if X(k)<=a
 X1(k)=X(k);
 V(k)=R1;
 M(k)=w*X1(k)*(3*(b^2)*L-b^3)/(2*L^3);
 Th(k)=(3*R1*L^2-3*R1*X1(k)^2-3*w*((L-a)^2))/(6*E*I);
 def(k)=(3*R1*L^2*X1(k)-R1*X1(k)^3-3*w*((L-a)^2)*X1(k))/(6*E*I);

fprintf('%4.0f%12.3f%14.3f%19.3e%19.3e\n',X(k),V(k),M(k),Th(k),def(k));
 else if a<X(k)<=L
 X2(k)=X(k);
 V(k)=R1-w;
 M(k)=(w*X2(k)*(3*(b^2)*L-b^3)/(2*L^3))-(w*(X2(k)-a));
 Th(k)=(R2*(3*X2(k)^2-3*L^2)+6*w*a*(L-X2(k)))/(6*E*I);
 def(k)=(R2*(X2(k)^3-3*L^2*X2(k)+2*L^3)-3*w*a*(LX2(k))^2)/(6*E*I);

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
