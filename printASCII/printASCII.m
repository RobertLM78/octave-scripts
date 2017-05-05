# Title: printASCII.m
# Version: 0.1; April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# About: Open and write a file with ASCII codes and corresponding symbols
# -----------------------------------------------------------------------------
fID = fopen("ASCII_codes","w");
for k=32:126-47
	fprintf(fID,"ASCII %d is the symbol '%s'.      ASCII %d is the symbol '%s'.\n",k,char(k),k+47,char(k+47));
end
fprintf(fID,"----------------------------------------------------------------\n")
for k=32:126-47
	fprintf(fID,"The symbol '%s' is ASCII %d.      The symbol '%s' is ASCII %d.\n",char(k),k,char(k+47),k+47);
end
fclose(fID);
