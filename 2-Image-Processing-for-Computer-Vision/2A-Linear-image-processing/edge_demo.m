function edge_demo()
    % Read panda image.
    panda = imread('panda.jpg');
    %figure, imshow(panda), title('Original image, color');
    
    % Convert to monochrome (grayscale) using rgb2gray.
    pandaMono = rgb2gray(panda);
    %figure, imshow(pandaMono), title('Original image, monochrome');
    
    % Make a blurred/smoothed version.
    h = fspecial('gaussian', [11 11], 4);
    %display(h);
    %figure, surf(h);
    
    pandaSmoothed = imfilter(pandaMono, h);
    %figure, imshow(pandaSmoothed), title('Smoothed image');
    
    % Method 1: Shift left and right, and show diff image.
    pandaL = pandaSmoothed;
    pandaL(:, [1:(end - 1)]) = pandaL(:, [2:end]);
    
    pandaR = pandaSmoothed;
    pandaR(:, [2:(end)]) = pandaR(:, [1:(end - 1)]);
    
    pandaDiff = double(pandaR) - double(pandaL);
    figure, imshow(pandaDiff, []), title('Difference between right and left shifted images');
    
    % Method 2: Canny edge detector.
    cannyEdges = edge(pandaMono, 'canny');
    figure, imshow(cannyEdges), title('Canny edge detected image');
    
    % Method 3: Laplacian of Gaussian.
    logEdges = edge(pandaMono, 'log');
    figure, imshow(logEdges), title('Laplacian of Gaussian');
end