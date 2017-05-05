# Title: plotProj.m - function for Projectile.m
# Version: 0.3 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: plotProj(x_distance,y_height,max(x_ground),max(max_height),angle_matrix,initial_velocity)
# About:  Plot the parametric equations
# -----------------------------------------------------------------------------
function plotProj(x,y,xg,h,angMat,v0)
if (nargin ~= 6)
	help plotProj
	return
endif
# Create a cell array of the angles for legend
for k = 1:6
	LegCell{k,1} = [num2str(angMat(1,k))," degrees"];
end
# Create a title
PlTitleM = [num2str(v0)," m/s"];
# Now plot
plot(x(1,:),y(1,:),x(2,:),y(2,:),x(3,:),y(3,:),x(4,:),y(4,:),x(5,:),y(5,:),x(6,:),y(6,:))
%axis([0,xg+.05*xg,0,h+.05*h]) # Another axis option - axis([0,xg,0,h+.05*h]) seems to be working nicely for now
axis([0,xg,0,h+.05*h])         # Main axis option - x-axis = 0 to max(xg)
legend(LegCell); title(PlTitleM) #title(pTitleC);
grid on;shg
endfunction
# -------- EOF ----------------------------------------------------------------
