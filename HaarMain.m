%% Task 1: Generate the first 8 haar wavelets using the haar.m
close all;
J = 2; % 8 Haar wavelets since i_max = 2(2^J)
a = 0; b = 1; 


for i = 1:2*2^J
    x = linspace(a,b,1000);
    h = haar(a,b,x,i,J);
    subplot(2,2^J,i)
    plot(x,h,"b-")
    title(['h_{',num2str(i),'}(x)'])
end



%% Task 2: Let do some reconstuction
f = @(x) (x ~= 0) .* (abs(x) ./ x) + (x == 0) .* 0;
g = @(x) sqrt(x);


[coeffs_f, f_haar_c, f_haar_x] = ExpandHaarSeries(-3,3,f, 9,fx=1);
[coeffs_g, g_haar_c, g_haar_x] = ExpandHaarSeries(0,1,g, 4,fx=1);







