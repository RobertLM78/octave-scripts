# Title: parameteq.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: [x,y] = parameteq(acceleration_gravity,time_matrix,initial_velocity,angle_matrix)
# About: Calculate the parametric equations
# -----------------------------------------------------------------------------
function [x,y] = parameteq(g,t,v0,angMat)
if (nargin ~= 4)
	help parameteq
	return
endif
for k = 1:6
	x(k,:) = v0*cosd(angMat(1,k)).*t(k,:);
	y(k,:) = v0*sind(angMat(1,k)).*t(k,:) - 0.5*g.*t(k,:).^2;
end
endfunction
# -------- EOF ----------------------------------------------------------------
