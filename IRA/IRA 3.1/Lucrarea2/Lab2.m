Ra = 4.2; %ohm
La = 14.28e-3; %mH
ke = 0.33; 
km = ke;
J = 0.71e-3; %kg*m^2
kp = 35; %V/V
%kp = 25; %V/V

w = 1;
v = -0.2;
vt = 0.6;

Te = 0.01; %s



%model referinta
omg0 = 55;
gm = 0.7;
%Hm = Bm / Am
Bm = omg0^2;
Am = [1 2*gm*omg0 omg0^2];


%proces condus
%Hp = B/A
B = [La Ra];
A = [La*J Ra*J km*ke];
hp = tf(B, A);

hpq = c2d(hp, Te, 'zoh')


K = hpq.num{1}(2)
b = -hpq.num{1}(3)/K


a1 = hpq.den{1}(2)
a2 = hpq.den{1}(3)

factor = deconv(hpq.den{1}, [1, -1])
a = -factor(2)



%cazul 1

Bplus = [1 -b]
Bminus = K

Amq = Am
p1 = Amq(2)
p2 = Amq(3)

Bm = [1+p1+p2 0]

Bmbara = Bm/K

Rbarabara = 1;

R = conv(Bplus, [1, -1])*Rbarabara

A0q = [1 0]


s2 = (p1 + a + 2)/K
s1 = (p2 -2*a -1)/K
s0 = a/K

Rq = [1 -b-1 b]
Tq = [(1+p1+p2)/K 0 0]

S = [s2 s1 s0]



