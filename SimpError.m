function simpsons_error = SimpError(n , a, b)

%Q6 Note n is the number of subintervals and not the number of points.

x0 = a; 
xN = b;
d = (b-a)/n;
x = 0:d:pi;

f_x = @(x) x.*sin(x);    %FUNCTION xsinx
y = f_x(x);              %EVALUATE xsinx at points in x

%Using h*[0.5((f(x0)+f(xn))+sum(i = 1 to N-1): f[xi])]
%The first terms will be (f(x0)+f(xn))*0.5
FIRST_TERM = x0*sin(x0);
LAST_TERM = xN*sin(xN);
EVEN_SUM = 0;
ODD_SUM = 0;
% we sum to n-1 because the Nth term has been included in the above
% sum
for i = 1:n
    if rem(i+1, 2) == 0
        EVEN_SUM = EVEN_SUM+4*y(i);
    else
        ODD_SUM = ODD_SUM+2*y(i);
    end
end
approximation = (d/3)*(FIRST_TERM+ EVEN_SUM+ODD_SUM+LAST_TERM);
actual = sin(pi)-pi*cos(pi); %Should equal pi
diff = abs(actual-approximation); %Simpson vs actual
%6a_c - Log Log Plot of Error
simpsons_error = diff;
end