# Title: fileUpdate.m - A function for LibMaster
# Version: 0.3; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [CATalog,RecordNumbers] = fileUpdate(TITle,AUThor,SUBJect,NoTeS,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function [CAT,RecNum] = fileUpdate(TIT,AUT,SUBJ,NTS,RecNum)
if (nargin ~= 5)
	help fileUpdate
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Data Entry Mode"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# User input - number of records to enter
HowMuch = input("How many records to enter?: ","s");
HowMuchTmp = HowMuch; HowMuch = str2double(HowMuch);
####  Go back to Main Script   ####
if HowMuch == 0  # But first assign the outputs
	for g = 1:rows(TIT)   # CAT
		CAT{g,1} = [TIT{g,1},":",AUT{g,1},":",AUT{g,2},":",AUT{g,3},":",SUBJ{g,1},":",NTS{g,1},":;",num2str(g)];
	end
	RecNum = rows(CAT);   # RecNum
	return
endif
###################################
while isnan(HowMuch) || any(toascii(HowMuchTmp) == 46)  || HowMuch < 0
	fprintf("Enter an integer.\n")
	HowMuch = input("How many records to enter?: ","s");
	HowMuchTmp = HowMuch; HowMuch = str2double(HowMuch);
	####  Go back to Main Script   ####
	if HowMuch == 0  # But first assign the outputs
		for g = 1:rows(TIT)   # CAT
			CAT{g,1} = [TIT{g,1},":",AUT{g,1},":",AUT{g,2},":",AUT{g,3},":",SUBJ{g,1},":",NTS{g,1},":;",num2str(g)];
		end
		RecNum = rows(CAT);   # RecNum
		return
	endif
	###################################
endwhile
clear HowMuchTmp
fprintf("\n")

# User input - data
for k = RecNum + 1:RecNum + HowMuch
	fprintf("%d:[Rec:%d]\n",k-RecNum,k)
	# Enter a title
	TITtmp = input("Enter a title:   ","s");
	while isempty(TITtmp)
		TITtmp = strtrim(input("Enter a title: ","s"));  # strtrim immediately
	endwhile
	for m = 1:RecNum # Check through existing titles - if one is found return gracefully back to main script
		if strcmpi(TIT{m,1},TITtmp) == 1
			# Assign the outputs before returning
			for g = 1:rows(TIT)
				CAT{g,1} = [TIT{g,1},":",AUT{g,1},":",AUT{g,2},":",AUT{g,3},":",SUBJ{g,1},":",NTS{g,1},":;",num2str(g)];
			end
			RecNum = rows(CAT);
			fprintf("Title already entered!!  Press any key to return to menu.");
			kbhit();
			return
		endif
	end
	TIT{k,1} = TITtmp;
	# Enter authors
	for m = 1:3
		AUT{k,m} = strtrim(input("Enter author(1 at a time,up to 3): ","s"));  # strtrim immediately
		if isempty(AUT{k,m}) == 1
			AUT{k,m} = " ";
		endif
	end
	# Enter subject
	SUBJ{k,1} = upper(strtrim(input("Enter subject:  ","s")));  # strtrim immediately ; make sure the subject is in CAPS
	if isempty(SUBJ{k,1}) == 1
		SUBJ{k,1} = "no subject assigned";
	endif
	# Enter Notes
	NTS{k,1} = strtrim(input("Enter notes:    ","s"));  # strtrim immediately
	if isempty(NTS{k,1}) == 1
		NTS{k,1} = " ";
	endif
	fprintf("\n")
end

# Output vars.
# Concantenate the CAT strings up
for k = 1:rows(TIT)
	CAT{k,1} = [TIT{k,1},":",AUT{k,1},":",AUT{k,2},":",AUT{k,3},":",SUBJ{k,1},":",NTS{k,1},":;",num2str(k)];
end
# Update the Number of Records
RecNum = rows(TIT);

# Finished updating cell array - wait for user input
fprintf("Catalog updated.  Press any key to save.\n")
kbhit(); clear ans
fprintf("\n")

# User input for a file name
FileName = input("Enter a file name (type <DEF> for default file name): ","s");
while isempty(FileName) == 1
	FileName = input("Enter a file name (type <DEF> for default file name): ","s");
endwhile
# Check to see if default file name is desired
if strcmpi(FileName,"<DEF>") == 1
	FileName = "catalog.dat";
endif

# Save the file
fID = fopen(FileName,"a");
if fID == -1
	fprintf("!Error opening file!\n")
else
	for k = RecNum - HowMuch +  1:RecNum  # Slightly different bounds than above in line 41
		fprintf(fID,"%s\n",CAT{k,1});
	end
	FCchck = fclose(fID);
	if FCchck == 0
		fprintf("File appended successfully.  Press any key to continue.\n")
	else
		fprintf("!File not closed!  Press any key to continue.\n")
	endif
endif
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
