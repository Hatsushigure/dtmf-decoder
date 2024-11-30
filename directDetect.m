function key = directDetect(signal, fs)
    N = length(signal);
    Y = fft(signal);
    P2 = abs(Y / N); % double side
    P1 = P2(1 : floor(N / 2) + 1); % single side
    P1(2 : end - 1) = 2 * P1(2 : end - 1); % fix strength
    f = fs * (0 : floor(N / 2)) / N;

    threshold = 0.5;
    [~, locs] = findpeaks(P1, "MinPeakHeight", threshold);
    detectedFreqs = f(locs);
    key = identifyDtmf(detectedFreqs);
end