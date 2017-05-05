# Title: xgInput.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: [x_ground,initial_velocity] = xgInput(), [x_ground,initial_velocity] = xgInput
# About: Input the distance matrix of six distances and enter the initial velocity
# -----------------------------------------------------------------------------
function [xg,v0] = xgInput(g)
if (nargin ~= 1)
	help xgInput
	return
endif
clc
# Title bar
fprintf("Projectile-3.3\n--------------\n\nData entry mode, known v0 and distances...\n")
# Get the input
v0tmp = input("Initial Velocity (in m/s): ","s");
v0 = str2double(v0tmp);
	while v0 <= 0 || v0 > 1500 || isnan(v0)
		fprintf("Out of range: use greater than 0 and less than 1500 m/s.\n")
		v0tmp = input("Initial Velocity (in m/s): ","s");
		v0 = str2double(v0tmp);
	endwhile
xgMax = (v0^2)/g;
fprintf("\n")
for k = 1:6
	fprintf("Enter final distance #%d\n",k)
	tmp = input("in meteres: ","s");
	xg(1,k) = str2double(tmp);
	fprintf("\n")
	while xg(1,k) <= 0 || xg(1,k) > xgMax || isnan(xg)
		fprintf("Out of range, the max. range for %0.2f m/s is %0.2f meters.\n",v0,xgMax)
		fprintf("Enter final distance #%d\n",k)
		tmp = input("in meteres: ","s");
		xg(1,k) = str2double(tmp);
		fprintf("\n")
	endwhile
end
clear ans;
fprintf("Done with user input, press any key when ready.\n")
kbhit(); clc
endfunction
# -------- EOF ----------------------------------------------------------------
