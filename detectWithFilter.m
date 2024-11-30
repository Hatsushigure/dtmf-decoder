function char = detectWithFilter(signal, fs)
    rowFrequencies = [697, 770, 852, 941];
    colFrequencies = [1209, 1336, 1477];
    rowFilters = [];
    colFilters = [];
    for rowFreq = rowFrequencies
        rowFilters = [rowFilters, generateBandPassFlt(rowFreq, fs)];
    end
    for colFreq = colFrequencies
        colFilters = [colFilters, generateBandPassFlt(colFreq, fs)];
    end

    row = 0;
    col = 0;
    threshold = 1;
    for i = 1 : length(rowFilters)
        rowFilt = rowFilters(i);
        y = rowFilt.filter(signal);
        if max(y) > threshold
            row = i;
            break;
        end
    end
    for i = 1 :  length(colFilters)
        colFilt = colFilters(i);
        y = colFilt.filter(signal);
        if max(y) > threshold
            col = i;
            break;
        end
    end

    if row == 0 || col == 0
        char = "Unknown";
        return;
    end

    answers = [
        '1' '2' '3'
        '4' '5' '6'
        '7' '8' '9'
        '*' '0' '#'
    ];
    char = answers(row, col);
end