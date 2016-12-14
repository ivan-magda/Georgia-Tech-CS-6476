function index = find_template_1D()
    template = [1 1 0];
    signal = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];

    c = normxcorr2(template, signal);
    disp(c);
    [maxValue, rawIndex] = max(c);
    index = rawIndex - size(template, 2) + 1;
end
