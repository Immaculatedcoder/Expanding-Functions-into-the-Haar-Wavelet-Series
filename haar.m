function h = haar(a,b,x,i,J,options)
    %----------------------------------------------------------------%
    % This function is used to generate the wavelet function for any
    % a<=x<=b. 
    % Inputs: 
    %        a - lower limit
    %        b - upper limit 
    %        x - vector points between a and b.
    %        i - is any integer between 1 and i_max
    %        J - maximum level of resolution
    %        options - Either to plot option = 1 or not option = 0(default)
    %         
    % Note that i_max = 2(2^J)
    % Output:
    %       h - genetates a value {-1,0,1} depending on the inputs
    % Usage:
    %       h = haar(0,1,0.1,7,2) output one data point h
    %       h = haar(0,1,linspace(0,1,1000),7,2,1); Plot 7th Haar Wavelet
    %----------------------------------------------------------------%
    % Author: Emmanuel Adebayo
    % Email: adebayo@udel.edu
    % Date: 30-Nov-2024
    %----------------------------------------------------------------%
    arguments
        a (1,1) double 
        b (1,1) double 
        x (1,:) double
        i (1,1) double
        J (1,1) double
        options (1,1) {mustBeMember(options, [0,1])} = 0
    end
    
    if J < 0
        warning('Enter a positive Number')
    else
        % Scaling function
        if i == 1
            h = (a <= x & x <= b) * 1 + (~(a <= x & x <= b)) * 0;
        else
            M = 2^J;
            dx = (b-a)/(2*M);
            m = 2^(ceil(log2(i)) - 1);
            k = i - m - 1;
    
            mu = M/m;
    
            xi_1 = a + 2*k*mu*dx;
            xi_2 = a + (2*k+1)*mu*dx;
            xi_3 = a + 2*(k+1)*mu*dx;
    
            h = (xi_1 <= x & x < xi_2) * 1 + (xi_2 <= x & x< xi_3 ) * (-1);
        end
    end
    
    % Option to display all Graphs
    if options == 1
        h = haar(a,b,x,i,J);
        plot(x,h,"b-")
        title(['h_{',num2str(i),'}(x)'])
    end
end

