macro "Find Images with >1 channels" {
	//INPUT/OUPUT folders
	inDir=getDirectory("Choose the input folder"); 
	outDir=getDirectory("Choose the output folder");
	myList=getFileList(inDir);
	waitForUser("I solemnly swear I am up to no good");
	flist = newArray(0);
	for (i=0; i<myList.length; i++) {
		if (endsWith(myList[i], ".tif")) {
			flist = append(flist, myList[i]);
		}
	}		
	for (j = 0 ; j < flist.length ; j++ ){
		path=inDir+flist[j];   //path to each file
		open(path);
		a=getTitle();
		selectWindow(a);
		getDimensions(width, height, channels, slices, frames);
		if (channels>1){
			File.rename(inDir+a,outDir+a);
			close("*");
		}
		
	}
	waitForUser("Mischeif Managed");
}

// append func
function append(arr, value) {
    arr2 = newArray(arr.length+1);
    for (i=0; i<arr.length; i++)
        arr2[i] = arr[i];
        arr2[arr.length] = value;
    return arr2;
}
