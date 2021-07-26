macro "DV to tiff" {
	//INPUT/OUPUT folders
	inDir=getDirectory("Choose the input folder"); 
	myList=getFileList(inDir);  //an array
	start = getTime();
	waitForUser("I solemnly swear I am up to no good");
	// Make an array of tiff files only
	flist = newArray(0);
	for (i=0; i<myList.length; i++) {
		if (endsWith(myList[i], ".dv")) {
			flist = append(flist, myList[i]);
		}
	}
	for (j = 0 ; j < flist.length ; j++ ){
		loopstart = getTime();
		path=inDir+flist[j];   //path to each file
		print(path);
		open(path);
		a = getTitle();
		print(a);
		saveAs("Tiff", inDir+a);
		close("*");
		sec = (getTime()-start)/1000;
		min = sec/60;
		hour = min/60;
		print(sec+" seconds");
		print(min+" minutes");
		print(hour+" hours");	
	}
	sec = (getTime()-loopstart)/1000;
	min = sec/60;
	hour = min/60;
	print(sec+" seconds");
	print(min+" minutes");
	print(hour+" hours");	
	waitForUser("Mischeif Managed");
}


function append(arr, value) {
    arr2 = newArray(arr.length+1);
    for (i=0; i<arr.length; i++)
        arr2[i] = arr[i];
        arr2[arr.length] = value;
    return arr2;
}