function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  
  % numar recenziile pentru fiecare utilizator
  nr_reviews = sum(mat ~= 0, 2);
  % identific utilizatorii cu cel putin min_reviews recenzii
  clients = nr_reviews >= min_reviews;
  % % filtrez randurile cu mai puține recenzii
  reduced_mat = mat(clients, :);
end