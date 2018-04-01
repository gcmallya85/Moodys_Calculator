function f_final = colebrook_gmallya(R,K)
% F = COLEBROOK(R,K) fast, accurate and robust computation of the 
%     Darcy-Weisbach friction factor F according to the Colebrook equation:
%                             -                       -
%      1                     |    K        2.51        |
%  ---------  =  -2 * Log_10 |  ----- + -------------  |
%   sqrt(F)                  |   3.7     R * sqrt(F)   |
%                             -                       -

f_guess = 0.02;
f_final = 0.000001;
iter = 0;
while iter < 100
    if ~strcmp(num2str(f_final,'%.4f'),num2str(f_guess,'%0.4f'))
        f_guess = f_final;
        A = -2*log10((K/3.7)+(2.51/(R*sqrt(f_guess))));
        f_final = (1/A)^2;
    else
        break
    end
    iter = iter + 1;
end   
if iter == 100
    warning('Not converged in 100 iterations: F_guess = %s, F_final = %s\n',num2str(f_final,'%.4f'),num2str(f_guess,'%0.4f'))
end
end