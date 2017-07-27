# Title: beautyofmath.m
# Version: 0.1
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# -----------------------------------------------------------------------------
# About: Uses a for-loop to calculate and printout this mathematical property:
# 1 x 8 + 1 = 9
# 12 x 8 + 2 = 98
# 123 x 8 + 3 = 987
# 1234 x 8 + 4 = 9876
# 12345 x 8 + 5 = 98765
# 123456 x 8 + 6 = 987654
# 1234567 x 8 + 7 = 9876543
# 12345678 x 8 + 8 = 98765432
# 123456789 x 8 + 9 = 987654321
# =============================================================================
# bN == (b)ig (N)umber - since this gets so large (123E6)
# a  == (a)dded number
# m  == (m)ultiply 8 and bN
# R  == (R)esult
clear,clc,close all
m = 8; # The only constant in the 'formula'
bN = 1; # Initialize bN
for k = 1:9;
	a = k;
	R = bN * m + a;
	fprintf("%d x %d + %d = %d\n",bN,m,a,R)
	system("sleep 0.25s"); # Wait before fprintfing again, please
	Bn = [num2str(bN),num2str(k+1)]; # Turn bN into a string and concatenate next digit
	bN = str2double(Bn);             # Turn bN back into a double float for calculation in next iteration
end
fprintf("\n")
# ------- EOF -----------------------------------------------------------------