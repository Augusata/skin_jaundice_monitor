clear all; clc; close all;


tar1 = imread("tar1");
tar2 = imread("tar2");

tar1 = im2double(tar1);
tar2 = im2double(tar2);

center = [825 832];
radius = 375;

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color1 = mean(pixels);

center = [2050 825];

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color2 = mean(pixels);


center = [3260 790];

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color3 = mean(pixels);


center = [870 2000];

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color4 = mean(pixels);

center = [2070 2000];

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color5 = mean(pixels);


center = [3300 2000];

[m, n, ~] = size(tar1);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar1(repmat(mask, [1 1 3])), [], 3);
avg_color6 = mean(pixels);
figure(1)
imagesc(tar1)


%Now for tar2 meow

tar2 = imrotate(tar2,-90);
tar2=imresize(tar2,2);
figure(2)
imagesc(tar2);

center = [700 766];
radius = 210;

[m, n, ~] = size(tar2);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar2(repmat(mask, [1 1 3])), [], 3);
avg_color7 = mean(pixels);


center = [1460 746];

[m, n, ~] = size(tar2);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar2(repmat(mask, [1 1 3])), [], 3);
avg_color8 = mean(pixels);


center = [2200 740];

[m, n, ~] = size(tar2);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar2(repmat(mask, [1 1 3])), [], 3);
avg_color9 = mean(pixels);


center = [660 1520];

[m, n, ~] = size(tar2);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar2(repmat(mask, [1 1 3])), [], 3);
avg_color10 = mean(pixels);



center = [1430 1500];

[m, n, ~] = size(tar2);
[X, Y] = meshgrid(1:n, 1:m);
mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;

pixels = reshape(tar2(repmat(mask, [1 1 3])), [], 3);
avg_color11 = mean(pixels);



%% Let's treat yellow "intensity" as red and green intensities combined.

yellows=[avg_color1(1)+avg_color1(2) avg_color2(1)+avg_color2(2) avg_color3(1)+avg_color3(2) avg_color4(1)+avg_color4(2) avg_color5(1)+avg_color5(2) avg_color6(1)+avg_color6(2) avg_color7(1)+avg_color7(2) avg_color8(1)+avg_color8(2) avg_color9(1)+avg_color9(2) avg_color10(1)+avg_color10(2) avg_color11(1)+avg_color11(2)];

tarLevels= [0 0.000922 0.001844 0.002765 0.003687 0.004609 0.005531 0.006453 0.007375 0.008296 0.009218];

figure(3);
hold on
plot(tarLevels, yellows, LineWidth=2);
plot(tarLevels, yellows, '.', 'Color','k','MarkerSize',15);
ylabel("Yellow Intensity from Image")
xlabel("Tartrazine Concentration (M)")
title("Intensity of Yellow in Tartrazine Tissues")
grid on
grid minor

% [x, y] = meshgrid(1:size(tar1,2), 1:size(tar1,1));
% 
% dist = hypot(x - center1(1), y - center1(2)); %distance of all pixels from center
% 
% inCircle = dist <= radius;
% 
% selectedPixels = tar1(repmat(inCircle, [1 1 size(tar1,3)]));
% 
% avgRGB = mean(selectedPixels, [1 2]);