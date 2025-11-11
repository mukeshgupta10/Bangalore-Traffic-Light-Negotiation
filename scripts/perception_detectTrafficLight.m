function detection = perception_detectTrafficLight(I)
% Very simple rule-based traffic light detector (color + blob geometry)
% INPUT: RGB image I
% OUTPUT: detection struct with fields: state {red,yellow,green,unknown}, bbox

detection.state = 'unknown';
detection.bbox = [];

if size(I,3) < 3
    return;
end
% Resize for speed
scale = 0.5;
I2 = imresize(I, scale);
hsv = rgb2hsv(I2);
H = hsv(:,:,1); S = hsv(:,:,2); V = hsv(:,:,3);

% Candidate masks
redMask = (H < 0.05 | H > 0.95) & S > 0.4 & V > 0.3;
yellowMask = (H > 0.10 & H < 0.18) & S > 0.4 & V > 0.4;
greenMask = (H > 0.25 & H < 0.45) & S > 0.3 & V > 0.25;

% Morphological cleanup
redMask = imopen(redMask, strel('disk',3));
yellowMask = imopen(yellowMask, strel('disk',3));
greenMask = imopen(greenMask, strel('disk',3));

% Find largest blobs
statsR = regionprops(redMask,'Area','BoundingBox');
statsY = regionprops(yellowMask,'Area','BoundingBox');
statsG = regionprops(greenMask,'Area','BoundingBox');

[valR, idxR] = max([statsR.Area, 0]);
[valY, idxY] = max([statsY.Area, 0]);
[valG, idxG] = max([statsG.Area, 0]);

areas = [valR, valY, valG];
[mval, midx] = max(areas);
if mval < 50
    detection.state = 'unknown';
    return;
end
if midx == 1
    detection.state = 'red';
    detection.bbox = statsR(idxR).BoundingBox / scale;
elseif midx == 2
    detection.state = 'yellow';
    detection.bbox = statsY(idxY).BoundingBox / scale;
else
    detection.state = 'green';
    detection.bbox = statsG(idxG).BoundingBox / scale;
end
end
