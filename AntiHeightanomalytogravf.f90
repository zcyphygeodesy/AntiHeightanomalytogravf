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
      !����в�߳��쳣���ڱ߽���Ĵ�ظ߸����ļ���
      !Input the ellipsoidal height grid file of the boundary surface where the height 
      !anomaly grid is located.
      write(boundryfl,*)'landgeoidhgt.dat'
      !����߽���в�߳��쳣�����ļ����� 
      !Input residual height anomaly (m) grid file on the surface.
      !����Ҫ��߽����ظ߸����������ϲв�߳��쳣��������ͬ�ĸ������
      !The same grid specifications required for the ellipsoidal height grid of the boundary surface
      !and residual height anomaly grid on the surface.
      write(ksigrdfl,*)'resGMlgeoid541_1800.ksi'
      !������ְ뾶(m)
      dr=110.d3!Integral radius (m)
      write(*, *)"    Begin compulation......"
      call AntiKsitogravfd(calcpntfl,boundryfl,ksigrdfl,dr)
      pause
      end
