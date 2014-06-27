function [pressedButtonTime , pressedButtonValue , pressedButtonStr ] = getRatingCedrus( handle , till)
%% [pressedButtonTime , pressedButtonValue , pressedButtonStr  ] = getRatingCedrus( handle , till)
%
%  helptext goes in here
%
%  INPUT
%    till =  default = PTB time stamp + 60 seconds
%    handle = cedrus box handler 
%
%  History
%  2014-06-27 mg  written
%  ----------------------------------------------------------------------------
  if nargin < 2
      till = GetSecs + 60;
  endif
  
  # alte events wegwerfen
  CedrusResponseBox('FlushEvents', handle);

  #sobald ein butten gedrückt wurde das aufzeichnen 
  do
    evt = CedrusResponseBox('GetButtons', handle);
    seconds = GetSecs;
  until (~isempty(evt) | seconds>= till)

# evt =
# {
#   raw =  208
#   port = 0
#   action =  1
#   button =  7
#   buttonID = 6.Left
#   rawtime =  14.543
#   ptbtime =  1.4039e+09
#   ptbfetchtime =  1.4039e+09
# }

  
  if seconds<= till
    # taste is gedrückt worden
    pressedButtonTime    = evt.ptbtime;
    pressedButtonStr     = evt.buttonID;
    pressedButtonValue   = evt.button;
  else
    #keine taste ist gedrückt worden
    pressedButtonTime    = seconds;
    pressedButtonStr     = 'FAIL';
    pressedButtonValue   = 9999;
  endif
  
  buttons = 1;
  while any(buttons(1,:))
    buttons = CedrusResponseBox('FlushEvents', handle);
  endwhile

endfunction
