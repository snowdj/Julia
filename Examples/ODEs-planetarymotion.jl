# Author Homer Reid
# http://homerreid.dyndns.org/teaching/18.330
#-
# this function computes the RHS of the simple planetary-motion ODE 
# note: t is a scalar, and u is a six-component vector 
#
function PlanetaryMotion(t,u)

  du=0.0*u;

  r=norm(u[1:3])
  r3=r^3;

  du[1] = u[4];
  du[2] = u[5];
  du[3] = u[6];

  du[4] = -u[1] / r3;
  du[5] = -u[2] / r3;
  du[6] = -u[3] / r3;

  du
  
end


#
# Given an ODE \dot u = f(t,u), a point (t,u) on a solution
# curve, and a stepsize h, this function computes and returns 
# the Euler-method approximation to \Delta u, so that 
# (t+h, u+\Delta u) lies approximately on the solution curve
# through (t,u).
#
function EulerStep(f,t,u,h)
  h*f(t,u) 
end

#
# Like the previous function, but uses improved Euler instead.
#
function ImprovedEulerStep(f,t,u,h)
  s = f(t,u)
  sp = f(t+h,u+h*s)
  h*(s+sp)/2
end

#
# Given a function f(t,u), an initial starting time t0, 
# an initial-condition vector u0, and final starting time t1,
# and a stepsize h, this function uses the improved Euler's method
# to integrate the ODE from t0 to t1. 
#
# The return values are 
#  tVector, uArray
# where tVector contains the time samples 
# and uArray[:,n] contains the u samples for the
# nth component in the u vector.
#
# Thus, after the function is finished you can say e.g.
#
#  plot( tVector, uArray[:,3] )
#
# to plot the 3rd component of the u vector vs time;
# or 
#
#  plot( uArray[:,2], uArray[:,3] )
# 
# to plot the 3rd component of the u vector vs 
# the 2nd component of the u vector. 
#
function IntegrateODE(f,t0,u0,t1,h)
  
 # tVector is an vector of length N containing time points
 tVector = [t0:h:t1]
  
 # uArray is an array of size (N,Dim) where Dim is the 
 # number of components in the u vector (which we figure out 
 # by looking at the length of u0)
 uArray = zeros( length(tVector), length(u0) )

 # integrate the ODE. After this loop is finished,
 # uArray(:,1) = vector of u[1] vs. time
 uArray[1,:]=u0;
 for n=2:length(tVector)
   uStep = ImprovedEulerStep(f,tVector[n-1],uArray[n-1,:],h)
   uArray[n,:] = uArray[n-1,:] + uStep;
 end
 tVector, uArray
end

#
# Given a six-component initial-condition vector u0,
# a stopping time tMax, and a stepsize h, this function 
# integrates the planetary motion ODE from t=0 to t=tMax
# and plots the resulting orbit.
#
# for example, try 
#
#  PlotPlanetaryMotion( [1 0 0 0 1 0 ], 20, 0.01)
#
# (note you will first need to run 'using Winston' 
#  to initialize plotting functions)
#
function PlotPlanetaryMotion(u0, tMax, h)

  tVector, uArray = IntegrateODE(PlanetaryMotion,0,u0,tMax,h)

  #plot( uArray[:,1], uArray[:,2] );

end
