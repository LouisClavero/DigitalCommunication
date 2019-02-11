img1 = snapshot(cam);
clear('cam');
img2 = snapshot(cam);
img3 = img2 - img1;
imshow(img3);