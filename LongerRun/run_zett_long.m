%% Arithmetic Productivity Growth: X_{t+1} = \zeta + X_{t}
%  alfa = 0.8
%  longer run simulation

clc
clear all
close all

load zett_alfa.mat

D = csvread('broadberry.csv');

Tend = size(D,1);

Tspan = 30;

ySim = NaN(Tspan+1,365+Tspan,1); 

for z = 1:Tspan+1
    
    % t   per
    % 366 1635
    % 381 1650
    % 396 1665
    
    per = D(1:Tend,1);
    Yd  = D(1:Tend,2);
    Ld  = D(1:Tend,3);
    yd  = Yd./Ld;

    T   = Tend;
    t   = 1:1:Tend;
    t   = t';

    alfa = 0.8;
    
    X(1,1) = yd(1,1)*(Ld(1,1)^(1-alfa));

    L = Ld;
    
    zett = ZET_zett(z,1);
    
    for t=1:1:T
        y(t,1)   = X(t,1)*(L(t,1)^(alfa-1));
        X(t+1,1) = zett+X(t,1);
    end
    
    for t=1:1:T-1
        nd(t,1)   = L(t+1,1)/L(t,1);
    end

    X = X(1:T,:);
    y = y(1:T-1,:);
    
    ySim(z,1:Tend-1,:) = y'; 

end

ySimT = ySim';

ySimT_zett_long = ySimT;

save('zett_alfa_long.mat','ySimT_zett_long')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%