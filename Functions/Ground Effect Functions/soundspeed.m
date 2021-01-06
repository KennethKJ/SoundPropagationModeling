function out = soundspeed(temp)

% out = 331.3 + 0.606*temp;

temp = 273.15 + temp;
k = 1.4;
R = 287.053072;

out = (k*R*temp)^0.5;
return
