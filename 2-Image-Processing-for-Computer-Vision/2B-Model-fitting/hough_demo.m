function hough_demo()
    % Load image, convert to grayscale and apply Canny operator to find
    % edge pixels.
    img = imread('shapes.png');
    grays = rgb2gray(img);
    edges = edge(grays, 'canny');
    
    %figure, imshow(img), title('Original image');
    %figure, imshow(grays), title('Grayscale image');
    %figure, imshow(edges), title('Edge pixels');
    
    % Apply Hough transform to find candidate lines.
    [accum, theta, rho] = hough(edges);
    %figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');
    
    % Find peaks in the Hough accumulator matrix.
    peaks = houghpeaks(accum, 100);
    %hold on; plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs'); hold off;
    
    % Find lines (segments) in the image.
    line_segs = houghlines(edges, theta, rho, peaks);
    
    figure, imshow(img), title('Line segments');
    hold on;
    for k = 1:length(line_segs)
        endpoints = [line_segs(k).point1; line_segs(k).point2];
        plot(endpoints(:, 1), endpoints(:, 2), 'LineWidth', 2, 'Color', 'green');
    end
    hold off;
    
    % Alt.: More precise lines.
    peaks = houghpeaks(accum, 100, 'Treshold', ceil(0.6 * max(accum(:))), 'NHoodSize', [5 5]);
    
    figure, imagesc(theta, rho, accum), title('Hough accumulator');
    hold on; plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs'); hold off;
    
    line_segs = houghlines(edges, theta, rho, peaks, 'FillGap', 50, 'MinLength', 100);
    figure, imshow(img), title('Line segments');
    hold on;
    for k = 1:length(line_segs)
        endpoints = [line_segs(k).point1; line_segs(k).point2];
        plot(endpoints(:, 1), endpoints(:, 2), 'LineWidth', 2, 'Color', 'green');
    end
    hold off;
end