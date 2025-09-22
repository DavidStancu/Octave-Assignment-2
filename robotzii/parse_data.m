function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn
  
    % deschid fisierul pentru citire
    f = fopen(filename, 'r');
    % citesc numarul de puncte n
    n = fscanf(f, '%d', 1);
    % citesc abscisele punctelor de suport
    x = fscanf(f, '%f', n + 1);
     % citesc ordonatele punctelor de suport
    y = fscanf(f, '%f', n + 1);
    % inchid fisierul
    fclose(f);
end