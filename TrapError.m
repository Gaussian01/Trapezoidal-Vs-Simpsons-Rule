function trapezoid_error = TrapError(n, a, b)
%Q6 Summary of this function goes here
%   %Trapezoidal Error Algorithm
%Method

x0 = a; 
xN = b;
h = (b-a)/n;
x = 0:h:pi;

%Terms (f(a)+f(b))
f_x0andf_xN = x0*sin(x0)+ xN*sin(xN);

%matrix method, was faster than the looping method. 
approximation = h/2*(2*(sum(x.*sin(x))-f_x0andf_xN)+f_x0andf_xN);

%taking the anti-derivative of x*sin(x) and evaluating:
%sin(x)-x*cos(x)
actual = sin(pi)-pi*cos(pi); %Which, we know is pi
trapezoid_error = abs(actual-approximation); %trap vs actual


%NOTES:
%Here we compare to the inbuilt function
%y = x.*sin(x)
%trapvs = trapz(x,y)- approximation
return
end
