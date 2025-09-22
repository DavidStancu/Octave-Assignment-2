function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients
  
  % numarul de coeficienti
  n = length(coef);
  % numarul de puncte de interpolare
  m = length(x_interp);
  
  % initializez vectorul pentru valorile interpolate
  y_interp = zeros(m, 1);
  
  
  for i = 1:m
    y_interp(i) = coef(1);
    x_power = 1;
    for j = 2:n
      % calculez puterea lui x
      x_power = x_power * x_interp(i);
      % adaug termenul la valoarea interpolata
      y_interp(i) = y_interp(i) + coef(j) * x_power;
    endfor
  endfor
end
