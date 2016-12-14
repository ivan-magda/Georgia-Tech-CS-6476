function gradient_direction()
    % Load and convert image to double type, range [0, 1] for convenience.
    img = double(rgb2gray(imread('/Users/ivanmagda/Downloads/panda.jpg'))) / 255.;
    
    % Compute x, y gradients.
    [gx, gy] = imgradientxy(img, 'sobel');
    % imshow((gx + 4) / 8);
    % or imshow(gx, [-4 4]) or imshow(gy, [])
    
    % Obtain gradient magnitude and direction.
    [gmag, gdir] = imgradient(gx, gy);
    % imshow(gmag / (4 * sqrt(2))); % gmag = sqrt(gx^2 + gy^2), so: [0, (4 * sqrt(2))]
    
    my_grad = select_gdir(gmag, gdir, 1, 30, 60);
    imshow(my_grad);
end