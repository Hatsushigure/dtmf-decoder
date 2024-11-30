function [signal, fs] = generateSignal(char)
    fRow = 0;
    fCol = 0;
    if ismember(char, ['1', '2', '3'])
        fRow = 697;
    elseif ismember(char, ['4', '5', '6'])
        fRow = 770;
    elseif ismember(char, ['7', '8', '9'])
        fRow = 852;
    elseif ismember(char, ['*', '0', '#'])
        fRow = 941;
    end
    if ismember(char, ['1', '4', '7', '*'])
        fCol = 1209;
    elseif ismember(char, ['2', '5', '8', '0'])
        fCol = 1336;
    elseif ismember(char, ['3', '6', '9', '#'])
        fCol = 1477;
    end
    
    fs = 4000;
    t = 0 : 1 / fs : 0.5;
    signal = sin(2 * pi * fRow * t) + sin(2 * pi * fCol * t);
    noise = 0.1 * randn(length(signal));
    signal = signal + noise(1, :);
end