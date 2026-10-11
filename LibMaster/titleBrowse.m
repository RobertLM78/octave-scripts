# Title: titleBrowse.m - A function for LibMaster
# Version: 0.5; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  titleBrowse(sCATALOG,RecNum)
# About:
# -----------------------------------------------------------------------------
function titleBrowse(sCATALOG,RecNum)
if (nargin ~= 2)
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

# Initialize Row Number and page number
RowNum = 0; PageN = 0; k = 0;

# Begin printing screen pages (length 20 rows)
#for k = 1:RecNum  #### YOU CANNOT CHANGE A for-loop's INDEX BECAUSE OF OCTAVE'S MULTI-THREADED INTERPRETER
while k ~= RecNum  #### SO USE A while-loop
  k = k + 1;
	RowNum = RowNum + 1;
	RecMat(1,RowNum) = k;  # Record matrix - stores RecNum in nth element corresponding to nth selected item
	fprintf("[%d]  %s\n",RowNum,sCATALOG(k).TIT)
##### All screen pages but the last one #####
	if RowNum == 20                                       # Max Number of rows printed to screen
		PageN = PageN + 1;    # increment PageN
		RowNum = 0;           # reset RowNum
		fprintf("\nPage: %d\n",PageN)
		fprintf("\n\n")
		# Enter a number on the list
		queryDisp = input("Select Title (Enter NULL to continue): ","s");
		queryDisp = str2double(queryDisp);
		####  Go back to Main Script   ####
		if queryDisp == 0
			return
		endif
		###################################
		while queryDisp < 1 || queryDisp > 20                              # Max Number of rows
			fprintf("Choose an item number within range.\n")
			queryDisp = input("Select Title (Enter NULL to continue): ","s");
			queryDisp = str2double(queryDisp);
			####  Go back to Main Script   ####
			if queryDisp == 0
				return
			endif
			###################################
		endwhile
		if queryDisp >= 1 || queryDisp <= 20                               # Max Number of rows
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			fprintf("Title:      %s\n",sCATALOG(RecMat(1,queryDisp)).TIT)
			fprintf("Author 1:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT1)
			fprintf("Author 2:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT2)
			fprintf("Author 3:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT3)
			fprintf("Subject:    %s\n",sCATALOG(RecMat(1,queryDisp)).SUBJ)
			fprintf("Notes:      %s\n",sCATALOG(RecMat(1,queryDisp)).NTS)
			fprintf("Press any key to continue.\n")

      ### return to page where query was called
      k = RecMat(1,queryDisp) - queryDisp;
      PageN = PageN - 1;
      ##########################################
			kbhit(); clear RecMat = []; # empty RecMat
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
		elseif isnan(queryDisp)
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			clear RecMat = [];      # empty RecMat
			continue
		endif
		clear RecMat = [];          # empty RecMat
#############################################

##### Last screen page #####
	elseif k == RecNum
		PageN = PageN + 1;    # increment PageN
		fprintf("\nPage: %d\n",PageN)
		fprintf("\n\n")
		# Enter a number on the list
		queryDisp = input("Select Title (Enter NULL to continue): ","s");
		queryDisp = str2double(queryDisp);
		####  Go back to Main Script   ####
		if queryDisp == 0
			return
		endif
		###################################
		while queryDisp < 1 || queryDisp > length(RecMat)                  # Max Number of rows
			fprintf("Choose an item number within range.\n")
			queryDisp = input("Select Title (Enter NULL to continue): ","s");
			queryDisp = str2double(queryDisp);
			####  Go back to Main Script   ####
			if queryDisp == 0
				return
			endif
			###################################
		endwhile
		if queryDisp >= 1 || queryDisp <= length(RecMat)                   # Max Number of rows
			# Display title and name of function
			clc;
			fprintf("%s\n%s\n\n",Topic,undrln)
			fprintf("Title:      %s\n",sCATALOG(RecMat(1,queryDisp)).TIT)
			fprintf("Author 1:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT1)
			fprintf("Author 2:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT2)
			fprintf("Author 3:   %s\n",sCATALOG(RecMat(1,queryDisp)).AUT3)
			fprintf("Subject:    %s\n",sCATALOG(RecMat(1,queryDisp)).SUBJ)
			fprintf("Notes:      %s\n",sCATALOG(RecMat(1,queryDisp)).NTS)
			fprintf("Press any key to continue.\n")

      ### return to page where query was called
      k = RecMat(1,queryDisp) - queryDisp;
      PageN = PageN - 1;
      ##########################################
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
#endfor
endwhile
fprintf("No more titles in catalog.\nPress any key to continue. ")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
