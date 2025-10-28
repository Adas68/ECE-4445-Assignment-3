% Load image
im = imread('pout.tif');  % Built-in MATLAB image

% Equalize using your function (replace # with your group number!)
[im2, f] = myequalize_34(im);

% --- Problem 2(a): Side-by-side display ---
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');
subplot(1, 2, 2);
imshow(im2);
title('Equalized Image');
print('2a_#', '-dtiff');  % Saves as 2a_#.tiff

% --- Problem 2(b): Min/Max ---
min_orig = double(min(im(:)));
max_orig = double(max(im(:)));
min_eq = double(min(im2(:)));
max_eq = double(max(im2(:)));

fprintf('Original: min = %d, max = %d\n', min_orig, max_orig);
fprintf('Equalized: min = %d, max = %d\n', min_eq, max_eq);

% --- Problem 2(c): Standard deviation ---
std_orig = std(double(im(:)));
std_eq = std(double(im2(:)));
fprintf('Original std: %.2f\n', std_orig);
fprintf('Equalized std: %.2f\n', std_eq);

% --- Problem 2(d): Plot f ---
figure;
DA = 0:255;
plot(DA, double(f), 'LineWidth', 1.5);
xlabel('DA (Input Gray Level)');
ylabel('DB = f(DA) (Output Gray Level)');
grid on;
title('Histogram Equalization Mapping Function f');
print('2d_#', '-dtiff');  % Saves as 2d_#.tiff