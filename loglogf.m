function loglogplot = loglog(a, b)
%Q6 Summary of this function goes here
%   Detailed explanation goes here
n_i = [16, 32, 64, 128];
n_N = length(n_i);
start = a;
finish = b;

for j = 1: n_N
    y_trap_err(j)= (Q6a(n_i(j),start,finish));
    y_simp_err(j) = (Q6b(n_i(j),start,finish));  
end

loglog(n_i,y_trap_err, n_i,y_simp_err, '-s');
%legend('log-log trapezoid', 'log-log simpsons', 'LOBF trap', 'LOBF simp')
x_log = log(n_i);
y_trap_log = log(y_trap_err);
y_simp_log = log(y_simp_err);
trap_fit = polyfit(x_log, y_trap_log,1);
simp_fit = polyfit(x_log, y_simp_log,1);

hold on

plot (n_i, exp(polyval(trap_fit, x_log)),n_i, exp(polyval(simp_fit, x_log)));
ylabel([{'loglog errors'}]);
xlabel([{'loglog n'}]);
grid on;
