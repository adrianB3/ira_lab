Ra = 4.2; %ohm
La = 14.28e-3; %mH
ke = 0.33; 
km = ke;
J = 0.71e-3; %kg*m^2
kp = 35; %V/V

w = 20; %sigma(t)
v = -12; %sigma(t-0.6)
vTime = 0.6; % s


kr=1.1792;
Ti=0.0234;

a1 = ke*km/J/La;
a2 = Ra/La;
b = -km*kp/J/La;



%delta = 0.02;
%fmax = 10.1e+6;

%k = fmax * 1.1

deltaB2 = 0.2
%fmaxB2 = 10.1e+5
fmaxB2 = 1e+7

bB3 = 1138537;

fi1 = -294.11;
fi2 = -10740;
c = 10000;

kB3 = 5*1e+7;





%%%%%%%%%%%%%%%%%%B1%%%%%%%%%%%%%%%%
fmaxB1 = 1e+7;

cB1 = 290;

alfaConstant = 1.31;

TiB1 = 0.0234;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fmaxB2 = 10e+3
% 
% fmaxB2bun=0; % 3.1623e+08
% fmaxB2=10e+7;
% emin=1000;
% index=0;
% while fmaxB2 < 10e+9
%    sim('L22B2');
%    index=index+1;
%    subplot(4, 2, index)
%    plot(t, y)
%    sum=0;
%    imin=0;
%    for i = 1:length(t)
%        if t(i) > 0.65
%            sum = sum + y(i);
%            if imin == 0
%             imin=i;
%            end
%        end
%    end
%    
%    mean0=abs(sum/(length(t)-imin)-w)
%    if mean0 < emin
%        emin=mean0;
%        fmaxB2bun=fmaxB2;
%    end
%    fmaxB2=fmaxB2*(10^(1/2))
% end
% 
% fmaxB2bun
% fmaxB2 = fmaxB2bun
%sim('L22B2')


sim('L22')

e2B1final = e2B1(length(e2B1))
e2B2final = e2B2(length(e2B2))
e2B3final = e2B3(length(e2B3))

subplot(3, 1, 1)
plot(t, e2B1)
grid
subplot(3, 1, 2)
plot(t, e2B2)
grid
subplot(3, 1, 3)
plot(t, e2B3)
grid