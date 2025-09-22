function x = oscillator(freq, fs, dur, A, D, S, R)
  % generez vectorul de timp
  t = (0:1/fs:dur-1/fs)';
  
  sine_wave = sin(2*pi*freq*t);
  % calculez numarul de esantioane pentru fiecare faza a ADSR
  attack = floor(A * fs);
  decay = floor(D * fs);
  sustain = floor(S * fs);
  release = floor(R * fs);
  % numarul total de esantioane
  tot = length(t);
  
  sustain = tot - attack - decay - release;
  % generez curba de attack (de la 0 la 1)
  A_env = linspace(0, 1, attack)';
  % generez curba de decay (de la 1 la nivelul de sustain)
  D_env = linspace(1, S, decay)';
  % generez faza de sustain (nivel constant)
  S_env = S * ones(sustain, 1);
  % generez curba de release (de la nivelul de sustain la 0)
  R_env = linspace(S, 0, release)';
  % combin toate fazele ADSR 
  env = [A_env; D_env; S_env; R_env];
    
  x = sine_wave .* env;
endfunction

