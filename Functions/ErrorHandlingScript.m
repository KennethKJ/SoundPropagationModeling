function out = ErrorHandlingScript(ERROR, sinner)


errordlg(['{Error in: ' sinner '}' ERROR.message], 'Oh oh!')

rethrow(ERROR)
out = 1;






end