function [coeffs, f_haar_c, f_haar_x] = ExpandHaarSeries(a,b,f, J, options)
%-------------------------------------------------------------------------%
% ExpandHaarSeries Expands a function into the using Haar wavelets as basis
% 
% INPUTS:
%   a   - Lower limits
%   b   - Upper limits
%   f   - Function handle 
%   J   - maximum level of resolution
%   option - Either to plot f_haar_x; fhx = 1. Or not; fhx = 0.
%            Either to plot f; fx = 1. Or not; fx = 0.
%
% OUTPUT:
%   coeffs      - Haar wavelet coefficients as a vector.
%   f_haar_c    - f reconstrction using collocation points
%   f_haar_x    - f reconstrction using linearly spaced point btw a and b.
% USAGE:
%   [coeffs, f_haar_c, f_haar_x] = ExpandHaarSeries(0,1,f, 4); - displays 
%   the plots of coefficients, and plot of reconstrction using collocation points
%   [coeffs, f_haar_c, f_haar_x] = ExpandHaarSeries(0,1,f, 4,fhx=1,fx=1); -
%   displays the plot of the coefficients, and plot containing
%   reconstrction using collocation points, linearly spaced points btw and
%   b, and the plot of the function.
%-------------------------------------------------------------------------%
% Author: Emmanuel Adebayo
% Email: adebayo@udel.edu
% Date: 30-Nov-2024
%-------------------------------------------------------------------------%
    arguments
        a (1,1) double
        b (1,1) double
        f (1,1) function_handle
        J (1,1) double
        options.fhx (1,1) {mustBeMember(options.fhx, [0,1])} = 0
        options.fx (1,1) {mustBeMember(options.fx, [0,1])} = 0
    end


    N = 2*2^J;
    dt = (b-a)/N;
    is = 1:1:N;
    
    % Collocation method
    tl = a + (is -0.5).*dt; % Collocation points.

    N = length(tl);
    H = zeros(N,N);
    for i = 1:N
        H(i,:) = haar(a,b,tl,i,J);
    end
    
    y = f(tl)';
    coeffs = H' \ y;

    figure
    stem(coeffs,'filled')
    xlabel("i")
    ylabel("c_i")
    title("Wavelet coefficients")
    
    % Reconstruct Using Collocation points
    figure
    f_haar_c = coeffs' * H;
    plot(tl,f_haar_c,'LineWidth',1,'DisplayName','f_{haar}_c')
    xlabel("x")
    ylabel("f(x)")
    hold on
    legend("AutoUpdate","on")
    
    

    % Reconstruct Using data points
    x = linspace(a,b,10000);
    f_haar_x = zeros(1,length(x));
     
    for k = 1:N
        f_haar_x = f_haar_x + coeffs(k) * haar(a,b,x,k,J);
    end
    if options.fhx == 1
        plot(x,f_haar_x,"DisplayName","f_{haar}_x")
    end
    
    if options.fx == 1
        plot(x,f(x),'k--','LineWidth',1,'DisplayName','f(x)')
    end
    hold off
    
end


