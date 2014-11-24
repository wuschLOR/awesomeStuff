function [handle , working] = cedrusInitUSBLinux()

%%  [handle , working] = cedrusInitUSBLinux()
%  tries to initiate the Cedrus Buttonbox found under '/dev/ttyUSB0'
%  till '/dev/ttyUSB9'. It returns the DevicePoiner and a true/false value if
%  it was successful
%  
%  handle  == device pointer
%  working == true  :was successful
%             false :failed to find a device
%
%  ----------------------------------------------------------------------------
%  History
%  2014-11-24 mg  rename
%  2014-06-27 mg  written
%  ----------------------------------------------------------------------------
%  TODO
%  2014-11-23
%    [ ] add more info output
%    [ ] is ther a way to calibrate tis thing ?
%  ----------------------------------------------------------------------------
  
USB=0          ; % zählt durch
working = false; % wird wahr wenn die Box gefunden wird
do
  try
    handle = CedrusResponseBox('Open', ['/dev/ttyUSB' num2str(USB)],  0, 1); % zählt von /ttyUSB0 bis ttyUSB9 durch und schaut ob da ne buttonbox ist
    working  = true; % wenn eine da ist bricht try nicht ab und USB wird auf 10 gesetzt
  catch
    ++USB;     % funktioniert der try nicht wird USB +1
  end
until (USB>= 10 | working== true)


end%function


