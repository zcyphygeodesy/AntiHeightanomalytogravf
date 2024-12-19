!  AntiHeightanomalytogravf.f90 
!
!  FUNCTIONS:
!  AntiHeightanomalytogravf - Entry point of console application.
!
!****************************************************************************
      program AntiHeightanomalytogravf
      implicit none
	character*800::calcpntfl,boundryfl,ksigrdfl
	real*8::dr
!---------------------------------------------------------------------
      !Input the calculation point file on the equipotential boundary surface.
      write(calcpntfl,*)'calcpnt.txt'
      !输入残差高程异常所在边界面的大地高格网文件名
      !Input the ellipsoidal height grid file of the boundary surface where the height 
      !anomaly grid is located.
      write(boundryfl,*)'landgeoidhgt.dat'
      !输入边界面残差高程异常格网文件名。 
      !Input residual height anomaly (m) grid file on the surface.
      !程序要求边界面大地高格网及其面上残差高程异常格网有相同的格网规格
      !The same grid specifications required for the ellipsoidal height grid of the boundary surface
      !and residual height anomaly grid on the surface.
      write(ksigrdfl,*)'resGMlgeoid541_1800.ksi'
      !输入积分半径(m)
      dr=110.d3!Integral radius (m)
      write(*, *)"    Begin compulation......"
      call AntiKsitogravfd(calcpntfl,boundryfl,ksigrdfl,dr)
      pause
      end
