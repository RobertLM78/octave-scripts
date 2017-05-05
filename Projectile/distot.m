# Title: distot.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: x_ground = distot(initial_velocity,angle_matrix,time_ground)
# About: Calculate the total x distance
# -----------------------------------------------------------------------------
function xg = distot(v0,angMat,Tg)
if (nargin ~= 3)
	help distot
	return
endif
for k = 1:6
	xg(1,k) = v0*cosd(angMat(1,k))*Tg(1,k);
end
endfunction
# -------- EOF ----------------------------------------------------------------
