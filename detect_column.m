function col = detect_column(y1, y2, y3, threshold)
    if max(y1) > threshold
        col = 1; % 第1列
    elseif max(y2) > threshold
        col = 2; % 第2列
    elseif max(y3) > threshold
        col = 3; % 第3列
    else
        col = 0; % 未识别
    end
end