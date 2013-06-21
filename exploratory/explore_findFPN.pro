pro explore_findFPN
;+
; Procedure to explore findFPN's functionality
;
;
;
;
;-

;restore xinv,xarr,
restore, getenv('GSRPATH') + 'savfiles/spcor_xinv.sav',/verb



output = create_spectra(xarr=xarr,type='constant')
plot,output[3500:4500,0]
oplot,output[3500:4500,1]
oplot,output[3500:4500,2]
oplot,output[3500:4500,3]
oplot,output[3500:4500,4]
oplot,output[3500:4500,5]
oplot,output[3500:4500,6]
print,'Central channels showing region where delta functions are fit'
stop

output = create_spectra(xarr=xarr,type='random_flat')
plot,output[*,0]
oplot,output[*,1]
oplot,output[*,2]
oplot,output[*,3]
print,'Random coeffs for sin and cos terms, zero elsewhere'
stop

restore,'t2n4_aggr.sav',/verb


end
