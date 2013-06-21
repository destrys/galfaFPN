;+
; NAME:
;   FIND_FPN
; PURPOSE:
;   To determine the fixed pattern noise as a function of beam and day 
;
; CALLING SEQUENCE:
;  find_fpn, aggr, zogains, rxmultiplier, fpn_sp
; INPUTS:
;   aggr -- the aggregate spectrum, as in aggr.sav
;   zogains -- the gains for each day
;   rxmultiplier -- An array to correct for bad rxs
; KEYWORD PARAMETERS:
;  NONE
;
; OUTPUTS:
;  fpn_sp -- The fitted fixed pattern noise
;
; MODIFICATION HISTORY:
;  Initial documentation, January 16, 2006
;  Joshua E. Goldston, goldston@astro.berkeley.edu
;  Cosmetis Upgrades, Jun2 19, 2013 - DRS
;-

pro find_fpn, aggr, zogains, rxmultiplier, fpn_sp, fn=fn

sz = size(aggr)
if sz[0] eq 3 then sz[4] = 1
fpn_sp= fltarr(8192, 7, sz[4])

;get xarr, xinv, fpn, hnum, versiondate
if keyword_set(fn) then restore, fn else restore, getenv('GSRPATH') + 'savfiles/spcor_xinv.sav'

; mask for zeroes
mask = fltarr(8192, 7, sz[4]) + 1.
whmask = where(total(aggr, 2) eq 0., whma)
if whma ne 0 then mask[whmask] = 0.

; gain multiplier
zogm = reform(rebin(reform(zogains, 1, 1, 7, sz[4]), 8192, 2, 7, sz[4]))

; The average spectrum for each day
avg = total(total(aggr*rxmultiplier*zogm, 2), 2)/14.

; difference between a beam and the average spectrum for that day
subtr = total(aggr*rxmultiplier*zogm, 2)/2. - reform(rebin(reform(avg, 8192, 1, sz[4]), 8192, 7, sz[4]))

; Do the fit, return FPN spectra
for k=0, sz[4]-1 do begin
    Yarr = reform(subtr[*,*,k], 7.*8192.)
    afpn = Yarr#xinv
    afpn[0:hnum*2-1]=0.
    fpn_sp[*,*,k] = reform(xarr##afpn, 8192, 7)*mask[*,*,k]
  endfor

end


