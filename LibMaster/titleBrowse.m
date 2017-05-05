# Title: titleBrowse.m - A function for LibMaster
# Version: 0.2; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  titleBrowse(TITle,AUThor,SUBJect,NoTeS,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function titleBrowse(TIT,AUT,SUBJ,NTS,RecNum)
if (nargin ~= 5)
	help titleBrowse
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Title Browser"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)
# Initialize Row Number
RowNum = 0;

# Begin printing screen pages (length 20 rows)
for k = 1:RecNum
	RowNum = RowNum + 1;
	RecMat(1,RowNum) = k;  # Record matrix - stores RecNum in the nth element corresponding to the nth row
	fprintf("[%d]  %s\n",RowNum,TIT{k,1})
##### All screen pages but the last one #####
	if RowNum == 20                                       # Max Number of rows printed to screen
		RowNum = 0;
		# Enter a number on the list
		fprintf("\n\n")
		queryDisp = input("Select Title (Enter NULL to continue): ","s");
		queryDispTmp = queryDisp; queryDisp = str2double(queryDisp);
		####  Go back to Main Script   ####
		if queryDisp == 0
			return
		endif
		###################################
		while queryDisp < 1 || queryDisp > 20 || queryDisp > rows(TIT)     # Max Number of rows
			fprintf("Choose an item number within range.\n")
			queryDisp = input("Select Title (Enter NULL to continue): ","s");
			queryDispTmp = queryDisp; queryDisp = str2double(queryDisp);
			####  Go back to Main Script   ####
			if queryDisp == 0
				return
			endif
			###################################
		endwhile
		clear queryDispTmp
		if queryDisp >= 1 || queryDisp <= 20                               # Max Number of rows
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			fprintf("Title:  %s\n",TIT{RecMat(1,queryDisp),1})
			fprintf("Author 1:   %s\n",AUT{RecMat(1,queryDisp),1})
			fprintf("Author 2:   %s\n",AUT{RecMat(1,queryDisp),2})
			fprintf("Author 3:   %s\n",AUT{RecMat(1,queryDisp),3})
			fprintf("Subject:    %s\n",SUBJ{RecMat(1,queryDisp),1})
			fprintf("Notes:      %s\n",NTS{RecMat(1,queryDisp),1})
			fprintf("Press any key to continue.\n")
			kbhit();
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
		elseif isnan(queryDisp)
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			continue
		endif
#############################################

##### Last screen page #####
	elseif k == RecNum
		# Enter a number on the list
		fprintf("\n\n")
		queryDisp = input("Select Title (Enter NULL to continue): ","s");
		queryDispTmp = queryDisp; queryDisp = str2double(queryDisp);
		####  Go back to Main Script   ####
		if queryDisp == 0
			return
		endif
		###################################
		while queryDisp < 1 || queryDisp > 20 || queryDisp > rows(TIT)     # Max Number of rows
			fprintf("Choose an item number within range.\n")
			queryDisp = input("Select Title (Enter NULL to continue): ","s");
			queryDispTmp = queryDisp; queryDisp = str2double(queryDisp);
			####  Go back to Main Script   ####
			if queryDisp == 0
				return
			endif
			###################################
		endwhile
		clear queryDispTmp
		if queryDisp >= 1 || queryDisp <= 20                               # Max Number of rows
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			fprintf("Title:  %s\n",TIT{RecMat(1,queryDisp),1})
			fprintf("Author 1:   %s\n",AUT{RecMat(1,queryDisp),1})
			fprintf("Author 2:   %s\n",AUT{RecMat(1,queryDisp),2})
			fprintf("Author 3:   %s\n",AUT{RecMat(1,queryDisp),3})
			fprintf("Subject:    %s\n",SUBJ{RecMat(1,queryDisp),1})
			fprintf("Notes:      %s\n",NTS{RecMat(1,queryDisp),1})
			fprintf("Press any key to continue.\n")
			kbhit();
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
		elseif isnan(queryDisp)
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			continue
		endif
############################
	endif
end
fprintf("No more titles in catalog.\nPress any key to continue. ")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
