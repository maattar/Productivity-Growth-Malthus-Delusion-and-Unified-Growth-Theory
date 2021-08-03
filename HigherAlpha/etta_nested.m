function x = etta_nested(Tend,x0) 

options = optimset('Display','off','Algorithm','active-set');

x = fmincon(@nestedfun,x0,[],[],[],[],0,0.01,[],options);

% Nested function that computes the objective function     
    function f = nestedfun(x)
        
        D = csvread('broadberry.csv');
        
        Yd  = D(1:Tend,2);
        Ld  = D(1:Tend,3);
        yd  = Yd./Ld;

        T   = Tend;
        t   = 1:1:Tend;
        t   = t';

        alfa = 0.8;
    
        X(1,1) = yd(1,1)*(Ld(1,1)^(1-alfa));

        L = Ld;
        
        for t=1:1:T
            y(t,1)   = X(t,1)*(L(t,1)^(alfa-1));
            X(t+1,1) = (1+x)*X(t,1);
        end
        
        f = abs(y(T,1)-yd(T,1));   
    end
end