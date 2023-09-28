/* Q8.A continuous beam with equal alignment such that no deflection in middile.An external load acting
on each beam 20KN/m and 100 KN at distance of 6m from right hinge in first and second member of the
beam of span 20m respectively. Calculate S.F.D and B.M.D and reactions at a 16m from left end?(E=250*109 N/m2,I=250*10-6 m4)

Ans= (R1= 36.60KN , R2= 286.80 KN,R3= -23.40 KN ,M1= 0.00 KNm , M2= -634.00KNm ,M3=0.00KN ,S.F.D= 123.400KN , B.M.D= 106.400 KNm) */

disp('Analysis of continious beam having 3 hinged support with equal
alignment:\n');
L=input('enter the first span of beam or second in m:\n');
E=input('enter the value of the modulus of the elasticity(N/m^2):\n');
I=input('enter the value of the moment of inertia(m^4):\n');
w1=input('enter the udl load in KN\m:\n');
w2=input('enter the point load in KN:\n');
a=input('enter the position of point load from 1st beam:\n');
b=L-a;
x1=L/2;
x2=(L+b)/3;
A1=(2/3)*(L/2)*w1*(L^2)/8;
A2=(1/2)*L*w2*a*b/L;
M1=0;
M3=0;
M2=(-6/L)*((A1*x1/L)+(A2*x2/L));
R1=(M2/L)+(w1*L/2);
R3=(M2/L)+w2*a/L;
R2=w1*L+w2-R1-R3;
fprintf('R1=%6f KN\n',R1);
fprintf('R2=%6f KN\n',R2);
fprintf('R3=%6f KN\n',R3);
fprintf('M1=%6f KNm\n',M1);
fprintf('M2(MIDDILE)=%6f KNm\n',M2);
fprintf('M3=%6f KNm\n',M3);
X=0:1:2*L;
disp('distance(m) shear(KN) BM(KNm):\n');
for k=1:1:(2*L+1)
 if X(k)<=L
 X1(k)=X(k);
 V(k)=R1-w1*X1(k);
 M(k)=R1*X1(k)-w1*(X1(k)^2)/2;
 fprintf('%4.0f%12.3f%14.3f\n',X(k),V(k),M(k));
 elseif L<X(k)<=(L+a)
 X2(k)=X(k);
 V(k)=R1-w1*L+R2;
 M(k)=R1*X2(k)-w1*L*((L/2)+(X2(k)-L))+R2*((X2(k)-L));
 fprintf('%4.0f%12.3f%14.3f\n',X(k),V(k),M(k));
 elseif (L+a)<X(k)<=(2*L)
 X3(k)=X(k);
 V(k)=R1-w1*L+R2-w2;
 M(k)=R1*X3(k)-w1*L*((L/2)+a+X3(k)-(L+a))+R2*(X3(k)-L)-w2*(X3(k)-(L+a));
 fprintf('%4.0f%12.3f%14.3f\n',X(k),V(k),M(k));
 end
end
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