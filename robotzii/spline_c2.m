function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% TOOD 1: si(xi) = yi, i = 0 : n - 1

	% TODO 2: s_n-1(xn) = yn

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1

	% TODO 6: s0''(x0) = 0

	% TODO 7: s_n-1''(x_n) = 0

	% Solve the system of equations
  
  % determin numarul de intervale n
  n = length(x) - 1;
  % initializez matricea A si vectorul b
  A = zeros(4 * n, 4 * n);
  b = zeros(4 * n, 1);
  
  % setez conditiile de interpolare la punctele date
  for i = 1:n
    A(i, 4*(i-1)+1) = 1;
    b(i) = y(i);
  endfor

  % Setez conditia de interpolare la ultimul punct
  A(n+1, 4*(n-1)+1:4*(n-1)+4) = [1, x(n+1) - x(n), (x(n+1) - x(n))^2, (x(n+1) - x(n))^3];
  b(n+1) = y(n+1);
  
  % setez continuitatea spline-ului la punctele intermediare
  for i = 1:n-1
    A(n+1+i, 4*(i-1)+1:4*(i-1)+4) = [1, x(i+1) - x(i), (x(i+1) - x(i))^2, (x(i+1) - x(i))^3];
    A(n+1+i, 4*i+1:4*i+4) = [-1, 0, 0, 0];
  endfor
  
  % setez continuitatea primei derivate la punctele intermediare
  for i = 1:n-1
    A(2*n+i, 4*(i-1)+2:4*(i-1)+4) = [1, 2*(x(i+1) - x(i)), 3*(x(i+1) - x(i))^2];
    A(2*n+i, 4*i+2:4*i+4) = [-1, 0, 0];
  endfor

  % Setez continuitatea celei de-a doua derivate la punctele intermediare
  for i = 1:n-1
    A(3*n-1+i, 4*(i-1)+3:4*(i-1)+4) = [2, 6*(x(i+1) - x(i))];
    A(3*n-1+i, 4*i+3:4*i+4) = [-2, 0];
  endfor

  % setez conditia de margine la x0
  A(4*n-1, 3) = 2;
  % setez conditia de margine la xn
  A(4*n, 4*(n-1)+3:4*(n-1)+4) = [2, 6*(x(n+1) - x(n))];
  % rezolv sistemul de ecuatii pentru a obtine coeficientii spline-ului
  coef = A \ b;
end
