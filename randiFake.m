function integer = randiFake(range)



  integer = 1 + (range-1).*rand (1,1);  %a + (b-a).*rand(1,1) http://ocw.uci.edu/upload/files/mae10_w2011_lecture13.pdf page 2 this is ab substitute for randi whitch is not aviable in octave
  integer = round (integer);  % round

end
