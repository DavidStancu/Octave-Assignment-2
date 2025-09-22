function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
  
  
  % determin numarul de intervale
  n = length(x) - 1;
  % initializez vectorul rezultat
  y_interp = zeros(size(x_interp));

  % parcurg fiecare punct de interpolare
  for j = 1:length(x_interp)
    % gasesc intervalul corespunzator pentru x_interp(j)
    i = find(x_interp(j) >= x(1:end-1) & x_interp(j) < x(2:end), 1);
    % daca x_interp(j) este exact ultimul nod
    if isempty(i)
      if x_interp(j) == x(end)
        i = n;
      else
        continue;
      endif
    endif
    % extrag coeficientii pentru intervalul gasit
    ai = coef(4*(i-1) + 1);
    bi = coef(4*(i-1) + 2);
    ci = coef(4*(i-1) + 3);
    di = coef(4*(i-1) + 4);
    
    % calculez valoarea interpolata
    y_interp(j) = ai + bi * (x_interp(j) - x(i)) + ci * (x_interp(j) - x(i))^2 + di * (x_interp(j) - x(i))^3;
   endfor
end
