function find_circles()
    % Detection of Five Strongest Circles in an Image.
    img = imread('coins.png');
    imshow(img);
    
    % Find all the circles with radius r such that 15 ? r ? 30.
    [centers, radii, metric] = imfindcircles(img, [15 30]);
    
    % Retain the five strongest circles according to the metric values.
    centersStrong5 = centers(1:5,:);
    radiiStrong5 = radii(1:5);
    metricStrong5 = metric(1:5);
    
    % Draw the five strongest circle perimeters.
    viscircles(centersStrong5, radiiStrong5, 'EdgeColor', 'b');
end