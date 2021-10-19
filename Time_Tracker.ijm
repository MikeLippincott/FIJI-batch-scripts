macro "Time_Elapsed_Demo" {
start = getTime();
printtime(start);
}
//Logs time spent on tasks in macro
function printtime(starttime) {
	sec = (getTime()-starttime)/1000;
	min = sec/60;
	hour = min/60;
	if (sec < 60) {
		print(sec+" seconds");
	}else if (min < 60){
		print(min+" minutes");
	}else print(hour+" hours");
}
