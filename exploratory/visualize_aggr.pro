pro visualize_aggr
;+
; NAME: VISUALIZE_AGGR
;
; PURPOSE: Explore aggregated spectra
;
;
; HISTORY: Written by Destry - June 21, 2013
;-

restore,'t2n4_aggr.sav',/verb

; Supposedly the HI has a tip/tilt first order term.
; Let's see if we can see that
scan1 = aggr[*,*,*,0]
scan1[*,0,*] -= rebin(scan1[*,0,0],8192,1,7)
scan1[*,1,*] -= rebin(scan1[*,1,0],8192,1,7)

plot,scan1[*,0,1]
oplot,scan1[*,0,4]

; I'm not convinced...


stop

end
