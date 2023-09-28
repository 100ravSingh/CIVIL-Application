/* Q10.A Fixed beam carry point load 360 kN of span 15m at a position of 5m from left support and
calculate the maximum deflection ? also maximum deflection?(E=250*109 N/m2,I=250*10-6 m4).

Ans= (R1=266.67 KN , R2=93.33KN ,M1= -800.00 KNm , M2=-400.00KNm ,Dmax= 7.680000e-05m,S.F.D=266.67 KN , B.M.D= 533.333 KNm) */


disp('Analysis of fixed beam having point load in arbitary position:\n');
L=input('enter the span of beam in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w=input('enter the point load in KN:\n');
a=input('enter the position of load from left support:\n');
b=L-a;
R1=w*((b^2)*(3*a+b)/(L^3));
R2=w*((a^2)*(3*b+a)/(L^3));
M1=-(w*a*b^2)/(L^2);
M2=-(w*b*a^2)/(L^2);
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
fprintf('M1=%6f KNm\n',M1);
fprintf('M2=%6f KNm\n',M2);
X=0:1:L;
disp('distance(m) shear(KN) BM(KNm):\n');
for k=1:1:(L+1)
 if X(k)<=a
 X1(k)=X(k);
 V(k)=R1;
 M(k)=M1+R1*X1(k);
 fprintf('%4.0f%12.3f%14.3f\n',X(k),V(k),M(k));
 elseif a<X(k)<=L
 X2(k)=X(k);
 V(k)=R1-w;
 M(k)=M1+R1*X2(k)-w*(X2(k)-a);
 fprintf('%4.0f%12.3f%14.3f\n',X(k),V(k),M(k));
 end
end
Dmax=(2*w*a^3*b^2)/(3*E*I*(3*a+b)^2);
fprintf('Dmax=%18e KNm\n',Dmax);
subplot(2,1,1);
plot(X,M)
title('BENDING MOMENT');
 xlabel('x(m)');
 ylabel('BENDING MOMENT(KN-m)');
 grid on;
 subplot(2,1,2);
 plot(X,V)
 title('SHEAR FORCE');
 xlabel('x(m)');
 ylabel('SHEAR FORCE KN');
 grid on