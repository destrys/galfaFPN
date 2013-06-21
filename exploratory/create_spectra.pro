function create_spectra,xarr=xarr,type=type
;+
; FUNCTION: CREATE_SPECTRA
;
; PURPOSE: Creates a set of spectra to test FIND_FPN on.
;
; SYNTAX: output = create_spectra()
;
; OPTIONAL KEYWORDS:
;     xarr - input xarr matrix so it doesn't have to be restored
;     type - which type of coeffs to use:
;            'constant': sets all coeffs to 1
;            'random_flat': random coeffs for sin and cos terms, zero elsewhere
; HISTORY:
;    Created on June 19, 2013 - DRS
;-

; Restore X arrays
if ~keyword_set(xarr) then restore, getenv('GSRPATH') + 'savfiles/spcor_xinv.sav',/verb
xinv_size = size(xarr)

if ~keyword_set(type) then type = ' '

; Create Coefficient Array
coeffs = fltarr(1,xinv_size[1])
CASE type OF
    'constant':      coeffs += 0.01 ;;; Use this for even power in all coefficients
    'random_flat':    coeffs[0,1031:1254] = randomn(seed,224)*0.01
ENDCASE
    
;Matrix Multiply and Reform
output = reform(xarr##coeffs,8192,7)


return,output

end
