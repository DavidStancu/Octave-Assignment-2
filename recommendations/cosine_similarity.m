function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  
  % normalizez vectorul A
  A_norm = A/norm(A);
  % normalizez vectorul B
  B_norm = B/norm(B);
  
  % calculez produsul scalar intre vectorii normalizati
  similarity = dot(A_norm, B_norm);
end
