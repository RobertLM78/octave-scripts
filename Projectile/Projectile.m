# Title: Projectile.m - A simple projectile simulator (ignoring air restance)
# Version: 3.3; April 2017 - Modularized;
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# About: Ver. 3.3 improves flow control, now the script shouldn't crash given
#        erroneous data entry inputing initial velocity, and won't crash due to
#        variables not being defined in the workspace yet.
# -----------------------------------------------------------------------------
clear,clear functions,clc,close all
# Constant - acceleration due to gravity in m/s².
g = 9.8;
# Initialize menu CHoice Selection variable and menu list
Chs = 0;
menuPart1 = ["Projectile-3.3";"Calculate with known inital velocity and angles";"Calculate with known inital velocity and final distance (xg)"];
menuPart2 = ["Print to File";"Print to Screen";"Plot";"Reset axes";"Print to File & Screen";"Print to Screen and Plot"];
menuPart3 = ["Print to File and Plot";"Print to File & Screen and Plot";"Help - will display the readme file";"Quit"];
menuString = [menuPart1;menuPart2;menuPart3]; clear menuPart1 menuPart2 menuPart3
# Main program loop ###########################################################
while Chs ~= 12
	clc; Chs = menu(menuString);
	if Chs == 1 # Calculate with known v0 and angles
		# Input function - v0 & angles; *** Analogous to xgInput ***
		[angMat,v0] = angInput();
	## Call the needed functions to enable the rest of the program (i.e., Chs == 3 thru 9)
		# Calculate the time to hit the ground
		Tg = tgrnd(g,v0,angMat);
		# Time matrices for parametric equations
		t = timemat(Tg);
		# Calculate the parametric equations - these are plotted later
		[x,y] = parameteq(g,t,v0,angMat);
		# Calculate time of max height
		Th = timemaxh(g,v0,angMat);
		# Calculate the max height
		h = maxh(g,v0,angMat,Th); %clear g;
		# Calculate the x distance at max height
		xh = distmaxh(v0,angMat,Th);
		# Calculate the total x distance; *** Analogous to calcAng ***
		xg = distot(v0,angMat,Tg);
	elseif Chs == 2 # Calculate with known v0 and final distance (xg)
		# Input function - v0 & distances; *** Analogous to angInput ***
		[xg,v0] = xgInput(g);
	## Call the needed functions to enable the rest of the program
		# Calculate the angles to satisfy final distance (xg); *** Analogous to distot ***
		angMat = calcAng(v0,g,xg);
		# Calculate the time to hit the ground
		Tg = tgrnd(g,v0,angMat);
		# Time matrices for parametric equations
		t = timemat(Tg);
		# Calculate the parametric equations - these are plotted later
		[x,y] = parameteq(g,t,v0,angMat);
		# Calculate time of max height
		Th = timemaxh(g,v0,angMat);
		# Calculate the max height
		h = maxh(g,v0,angMat,Th); %clear g;
		# Calculate the x distance at max height
		xh = distmaxh(v0,angMat,Th);
	elseif Chs == 3 # Print to file
		A = who;            # This routine is a sanity check to make sure the variables are in the workspace
		if length(A) >= 13  # (including array A, there should be 14 variables in the workspace)
			PrintFile(v0,angMat,h,Th,Tg,xg,xh)  # The action being performed
		endif               # END sanity check
	elseif Chs == 4 # Print to screen
		A = who;
		if length(A) >= 13
			PrintScreen(v0,angMat,h,Th,Tg,xg,xh)
		endif
	elseif Chs == 5 # Plot the graphs
		A = who;
		if length(A) >= 13
			plotProj(x,y,max(xg),max(h),angMat,v0)
		endif
	elseif Chs == 6 # Reset axes (if the 'default' has changed)
		A = who;
		if length(A) >= 13 && ishandle(1) == 1; # Check 13 min. vars. AND check if the figure is even open
			axis([0,max(xg),0,max(h)+.05*max(h)]);
		endif
	elseif Chs == 7 # Print to File & Screen
		A = who;
		if length(A) >= 13
			PrintFile(v0,angMat,h,Th,Tg,xg,xh)
			PrintScreen(v0,angMat,h,Th,Tg,xg,xh)
		endif
	elseif Chs == 8 # Print to Screen and Plot
		A = who;
		if length(A) >= 13
			plotProj(x,y,max(xg),max(h),angMat,v0)
			PrintScreen(v0,angMat,h,Th,Tg,xg,xh)
		endif
	elseif Chs == 9 # Print to File and Plot
		A = who;
		if length(A) >= 13
			PrintFile(v0,angMat,h,Th,Tg,xg,xh)
			plotProj(x,y,max(xg),max(h),angMat,v0)
		endif
	elseif Chs == 10 # Print to File & Screen and Plot
		A = who;
		if length(A) >= 13
			plotProj(x,y,max(xg),max(h),angMat,v0)
			PrintFile(v0,angMat,h,Th,Tg,xg,xh)
			PrintScreen(v0,angMat,h,Th,Tg,xg,xh)
		endif
	elseif Chs == 11 # Help
		hlpFn();
	elseif Chs == 12 # Quit
		clc
		fprintf("Returning to Octave...\n\n")
	endif
endwhile
# -------- EOF ----------------------------------------------------------------
