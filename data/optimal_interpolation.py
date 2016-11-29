#
# optimal_interpolation.py
#
# Copyright Robert Hetland (2006)

from numpy import *

class oi_1d (object):
    """
    Initialize io class with observations, error, and background
    information.
    >>> o = oi(xi, Di, De, B=None, Be=None)
    where:
        xi are the measurement points
        Di are the observations
        De are the observational errors (standard deviation)
        B is a function defining the background field (default = 0.0)
        Be is the background error (default = Di.std())
    
    Methods:
    >>> o.interpolate(x, Ro)
    where:
        x are the gridpoints.
        Ro is the background error covariance decay scale.
    """    
    def __init__(self, xi, x, Ro, Be):
        self.xi = xi            # Measurement points
        self.x = x
        self.Ro = Ro
        self.Be = Be
        # Construct background error covariance matricies
        self.Bi = exp(-(self.x[newaxis,:]-self.xi[:,newaxis])**2/self.Ro**2)*self.Be
        self.B = exp(-(self.xi[newaxis,:]-self.xi[:,newaxis])**2/self.Ro**2)*self.Be
    
    def interpolate(self, Di, De):
        """Return optimally interpolated field and analysis error"""
        self.Di = Di            # Observations
        self.De = De            # Observation error
        self.N = Di.size
        # Construct observational error covariance matrix (diagonal)
        self.O = self.De**2*eye(self.N)
        # Weights, analysis and analysis error
        self.W = dot(linalg.inv(self.B + self.O), self.Bi)
        A = dot(self.Di,self.W).T
        Ea = diag(sqrt( self.Be - dot(self.W.T, self.Bi)))
        return A, Ea
    

if __name__ == '__main__':
    import pylab as pl
    from time import time
    
    # Define the Truth
    def T(x):
        return sin(10.0*pi*x)
    
    # Observations
    N = 250
#    xi = (10.0*rand(N)).round() / 10.0
    xi = random.rand(N)
    De = 0.1
    Di = T(xi) + De*random.randn(N)
    
    # Grid and backround information
    x = mgrid[0.0:1.0:10000j]
    
    # Optimal interpolation
    t_start = time()
    o = oi_1d(xi, x, Ro=0.5, Be=5.0)
    A, Ea = o.interpolate(Di, De)
    print 'Calculated in %7.3f seconds' % (time()-t_start)
    
    # Plotting
    pl.plot(x, A)
    pl.plot(x, T(x), 'r--')
    pl.fill(hstack((x, x[::-1])), hstack((A+Ea, (A-Ea)[::-1])),
            facecolor=(0.8, 0.8, 0.8), edgecolor=(0.6, 0.6, 0.6))
    pl.plot(xi, Di, 'g+')
    pl.grid(True)
    pl.show()
