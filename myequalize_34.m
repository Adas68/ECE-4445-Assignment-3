function [im2, f] = myequalize_34(im)
% MYEQUALIZE_#  Performs histogram equalization on a uint8 grayscale image.
%   Input:
%       im - uint8 grayscale image (e.g., pout.tif)
%   Outputs:
%       im2 - equalized uint8 image
%       f   - transformation function f(DA) = DB, size 256x1 (for DA = 0..255)

    % Ensure input is uint8
    if ~isa(im, 'uint8')
        error('Input image must be of type uint8.');
    end

    % Get image dimensions
    [M, N] = size(im);
    total_pixels = M * N;

    % Step 1: Compute histogram (counts for gray levels 0 to 255)
    hist_counts = zeros(256, 1);
    for k = 0:255
        hist_counts(k+1) = sum(im(:) == k);
    end

    % Step 2: Compute normalized cumulative distribution function (CDF)
    cdf = cumsum(hist_counts);
    cdf_normalized = cdf / total_pixels;

    % Step 3: Apply histogram equalization mapping:
    % f(DA) = round(255 * CDF(DA))
    f = uint8(round(255 * cdf_normalized));

    % Step 4: Map each pixel using f
    im2 = f(double(im) + 1);  % +1 because MATLAB indices start at 1

end