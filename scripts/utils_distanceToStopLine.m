function d = utils_distanceToStopLine(vehicle, stop_line_y)
% simple projection distance along vehicle heading to stop line (y-axis)
d = stop_line_y - vehicle.y;
end
