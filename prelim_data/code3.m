folderPath = '/Users/parisurana/Desktop/Skin_Jaund/skin_jaundice_monitor/prelim_data/photos';
fileList = dir(folderPath);
allowedExtensions = {'.jpg', '.png', '.bmp', '.tiff'};

% Exclude '.' and '..' entries from fileList
fileList = fileList(~ismember({fileList.name}, {'.', '..'}));

center_points = [
 2000  1600 ;  2000 1500; 2000 1500 ; 2000 1500 ; 2200 1500 ; 2100 1500 ;
   2100  1400 ; 2100  1700; 2000  1500 ; 2250 1500; 2250 1500 ];

tarLevels= [0; 2; 4; 6; 8; 10; 12; 14; 16; 18; 20];  

radius = 900;

for i = 1:length(fileList)
    [~, ~, fileExt] = fileparts(fileList(i).name);  % Get the file extension
    if ~fileList(i).isdir && ismember(lower(fileExt), allowedExtensions)
        % Read the image file
        imageFilePath = fullfile(folderPath, fileList(i).name);
        tar = imread(imageFilePath);
        tar = im2double(tar);
        
        % Loop through the center points and calculate the average color
        avg_colors = zeros(size(center_points, 1), 3);
        for j = 1:size(center_points, 1)
            center = center_points(j, :);
            [m, n, ~] = size(tar);
            [X, Y] = meshgrid(1:n, 1:m);
            mask = ((X - center(1)).^2 + (Y - center(2)).^2) <= radius^2;
            pixels = reshape(tar(repmat(mask, [1 1 3])), [], 3);
            avg_colors(j, :) = mean(pixels);
        end
        
        % Store the average colors for each image in a cell array
        avg_colors_all{i} = avg_colors;
         yellows(i) = sum(avg_colors_all{i}(1:2));
    end
end

figure(1);
hold on
plot(tarLevels, yellows, LineWidth=2);
plot(tarLevels, yellows, '.', 'Color','k','MarkerSize',15);
ylabel("Yellow Intensity from Image")
xlabel("Tartrazine Concentration (M)")
title("Intensity of Yellow in Tartrazine Tissues")
grid on
grid minor
