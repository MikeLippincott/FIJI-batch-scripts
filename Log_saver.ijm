macro "Log_Print_Demo" {
  outputDir = getDirectory("Choose the input folder"); 
  print("Text to the Log");
  logsave(outputDir);
}
// exports log to a .txt file 
function logsave(Dir){
	getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
	selectWindow("Log");
	text="log_"+year+"_"+month+"_"+dayOfMonth+"_"+hour+"-"+minute+"-"+second+"-"+msec+".txt";
	saveAs("Text", Dir+text);
}
