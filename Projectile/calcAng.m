# Title: calcAng.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: time_matrix = calcAng(initial_velocity,acceleration_gravity,x_ground)
# About: Calculate the angles for the total distance (xg)
# -----------------------------------------------------------------------------
function angMat = calcAng(v0,g,xg)
if (nargin ~= 3)
	help calcAng
	return
endif
for k = 1:6
	angMat(1,k) = real(0.5*asind(g*xg(1,k)/v0^2));
end
endfunction
# -------- EOF ----------------------------------------------------------------
