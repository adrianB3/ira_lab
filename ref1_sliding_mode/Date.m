km=0.33;
ke=0.33;
La=14.28e-3;
Ra=4.2;
J=0.71e-3;
kp=35;
pc=tf([kp/ke], [La*J/ke/km Ra*J/ke/km 1]);
kr=1.1792;
Ti=0.0234;

a1=ke*km/J/La;
a2=Ra/La;
b=-km*kp/J/La;
c=240;
delta=0.1;
fmax=1e+6;