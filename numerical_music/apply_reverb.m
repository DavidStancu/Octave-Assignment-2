function signal = apply_reverb(signal, impulse_response)
  % convertesc raspunsul impulsului la mono folosind functia stereo_to_mono
  mono = stereo_to_mono(impulse_response);
  % aplic convolutia intre semnalul dat si raspunsul impulsului convertit la mono
  new_signal = fftconv(signal, mono);
  % normalizez semnalul rezultat
  signal = new_signal / max(abs(new_signal));
endfunction

