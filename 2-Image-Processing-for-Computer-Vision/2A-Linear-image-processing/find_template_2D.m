function [yIndex, xIndex] = find_template_2D()
    img = rgb2gray(imread('/Users/ivanmagda/Downloads/panda.jpg'));
    template = img(30:350, 205:515);
    
    c = normxcorr2(template, img);
    [yRaw, xRaw] = find(c == max(c(:)));
    yIndex = yRaw - size(template, 1) + 1;
    xIndex = xRaw - size(template, 2) + 1;
    
    hAx = axes;
    imshow(img, 'Parent', hAx);
    imrect(hAx, [xIndex, yIndex, size(template, 2), size(template, 1)]);
end