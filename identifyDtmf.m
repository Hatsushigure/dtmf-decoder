function key = identifyDtmf(frequencies)
    dtmfMatrix = {
        [697, 1209], '1';
        [697, 1336], '2';
        [697, 1477], '3';
        [770, 1209], '4';
        [770, 1336], '5';
        [770, 1477], '6';
        [852, 1209], '7';
        [852, 1336], '8';
        [852, 1477], '9';
        [941, 1209], '*';
        [941, 1336], '0';
        [941, 1477], '#'
    };

    key = 'Unknown';
    for i = 1 : size(dtmfMatrix, 1)
        stdFreq = dtmfMatrix{i, 1};
        if all(((frequencies - stdFreq) ./ stdFreq) < 0.05) % Default deviation is 5%
            key = dtmfMatrix{i, 2};
            break;
        end
    end
end

