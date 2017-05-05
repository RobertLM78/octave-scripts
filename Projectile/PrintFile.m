# Title: PrintFile.m - function for Projectile.m
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: PrintFile(initial_velocity,angle_matrix,max_height,time_max_h,time_ground,x_ground,x_distance_at_max_h)
# About: Print the data to file
# -----------------------------------------------------------------------------
function PrintFile(v0,angMat,h,Th,Tg,xg,xh)
if (nargin ~= 7)
	help PrintFile
	return
endif
# Open file
FileID = fopen("projectile-output","a");
# Create a header to each appended output
clk = clock;
tmstmp = [num2str(clk(1,1))," ",num2str(clk(1,2))," ",num2str(clk(1,3))," ",num2str(clk(1,4))," ",num2str(clk(1,5))," ",num2str(clk(1,6))];
hdr = ["---------------------- ",tmstmp," ----------------------"];
# Print the file
fprintf(FileID,"%s\n\n",hdr)
fprintf(FileID,"Initial Velocity (in m/s): %0.2f\n\n", v0)
for k = 1:6
	fprintf(FileID,"For %0.2f degrees:\n", angMat(1,k))
	fprintf(FileID,"The maximum height is %0.2f meters at a distance of %0.2f meters.\n",h(1,k),xh(1,k))
	fprintf(FileID,"The time of maximum height is %0.2f seconds.\n", Th(1,k))
	fprintf(FileID,"The projectile hits that ground at %0.2f seconds and travels a distance of \n%0.2f meters.\n\n", Tg(1,k),xg(1,k))
end
# Close file
fclose(FileID);
endfunction
# -------- EOF ----------------------------------------------------------------
