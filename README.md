## Fortran codes for computation of field elements in near-Earth space from height anomaly
https://www.zcyphygeodesy.com/en/h-nd-143.html
## [Algorithm purpose]
    From the ellipsoidal height grid of the boundary surface and residual height anomaly grid (m) on the surface, compute the residual gravity anomaly (mGal), gravity disturbance (mGal) and vertical deflection vector (ʺ, SW) on or outside the geoid in near-Earth space. 
    The inverse operation of height anomaly adopts the combination algorithm with Poisson integral and differentiation, which does not require that the boundary surface should be a gravity equipotential surface.
## [Main program for test entrance]
    AntiHeightanomalytogravf.f90
    Input parameters: dr - the integral radius (m).
    Input parameters: calcpntfl - the calculation point file name on the equipotential boundary surface. The record format of the input calculation point file: ID (point no / point name), longitude (decimal degrees), latitude (decimal degrees), ellipsoidal height (m), ......
    Input parameters: boundryfl - the ellipsoidal height grid file of the boundary surface . The grid will be employed to calculate the integral distance where the height anomaly grid is located.
    Input parameters: ksigrdfl - the residual height anomaly grid file name on the surface.
The same grid specifications are required for the ellipsoidal height grid of the boundary surface and residual height anomaly grid on the surface.
## (1) Module for computation of other field elements from height anomaly
    AntiKsitogravfd(calcpntfl,boundryfl,ksigrdfl,dr)
    The output file reslt.txt, whose record format: Behind the record of the calculation point file, appends 4 columns of attributes including residual gravity anomaly, residual gravity disturbance and residual vertical deflection southward and westward.
## (2) Module for Poisson integral operation on residual field element
    real*8 function PoissonBLH(BLH,gra,sfh,nlat,nlon,hd,dr,GRS)
    Input parameters: BLH(3) - longitude (decimal degrees), latitude (decimal degrees), ellipsoidal height (m) of the calculation point.
    Input parameters: sfh(nlat,nlon) - the ellipsoidal height grid of the boundary surface, which employed to calculate the integral distance.
    Input parameters: gra(nlat,nlon) - the residual field element grid on the surface.
    Input parameters: hd(6) - the grid specification parameters (minimum and maximum longitude, minimum and maximum latitude, longitude and latitude intervals of a cell grid).
    Input parameters: GRS(6) - gm, ae, j2, omega, 1/f, default value
    Return - the calculated residual field element at the calculation point (in same unit with the input residual field element).
## (3) Calculation module for the normal gravity field
    normdjn(GRS,djn); GNormalfd(BLH,NFD,GRS)
    Return parameters: NFD(5) - the normal geopotential (m2/s2), normal gravity (mGal), normal gravity gradient (E), normal gravity line direction (', expressed by its north declination relative to the center of the Earth center of mass) or normal gravity gradient direction (', expressed by its north declination relative to the Earth center of mass).
## (4) Calculation module for Legendre functions and their derivatives to ψ
    LegPn_dt2(pn,dp1,dp2,n,t) ! t=cos ψ
## (5) Algorithm library for transforming of geodetic coordinates
    BLH_RLAT(GRS, BLH, RLAT); BLH_XYZ(GRS, BLH, XYZ)
    RLAT_BLH(GRS, RLAT, BLH)
## (6) Other auxiliary modules
    CGrdPntD2(lon,lat,dt,row,col,hd)；PickRecord(line, kln, rec, nn)
## [For compile and link]
    Fortran90, 132 Columns fixed format. Fortran compiler for any operating system. No external link library required.
The zip compression package in the attachment includes the test project in visual studio 2017 - intel fortran integrated environment, DOS executable test file and all input and output data.
