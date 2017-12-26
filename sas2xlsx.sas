
 ***********************************************************************************************************************
 *********** sas2xlsx **************************************************************************************************                     
 ** SAS Version:    9.4                                                                                               **
 ** Date:           Dec 26, 2017                                                                                      **
 ** Author:         Hsien Ching Lo                                                                                    **
 ** Instruction:    sas to xlsx, also change dbms to other format. The macro variables are described as follows:      **
 **      inlib      The libname path.                                                                                 **
 **      intbl      The table name.                                                                                   **
 **      outpath    The output filepath                                                                               **
 **      outfile    The output filename                                                                               **
 ** How to use:     command line key in sas <sas file>  -sysparm "inlib intbl outpath outfile                         **
 ** Example:        sas D:\Users\cv04356015\Desktop\sas2xlsx.sas ^                                                    **
 **					-sysparm 	"D:\Users\cv04356015\Desktop\MTDashboard\data\ meeting_all ^                          **
 **								D:\Users\cv04356015\Desktop\MTDashboard\data meeting_all" ^                           **
 **					-log "D:\Users\cv04356015\Desktop\MTDashboard\data"                                               **
 ***********************************************************************************************************************;
   
%let inlib=%SCAN(&sysparm,1);
%let intbl=%SCAN(&sysparm,2);
%let outpath=%SCAN(&sysparm,3);
%let outfile=%SCAN(&sysparm,4);

libname inlib "&inlib.";
proc export data=inlib.&intbl  
	outfile= "&outpath\&outfile..xlsx"       
	dbms=xlsx label replace;
	putnames=yes;
run;




