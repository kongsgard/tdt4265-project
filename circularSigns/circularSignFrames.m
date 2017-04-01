% Input is the CNN and a sequence of frames. Uses getCircularSigns to get
% 227x227 images containing only the circular signs and also their position
% and radius. Then, the CNN is used to classify each sign and the result is
% saved as a new frame with annotation.
function newFrames = circularSignFrames(net, frames)

% Looping through all the frames.
for i = 1:(length(frames) - 2) % For some reason the two last frames are empty.
    [signs, centers, radii] = getCircularSigns(frames{i});
    
    if signs{1} == -1 % Basically means that we have not detected any signs in the frame.
        fprintf('No sign was detected.\n');
        newFrames{i} = frames{i};
    else
        classes = classifySigns(net, signs);
        newFrames{i} = getCircularResult(frames{i}, classes, centers, radii);
    end
end
end