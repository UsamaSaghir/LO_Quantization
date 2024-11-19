# LO_Quantization
The following simulation shows the effect of finite wordlength in LO mixing, causing quantization noise and spectral harmonics. Finite wordlength is a limitation in practical digital systems. 
To move the wanted signal to baseband, a mixing process is used. Mixing is achieved by multiplying the signal by an oscillatory waveform called a local oscillator (LO). The LO is typically a sine or cosine wave that moves the signal to a desired frequency.
In a practical digital system, the values of the LO sequence cannot be represented with infinite precision, and they must be quantized to finite wordlength. This means using fixed-point representation with a specific wordlength (number of bits).Suppose the LO is represented with 6 bits. Quantizing the cosine values results in a sequence that is no longer exactly sinusoidal.
This adds imperfections such as quantization noise, harmonics, and amplitude distortions in the output signal spectrum.
