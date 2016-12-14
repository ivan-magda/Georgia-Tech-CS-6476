function find_edges()
    img = imread('/Users/ivanmagda/Downloads/panda.jpg');
    img_gray = rgb2gray(img);
    img_edges = edge(img_gray, 'canny');
    imshow(img_edges);
end