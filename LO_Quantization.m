% Effect of finite wordlength on LO Quantization.

fs = 8000;          % Sampling frequency
N = 1024;           % Number of samples
t = (0:N-1) / fs;   % Time axis

f1 = fs / 8;        % Frequency of the target signal
f2 = fs / 5;        % Frequency of the interference
target_signal = cos(2 * pi * f1 * t);
interference_signal = 0.5 * cos(2 * pi * f2 * t);

% Original LO sequence (cosine wave)
lo_original = cos(2 * pi * f1 / fs * (0:N-1));

% Quantize LO sequence to 6 bits
num_bits = 6;
quant_levels = 2^num_bits;
lo_quantized = round((lo_original + 1) * (quant_levels / 2 - 1)) / (quant_levels / 2 - 1) - 1;

% Mixed signal using quantized LO
mixed_signal = (target_signal + interference_signal) .* lo_quantized;

% Plot the original and mixed signals
figure;
subplot(3, 1, 1);
plot(t, target_signal);
title('Target Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, lo_quantized);
title('Quantized LO Sequence (6 bits)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, mixed_signal);
title('Mixed Signal with Quantized LO');
xlabel('Time (s)'); ylabel('Amplitude');

% Frequency domain analysis
figure;
fft_mixed = abs(fft(mixed_signal));
frequencies = (0:N-1) * (fs / N);
plot(frequencies, fft_mixed);
title('Spectrum of Mixed Signal');
xlabel('Frequency (Hz)'); ylabel('Magnitude');