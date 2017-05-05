# Title: timemat.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: time_matrix = timemat(time_ground)
# About: Create independent variable (time) for parametric equations
# -----------------------------------------------------------------------------
function t = timemat(Tg)
if (nargin ~= 1)
	help timemat
	return
endif
for k = 1:6
	t(k,:) = linspace(0,Tg(1,k),20000);
end
endfunction
# -------- EOF ----------------------------------------------------------------
