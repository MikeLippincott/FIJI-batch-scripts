macro "Image Merge 2 channel" {
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

	


	Array.print(myList);
	Array.print(flist);
	for (j = 0 ; j < flist.length ; j+=2 ){
		loopstart = getTime();
		path=inDir+flist[j];   //path to each file
		print(path);
		path1=inDir+flist[j+1];   //path to each file
		print(path1);
		open(path);
		a = getTitle();
		print(a);
		run("Z Project...", "projection=[Max Intensity]");
		b = getTitle();
		run("Red");
		print(b);
		open(path1);
		c = getTitle();
		print(c);
		run("Z Project...", "projection=[Max Intensity]");
		d = getTitle();
		run("Blue");
		print(d);
		run("Merge Channels...", 
		"c1="+b+" c3="+d+" create keep ignore");
		saveAs("Tiff", inDir+a+"_Merge");
		saveAs("JPEG", inDir+a+"_Merge");
		selectWindow(b);
		saveAs("Tiff", inDir+a+"_Ch2");
		saveAs("JPEG", inDir+a+"_Ch2");
		selectWindow(d);
		saveAs("Tiff", inDir+a+"_Ch1");
		saveAs("JPEG", inDir+a+"_Ch1");
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