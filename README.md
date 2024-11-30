# Expanding Functions into the Haar Wavelet Series
 ## Overview
 Let $f(x)$ be a square-integrable function for $x \in [a,b]$. The function can be expanded into Haar wavelets series
 
$$f(x) = \sum\limits_{i = 1}^{2M} {{c_i}{h_i}\left( x \right)} $$.

Where $c_i$ denotes the Haar wavelet coefficients.



Let ${x_l} = a + \frac{{\left( {b - a} \right)\left( {l - 0.5} \right)}}{{2M}}$ be the collocation points. Therefore, we would have;


$$f({x_l}) = \sum\limits_{i = 1}^{2M} {{c_i}{h_i}\left( {{x_l}} \right)} $$

$$ \Rightarrow f = cH$$

$$  \Rightarrow c = f{H^{ - 1}} $$

## Haar Wavelets
Consider the interval $x \in [a,b]$, where a and b are the given constant. 

Define $M = 2^J$, where J is the maximal level of the resolution.

Define $\Delta x = \frac{b-a}{2M}$

The parameter $j = 0,1, \ldots ,J$ and $k = 0,1, \ldots ,m - 1$(where $m=2^j$) is introduced.

The index $i$ is calculated from the formula $i=m+k+1$. Where $i=2$ is the minimal and $i=2(2^J)$ is the maximal.


The i-th Haar wavelet is defined as

$$
h_i(x) = \begin{cases}
        1, & \text{for } x \in [\alpha,\beta ), \\
        -1, & \text{for } x \in [\beta,\gamma ), \\
        0, & \text{otherwise } 
    \end{cases}
$$

Where 
- $\alpha  = a + 2k\mu \Delta x$
- $\beta  = a + \left( {2k + 1} \right)\mu \Delta x$
- $\gamma  = a + 2\left( {k + 1} \right)\mu \Delta x$
- $\mu  = M/m$

and 

$$
 h_1(x) = \begin{cases}
        1, & \text{for } x \in [a,b), \\
        0, & \text{otherwise } 
    \end{cases}
$$

## Prerequisites
MATLAB R2022 or later

## Project Structure

