function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  
  % deschid si parsez fisierul CSV de la calea specificata
  data = csvread(path);
  % returnez matricea de valori
  mat = data(2:end, 2:end);
end
