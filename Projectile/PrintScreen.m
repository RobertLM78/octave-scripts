# Title: PrintScreen.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: PrintScreen(initial_velocity,angle_matrix,max_height,time_max_h,time_ground,x_ground,x_distance_at_max_h)
# About: Print the data to screen
# -----------------------------------------------------------------------------
function PrintScreen(v0,angMat,h,Th,Tg,xg,xh)
if (nargin ~= 7)
	help PrintScreen
	return
endif
fprintf("Initial Velocity (in m/s): %0.2f\n\n", v0)
for k=1:6
	fprintf("For %0.2f degrees:\n", angMat(1,k))
	fprintf("The maximum height is %0.2f meters at a distance of %0.2f meters.\n",h(1,k),xh(1,k))
	fprintf("The time of maximum height is %0.2f seconds.\n", Th(1,k))
	fprintf("The projectile hits that ground at %0.2f seconds and travels a distance of %0.2f meters.\n\n",Tg(1,k),xg(1,k))
end
fprintf("Press any key when ready.\n\n")
kbhit();
endfunction
# -------- EOF ----------------------------------------------------------------
