# Title: timemaxh.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: time_max_h = timemaxh(acceleration_gravity,initial_velocity,angle_matrix)
# About: Calculate time of max height
# -----------------------------------------------------------------------------
function Th = timemaxh(g,v0,angMat)
if (nargin ~= 3)
	help timemaxh
	return
endif
for k = 1:6
	Th(1,k) = v0*sind(angMat(1,k))/g;
end
endfunction
# -------- EOF ----------------------------------------------------------------
