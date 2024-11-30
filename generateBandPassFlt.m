function Hd = generateBandPassFlt(fc, fs)
%FLTROW1 返回离散时间滤波器对象。

N = 2;

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, fc * (1 - 0.05), fc * (1 + 0.05), fs);
Hd = design(h, 'butter');

% [EOF]
