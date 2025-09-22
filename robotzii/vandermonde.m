function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    
    % calculez coeficientii Vandermonde
    n = length(x);
    A = zeros(n, n);
    
    for i = 1:n
      A(:, i) = x.^(i-1);
    endfor
    
    coef = A \ y(:);
endfunction
