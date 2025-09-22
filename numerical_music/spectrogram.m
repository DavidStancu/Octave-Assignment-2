function [S, f, t] = spectrogram(signal, fs, window_size)
  % determin lungimea semnalului
  N = length(signal);
  % calculez numarul de ferestre
  windows = floor(N / window_size);
  % initializez matricea S pspecrograma
  S = zeros(window_size, windows);
  % creez o fereastra Hann
  hann = hanning(window_size);
  % calculez vectorul de frecvente
  f = (0:(window_size - 1))' * (fs / (window_size * 2));
  % calculez vectorul de timp
  t = (0:(windows - 1))' * (window_size / fs);
    
  for i = 1:windows
    % determin indexul de inceput si de sfarsit pentru fereastra curenta
    start = (i - 1) * window_size + 1;
    endS = start + window_size - 1;
    % aplic fereastra Hann la segmentul curent din semnal
    windowed_signal = signal(start:endS) .* hann;
    % calculez elementele pentru matricea S
    fft_window = fft(windowed_signal, 2 * window_size);
    fft_window = fft_window(1:window_size);
    S(:, i) = abs(fft_window);
  endfor
endfunction
