s=tf('s');
pc=2/(s^2+7*s+6);
Ts=0.1;
pcd=c2d(pc, Ts, 'zoh')
pcdf=filt(pcd.num{1}, pcd.den{1}, Ts);B=pcd.num{1}(2:3);A=pcd.den{1};
nA=2;nB=1;
Tsim=20;
N=(Tsim/Ts);
Orizont=3;
Q=eye(Orizont);lambda=0.0001;
R=zeros(N+Orizont, 1); R(21:end)=1;

e30=1;
E3=[e30 -A(2)*e30 A(2)*A(2)*e30-A(3)*e30];
F3=[-A(2)*E3(3)-A(3)*E3(2) -A(3)*E3(3)];
tmp=conv(E3, B);
G3=tmp(1:3); H3=tmp(4);

e10=1;E1=e10;F1=-e10*[A(2) A(3)];G1=B(1);H1=B(2);

e20=1;E2=[e20 -e20*A(2)];F2=[-e20*A(3)-E2(2)*A(2) -E2(2)*A(3)];
tmp=conv(E2,B); G2=tmp(1:2);H2=tmp(3);

P=[G1 0 0; fliplr(G2) 0; fliplr(G3)]; H=[F1 H1; F2 H2; F3 H3];
clear myMPC