function key = identify_dtmf(frequencies)
    dtmf_matrix = {
        [697, 1209], '1';
        [697, 1336], '2';
        [697, 1477], '3';
        [697, 1633], 'A';
        [770, 1209], '4';
        [770, 1336], '5';
        [770, 1477], '6';
        [770, 1633], 'B';
        [852, 1209], '7';
        [852, 1336], '8';
        [852, 1477], '9';
        [852, 1633], 'C';
        [941, 1209], '*';
        [941, 1336], '0';
        [941, 1477], '#';
        [941, 1633], 'D'
    };

    key = 'Unknown';
    for i = 1:size(dtmf_matrix, 1)
        if all(ismember(dtmf_matrix{i, 1}, frequencies))
            key = dtmf_matrix{i, 2};
            break;
        end
    end
end

