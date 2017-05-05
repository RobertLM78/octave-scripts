# Title: angInput.m - function for Projectile.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: [angle_matrix,initial_velocity] = angInput(), [angle_matrix, initial_velocity] = angInput
# About: Input the angle matrix of six angles and enter the initial velocity
# -----------------------------------------------------------------------------
function [angMat,v0] = angInput()
if (nargin ~= 0)
	help angInput
	return
endif
clc
# Title bar
fprintf("Projectile-3.3\n--------------\n\nData entry mode, known v0 and angles...\n")
# Get the input
v0tmp = input("Initial Velocity (in m/s): ","s");
v0 = str2double(v0tmp);
	while v0 <= 0 || v0 > 1500 || isnan(v0)
		fprintf("Out of range: use greater than 0 and less than 1500 m/s.\n")
		v0tmp = input("Initial Velocity (in m/s): ","s");
		v0 = str2double(v0tmp);
	endwhile
fprintf("\n")
useMat = input("Use the default matrix (angMat = [25,30,...,50]):(Y/N)?: ","s");
if isempty(useMat) == 1
	useMat = " ";
endif
useMat = useMat(1,1);
while useMat ~= "y" && useMat ~= "Y" && useMat ~= "n" && useMat ~= "N"
	useMat = input("Use the default matrix (angMat = [25,30,...,50]):(Y/N)?: ","s");
	if isempty(useMat) == 1
		useMat = " ";
	endif
	useMat = useMat(1,1);
endwhile
fprintf("\n")
switch useMat
case {"Y","y"}
	angMat = [25,30,35,40,45,50];
case {"N","n"}
for k = 1:6
	fprintf("Enter angle #%d in degrees(10-80⁰)\n",k)
	tmp = input("(e.g. 25,30,35,40,45,50 will give the best data): ","s");
	angMat(1,k) = str2double(tmp);
	fprintf("\n")
	while angMat(1,k) < 10 || angMat(1,k) > 80 || isnan(angMat)
		fprintf("Angle must be between 10 and 80 degrees.\n")
		fprintf("Enter angle #%d in degrees(10-80⁰)\n",k)
		tmp = input("(e.g. 25,30,35,40,45,50 will give the best data): ","s");
		angMat(1,k) = str2double(tmp);
		fprintf("\n")
	endwhile
end
endswitch
clear ans;
fprintf("Done with user input, press any key when ready.\n")
kbhit(); clc
endfunction
# -------- EOF ----------------------------------------------------------------
