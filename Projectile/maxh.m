# Title: maxh.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: max_height = maxh(acceleration_gravity,initial_velocity,angle_matrix,time_max_h)
# About: Calculate the max height
# -----------------------------------------------------------------------------
function h = maxh(g,v0,angMat,Th)
if (nargin ~= 4)
	help maxh
	return
endif
for k = 1:6
	h(1,k) = v0*sind(angMat(1,k))*Th(1,k) - 0.5*g*Th(1,k)^2;
end
endfunction
# -------- EOF ----------------------------------------------------------------
