function action = controller_state_machine(detection, distance_to_stop, vehicle)
% Simple controller: returns action string: 'stop','prepare','go','follow'
% detection.state in {'red','yellow','green','unknown'}

stop_threshold = 5; % meters to stop line
prepare_threshold = 12;

% Default action
action = 'continue';

switch detection.state
    case 'red'
        if distance_to_stop <= stop_threshold
            action = 'stop';
        elseif distance_to_stop <= prepare_threshold
            action = 'prepare_to_stop';
        else
            action = 'approach';
        end
    case 'yellow'
        if distance_to_stop <= stop_threshold
            action = 'stop';
        else
            action = 'prepare_to_stop';
        end
    case 'green'
        action = 'go';
    otherwise
        % Unknown: be conservative
        if distance_to_stop <= stop_threshold
            action = 'stop';
        else
            action = 'approach';
        end
end
% Additional Bangalore rule: if very close and vehicle speed low, allow follow
if strcmp(action,'approach') && vehicle.v < 2
    action = 'follow';
end
end
