function mono = stereo_to_mono(stereo)
  % calculez mediei pe fiecare linie pentru a obtine semnalul mono
  mono = mean(stereo, 2);
  % normalizez semnalulul mono astfel incat valorile sale sa fie in intervalul [-1, 1]
  mono = mono / max(abs(mono));
endfunction

