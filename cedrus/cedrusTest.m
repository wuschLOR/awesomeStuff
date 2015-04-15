function timediff = cedrusTest(handle)
  till = GetSecs + 60;
  # alte events wegwerfen
  CedrusResponseBox('FlushEvents', handle);

  #sobald ein butten gedrückt wurde das aufzeichnen 
#   do
    seconds = GetSecs;
    evt = CedrusResponseBox('GetButtons', handle);
#   until (~isempty(evt) | seconds>= till)

  
  a=evt.ptbfetchtime -evt.ptbtime
  b=evt.ptbtime-evt.ptbfetchtime
#   timediff         = evt.ptbfetchtime-seconds
#   pressedButtonTime= evt.ptbtime -seconds
  
end%function