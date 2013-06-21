# exploratory


Starting by trying to create a test set of spectra using the xarr using in the linear least-squares fit.

## CREATE_SPECTRA.PRO
Produces spectra using artifical values of fit parameters.

## EXPLORE_FINDFPN.PRO
Wrapper for CREATE_SPECTRA to illustrate how the FPN spectra are built.

## SPCOR\_XINV_ORG.SAV
The original spcor_xinv.sav file.
Contains

* xarr = Array[1255,57344] -- Array of X vectors for linear fit. 57344 = 7*8192 (The seven spectra expanded
into a vector. 1255 = 512 (delta functions) + 512 (orthogonal delta functions?) + 7 (Piston for each spectrum) +
15 * 7 (Sine Fourier Components for each spectrum) + 15 * 7 (Cosine Fourier Components for each Spectrum)
1031:1254 are the fourier components

* xinv = Array[57344,1255] --- transpose(xarr)#invert(xarr#transpose(xarr))

* fpn = Float 16.0 --- Number of Fourier Components to fit? If you include the constant term, this is correct.

* hnum = Float 512.0 --- Number of central channels to fit delta functions to?

* versiondate = Long 20051205 --- Date of creation?

## T2N4_AGGR.SAV

Aggregated spectra from a2124 project, region t2n4.

## FIND\_FPN_DESTRY.PRO

Exploratory version of FIND_FPN.PRO
