# Author : Homer Reid (MIT)
######################################################################
# Given a vector of polynomial coefficients, evaluate
# the polynomial and its derivative at x.
# Note that the coefficients should be in descending order,
# i.e. for 3x^2  + 7x - 9 you would set Coeffs=[3 7 -9].
######################################################################
function EvalPolyAndDerivative(Coeffs, x)
  f=df=0.0;
  xPower=1.0;
  N=length(Coeffs);
  for n=1:N-1
    f += Coeffs[N-n+1] * xPower; 
    df += n*Coeffs[N-n] * xPower;
    xPower*=x;
  end
  f += Coeffs[1] * xPower;

  f, df
end

##################################################
##################################################
##################################################
function TestNewtonConvergence(z, Coeffs, ExactRoots)
  MAXITERS=50
  for Iters=1:MAXITERS
    (f, df) = EvalPolyAndDerivative(Coeffs, z)
    z -= f / df;

    # the following turns out to be really slow, so 
    # we do it manually
    #x=find( abs(ExactRoots-z) .< 1.0e-3 )
    #if length(x)!=0
    #   return MAXITERS*x[1]+Iters;
    #end

    for n=1:length(ExactRoots)
     if abs(z-ExactRoots[n])<1.0e-3
      return MAXITERS*n + Iters;
     end
    end

  end
  return 0;
end

######################################################################
# Coeffs is a vector of polynomial coefficients in descending
# order, i.e. for 3x^2  + 7x - 9 you would set Coeffs[3 7 -9].
# 
# Before running this, you need to execute the following commands:
#  using PyPlot
#  using PyCall
######################################################################
function PlotNewtonConvergence(Coeffs)

  ##################################################
  # begin by computing 'exact' roots using companion
  # matrix
  ##################################################
  N=length(Coeffs)
  A=zeros(N-1,N-1);
  for n=2:N-1
    A[n,n-1]=1.0;
  end
  for n=1:N-1
    A[n,N-1] = -Coeffs[N-n+1] / Coeffs[1];
  end
  ExactRoots=eig(A)[1]
  
  ##################################################
  # create 500x500 Array for pixmap
  ##################################################
  NX = 500
  NY = 500
  M = Array(Int64, NX, NY)
    
  ##################################################
  ##################################################
  ##################################################
  XMax = 2.0;
  YMax = 2.0;
  DeltaX = 2.0*XMax/(NX-1);
  DeltaY = 2.0*YMax/(NY-1);
  Y=-YMax;
  StartTime=time()
  for ny=1:NY
     X=-XMax;
     for nx=1:NX
       M[nx,ny] = TestNewtonConvergence(X+Y*im,Coeffs,ExactRoots)
       X+=DeltaX
     end
     Y+=DeltaY
  end
  StopTime=time() - StartTime;
  println("Done in ",StopTime," s.\n");
    
  ##################################################
  ##################################################
  ##################################################
  pygui(true)
  display(imshow(M'))
  M
end
