function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
 # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
 
  % citesc matricea din fisierul CSV
  mat = read_mat(path);
  % preprocesam matricea
  mat = preprocess(mat, min_reviews);
  % calculez SVD redus al matricei
  [U, S, V] = svds(mat, num_features);
  
  V = V';

  % initializez un vector pentru stocarea similaritatilor
  similarities = zeros(size(V, 2), 1);
  
   % calculez similaritatea cosinus între 'liked_theme' si fiecare tematica
  for i = 1:size(V, 2)
    similarity_scores(i) = cosine_similarity(V(:, liked_theme), V(:, i));
  endfor
  
  % sortez dupa scorurile de similaritate
  [~, sorted_indices] = sort(similarity_scores, 'descend');
  % exclud tema preferata
  sorted_indices(sorted_indices == liked_theme) = [];
  % obtin primele num_recoms teme recomandate
  recoms = sorted_indices(1:num_recoms);
end
