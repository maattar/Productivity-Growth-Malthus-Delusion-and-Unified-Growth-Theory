%% Exponential Productivity Growth: X_{t+1} = (1+\eta)X_{t}
%  alfa = 0.8

clc
clear all
close all

D = csvread('broadberry.csv');

Tspan = 30;

ETT  = zeros(Tspan+1,1);

ySim = NaN(Tspan+1,365+Tspan,1); 

for z = 1:Tspan+1
    Tend = 365 + z;
    
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
    
    x0   = 0.005;
    etta = etta_nested(Tend,x0);
    
    for t=1:1:T
        y(t,1)   = X(t,1)*(L(t,1)^(alfa-1));
        X(t+1,1) = (1+etta)*X(t,1);
    end
    
    for t=1:1:T-1
        nd(t,1)   = L(t+1,1)/L(t,1);
    end

    X = X(1:T,:);
    y = y(1:T-1,:);
        
    ETT(z,1) = etta;
    
    ySim(z,1:Tend-1,:) = y'; 

end

ySimT = ySim';

ySimT_etta = ySimT;
ETT_etta = ETT;

save('etta_alfa.mat','ySimT_etta','ETT_etta')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%