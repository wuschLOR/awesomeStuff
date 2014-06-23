function [handle , working] = initCedrusUSBLinux()

%%  [handle , working] = initCedrusUSBLinux()
%  tries to initiate the Cedrus Buttonbox found under '/dev/ttyUSB0'
%  till '/dev/ttyUSB9'. It returns the DevicePoiner and a true/false value if
%  it was successful
%  
%  handle  ==  device pointer
%  working == true  :was successful
%             false :failed to find a device
%

  
USB=0           % zählt durch
working = false % wird wahr wenn die Box gefunden wird
do
  try
    handle = CedrusResponseBox('Open', ['/dev/ttyUSB' num2str(USB)]); % zählt von /ttyUSB0 bis ttyUSB9 durch und schaut ob da ne buttonbox ist
    working  = true % wenn eine da ist bricht try nicht ab und USB wird auf 10 gesetzt
  catch
    ++USB     % funktioniert der try nicht wird USB +1
  end
until (USB>= 10 | working== true)


