# Title: fileSort.m - A function for LibMaster
# Version: 0.2; May 2017 ; Now ignores preceeding articles in titles
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  CATalog = fileSort(CATalog,RecordNumbers)
# About: no changes written to file
# -----------------------------------------------------------------------------
function CAT = fileSort(CAT,RecNum)
if (nargin ~= 2)
	help fileSort
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Sort by Title (no changes written)"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# Break up CAT into the cell arrays
for k = 1:rows(CAT)
	# Break off Titles into (rows(CAT) x 1) cell 'TIT'
	[newStr,StrBal] = strtok(CAT{k},":");
	TIT{k,1} = newStr;
	# Break off the Authors into (rows(CAT) x 3) cell 'AUT'
	for q = 1:3
		[newStr,StrBal] = strtok(StrBal,":");
		AUT{k,q} = newStr;
	end
	# Break off Subjects into (rows(CAT) x 1) cell 'SUBJ'
	[newStr,StrBal] = strtok(StrBal,":");
	SUBJ{k,1} = newStr;
	# Break off Notes into (rows(CAT) x 1) cell 'NTS'
	[newStr,StrBal] = strtok(StrBal,":");
	NTS{k,1} = newStr;
end

# 'Suffix' preceeding articles in title
N = 0;
fprintf("Removing preceeding articles from titles:\n")
for k = 1:rows(TIT)
	TITtmp = TIT{k,1};
	Art0chk = TITtmp(1,1:2) == "A ";
	Art2chk = TITtmp(1,1:3) == "An ";
	Art1chk = TITtmp(1,1:4) == "The ";
	# Place preceeding article in title at the end such that TITtmp = "<Some title with leading 'The'>,The"
	if Art0chk == [1,1];
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,3:length(TITtmp)),",",TITtmp(1,1:2)];
		system("sleep 0.0125s");
	elseif Art2chk == [1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,4:length(TITtmp)),",",TITtmp(1,1:3)];
		system("sleep 0.0125s");
	elseif Art1chk == [1,1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,5:length(TITtmp)),",",TITtmp(1,1:4)];
		system("sleep 0.0125s");
	endif
end
fprintf("\n\n")

# Concatenate CAT
for k = 1:rows(TIT)
	CAT{k,1} = [TIT{k,1},":",AUT{k,1},":",AUT{k,2},":",AUT{k,3},":",SUBJ{k,1},":",NTS{k,1},":;",num2str(k)];
end

# Break off record numbers
fprintf("Removing record numbers:\n")
for k = 1:RecNum
	fprintf("%d ",k)
	[newStr,StrBal] = strtok(CAT{k},";");
	CAT{k,1} = newStr;
	system("sleep 0.0125s");
end
fprintf("\n\n")

# Alphabetize the catalog
CAT = sort(CAT);
fprintf("Alphabetizing: ")
for k = 1:RecNum
	fprintf(". ")
	system("sleep 0.025s");
end
fprintf("\n\n")

# Add the record numbers back
fprintf("Replacing record numbers:\n")
for k = 1:RecNum
	fprintf("%d ",k)
	CAT{k,1} = [CAT{k,1},";",num2str(k)];
	system("sleep 0.0125s");
end
fprintf("\n\n")

# Break up CAT into the cell arrays
for k = 1:rows(CAT)
	# Break off Titles into (rows(CAT) x 1) cell 'TIT'
	[newStr,StrBal] = strtok(CAT{k},":");
	TIT{k,1} = newStr;
	# Break off the Authors into (rows(CAT) x 3) cell 'AUT'
	for q = 1:3
		[newStr,StrBal] = strtok(StrBal,":");
		AUT{k,q} = newStr;
	end
	# Break off Subjects into (rows(CAT) x 1) cell 'SUBJ'
	[newStr,StrBal] = strtok(StrBal,":");
	SUBJ{k,1} = newStr;
	# Break off Notes into (rows(CAT) x 1) cell 'NTS'
	[newStr,StrBal] = strtok(StrBal,":");
	NTS{k,1} = newStr;
end

# 'Re-prefix' preceeding articles
N = 0;
fprintf("Replacing preceeding articles to titles:\n")
for k = 1:rows(TIT)
	if strfind(TIT{k,:},",") > 1
		N = N + 1;
		fprintf("%d ",N)
		[newStr,StrBal] = strtok(TIT{k},",");
		[Art,StrBal] = strtok(StrBal,",");
		TIT{k,1} = [strtrim(Art)," ",strtrim(newStr)];
		system("sleep 0.0125s");
	endif
end
fprintf("\n\n")

# Concatenate CAT
for k = 1:rows(TIT)
	CAT{k,1} = [TIT{k,1},":",AUT{k,1},":",AUT{k,2},":",AUT{k,3},":",SUBJ{k,1},":",NTS{k,1},":;",num2str(k)];
end

# Closing fprintf
fprintf("Catalog sorted.  Press any key to continue.\n")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
