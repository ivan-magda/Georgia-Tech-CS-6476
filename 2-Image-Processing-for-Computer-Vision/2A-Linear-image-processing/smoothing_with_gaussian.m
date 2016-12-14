function smoothing_with_gaussian(image)
  fsize = 31;
  for sigma=1:3:10
    h = fspecial('gaussian', fsize, sigma);
    out = imfilter(image, h);
    imshow(out);
    pause;
  end
end
