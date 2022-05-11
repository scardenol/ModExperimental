function [M_bestfit, M_AIC, M_MDL] = best_ARX(train, test, na, nb, nk, type)
NN = struc(na, nb, nk);
type = upper(type);
switch type
    case {'ARX'}
        V = arxstruc(train, test, NN);
    case {'IV'}
        V = ivstruc(train, test, NN);
end

order_bestfit = selstruc(V, 0);
order_AIC = selstruc(V, 'aic');
order_MDL = selstruc(V, 'mdl');
M_bestfit = arx(train, order_bestfit);
M_AIC = arx(train, order_AIC);
M_MDL = arx(train, order_MDL);

% Refine.
M_bestfit = pem(train, M_bestfit);
M_AIC = pem(train, M_AIC);
M_MDL = pem(train, M_MDL);

end