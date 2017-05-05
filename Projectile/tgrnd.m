# Title: tgrnd.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: time_ground = tgrnd(acceleration_gravity,initial_velocity,angle_matrix)
# About: Calculate the time for projectile at v0 to hit the ground
# -----------------------------------------------------------------------------
function Tg = tgrnd(g,v0,angMat)
if (nargin ~= 3)
	help tgrnd
	return
endif
for k = 1:6
	Tg(1,k) = 2*v0*sind(angMat(1,k))/g;
end
endfunction
# -------- EOF ----------------------------------------------------------------
