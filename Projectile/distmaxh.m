# Title: distmaxh.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: x_distance_at_max_h = distmaxh(initial_velocity,angle_matrix,time_max_h)
# About: Calculate the x distance at max height
# -----------------------------------------------------------------------------
function xh = distmaxh(v0,angMat,Th)
if (nargin ~= 3)
	help distmaxh
	return
endif
for k = 1:6
	xh(1,k) = v0*cosd(angMat(1,k))*Th(1,k);
end
endfunction
# -------- EOF ----------------------------------------------------------------
