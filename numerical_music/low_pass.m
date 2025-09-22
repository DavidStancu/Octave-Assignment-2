function signal = low_pass(signal, fs, cutoff_freq)
  % calculez transformata Fourier a semnalului
  signal_fft = fft(signal);
  l = length(signal);
  % generez vectorul frecventelor
  f = (0:(l - 1))' * (fs / l);
  % Generez o masca pentru frecventele sub pragul de taiere
  mask = f <= cutoff_freq;
  % aplic masca asupra transformatei Fourier
  signal_filter = signal_fft .* mask;
  % calculez inversa transformatei Fourier pentru a obtine semnalul filtrat
  filtered_signal = ifft(signal_filter);
  % normalizez semnalul filtrat
  signal = filtered_signal / max(abs(filtered_signal));
endfunction

