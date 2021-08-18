macro "Image Merge 2 channel" {
	//INPUT/OUPUT folders
	inDir=getDirectory("Choose the input folder"); 
	outDir=getDirectory("Choose the output folder");
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
	for (j = 0 ; j < flist.length ; j++ ){
		loopstart = getTime();
		path=inDir+flist[j];   //path to each file
		print(path);
		open(path);
		a = getTitle();
		print(a);
		run("Split Channels");
		b = "C1-"+a;
		c = "C2-"+a;
		print(b);
		print(c);
		
		selectWindow(b);
		run("Enhance Contrast...", "saturated=0 normalize process_all");
		run("Green");
		run("Measure Stack...");
		count = getValue("results.count");
		print(count);
		run("Clear Results");
		
		selectWindow(c);
		run("Enhance Contrast...", "saturated=0 normalize process_all");


		selectWindow(b);
		run("Stack to Images");
		selectWindow(c);
		run("Stack to Images");

		for (i = 1 ; i <= count ; i++){
			if (i < 10){
				printnsave(b, outDir, "-000");
				printnsave(c, outDir, "-000");
			}else if (i >= 10 && i < 100) {
				printnsave(b, outDir, "-00");
				printnsave(c, outDir, "-00");
			}else if (i >= 100) {
				printnsave(b, outDir, "-0");
				printnsave(c, outDir, "-0");
			}else if (i >= 1000) {
				printnsave(b, outDir, "-");
				printnsave(c, outDir, "-");
			}else print("error");
		}	

		close("*");
		sec = (getTime()-start)/1000;
		min = sec/60;
		hour = min/60;
		print(sec+" seconds");
		print(min+" minutes");
		print(hour+" hours");	
	}
	printtime(loopstart);
	waitForUser("Mischeif Managed");
}


 // prints filename and saves as Tiff and Jpeg, removes .dv extrnsion
function printnsave(filename, outdir, sep) {
	print(filename);
	filename1 = replace(filename, ".dv", "");
	print(filename1);
	filename1 = filename1+sep+i;
	print(filename1);
	selectWindow(filename1);
	saveAs("Tiff", outdir+filename1);
	saveAs("JPEG", outdir+filename1);
}

function printtime(starttime) {
	sec = (getTime()-loopstart)/1000;
	min = sec/60;
	hour = min/60;
	if (sec < 60) {
		print(sec+" seconds");
	}else if (min < 60){
		print(min+" minutes");
	}else print(hour+" hours");
}

function append(arr, value) {
    arr2 = newArray(arr.length+1);
    for (i=0; i<arr.length; i++)
        arr2[i] = arr[i];
        arr2[arr.length] = value;
    return arr2;
}