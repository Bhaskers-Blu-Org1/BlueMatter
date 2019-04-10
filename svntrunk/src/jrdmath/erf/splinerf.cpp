/* Copyright 2001, 2019 IBM Corporation
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the 
 * following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the 
 * following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the 
 * following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
 /*
 * (c) Copyright IBM Corp. 2006. CPL
 */ 
#include <iostream>
#include <iomanip>
#include <math.h>
using namespace std ;
enum {
	k_Slices = 64 
} ;
// We start with the analytic representation of the derivative of the error function
class DerivativeErrorFunction
{
   public:

   static double FunctionToFit(double x) {
      double result = (-2.0/sqrt(M_PI)) * exp(-x*x) ; // Evaluate the analytic function
//		 		 double result = 1.0 ;
      return result ;
      } ;
   static double FunctionToFit_Derivative(double x) {
   		 double result = ( -2.0/sqrt(M_PI)) * ( -2.0*x ) * exp(-x*x) ;
//		 		 double result = 0.0 ;
   		 return result ;
   } ;

} ;

const double SliceSize = (1.0/16.0) ;
const double SliceReciprocal = 1.0/SliceSize ;
class SplineEvaluator: public DerivativeErrorFunction
{
		 public:
		 double b0 ;
		 double b1 ;
		 double b2 ; 
		 double b3 ;
		 double c1 ;
		 double c2 ;
		 double c3 ;
		 double c4 ;
		 SplineEvaluator(double x_lo, double x_hi)
		 {
		 		 double f_lo = FunctionToFit(x_lo) ; 
		 		 double f_hi = FunctionToFit(x_hi) ;
		 		 double df_lo = FunctionToFit_Derivative(x_lo) * 0.5 * SliceSize ; 
		 		 double df_hi = FunctionToFit_Derivative(x_hi) * 0.5 * SliceSize ;
		 		 
		 		 double a0 = (f_lo + f_hi) * 0.5 ;
		 		 double a1 = (f_hi - f_lo) * 0.5 ;
		 		 double a2 = (df_hi - df_lo) * 0.25 ;
		 		 double a3 = (df_hi + df_lo - 2.0*a1) * 0.25 ;
		 		 
		 		 b0 = a0-a2 ;
		 		 b1 = a1-a3 ;
		 		 b2 = a2 ; 
		 		 b3 = a3 ;
		 		 
		 		 c1 = (b0)*(SliceSize*0.5);
		 		 c2 = (b1/2.0)*(SliceSize*0.5) ;
		 		 c3 = (b2/3.0)*(SliceSize*0.5) ;
		 		 c4 = (b3/4.0)*(SliceSize*0.5) ;
		 		 
//		 		 cout << f_lo << ' ' << f_hi 
//		 		 		 << ' ' << df_lo << ' ' << df_hi
//		 		 		 << ' ' << a0 
//		 		 		 << ' ' << a1 
//		 		 		 << ' ' << a2 
//		 		 		 << ' ' << a3 
//		 		 		 << ' ' << b0 
//		 		 		 << ' ' << b1 
//		 		 		 << ' ' << b2 
//		 		 		 << ' ' << b3 
//		 		 		 << endl ;

		 } ;
		 double Evaluate(double x) const
		 {
		 		 double result = ((((b3*x)+b2)*x)+b1)*x+b0 ;
		 		 return result ;
		 } ;
		 double EvaluateIntegral(double x) const
		 {
		 		 double result = (((((c4*x)+c3)*x)+c2)*x+c1)*x ;
		 		 return result ;
		 } ;
		 void Display(void) const
		 {
		 	cout << ",{ {\n" 
		 			<< "  { " << setw(20) << setprecision(16) <<  c4 << ',' << setw(20) << setprecision(16)  << b3 << " }\n"
		 			<< "  ,{ " << setw(20) << setprecision(16) <<  c3 << ',' << setw(20) << setprecision(16)  << b2 << " }\n"
		 			<< "  ,{ " << setw(20) << setprecision(16) <<  c2 << ',' << setw(20) << setprecision(16)  << b1 << " }\n"
		 			<< "  ,{ " << setw(20) << setprecision(16) <<  c1 << ',' << setw(20) << setprecision(16)  << b0 << " }\n"
		 	     	<< "} }\n" ;
		 }
} ;

int main(void)
{
		 double c0 = 1.0 ;
		 double c[k_Slices] ;
		 for (int q=0;q<k_Slices;q+=1)
		 {
		 	     double r0 = q * SliceSize ;
		 		 SplineEvaluator se(r0,r0+SliceSize) ;
		 		 double cm = se.EvaluateIntegral(-1.0) ;
		 		 double cp = se.EvaluateIntegral(1.0) ;
		 		 se.Display() ;
		 		 c[q] = c0 - cm ;
		 		 c0 += (cp-cm) ;
		 		 
//		 		 double f0 = se.FunctionToFit(r0) ;
//		 		 double e0 = se.Evaluate(-1.0) ;
//		 		 double f1 = se.FunctionToFit(r0+0.5*SliceSize) ;
//		 		 double e1 = se.Evaluate(0.0) ;
//		 		 double f2 = se.FunctionToFit(r0+SliceSize) ;
//		 		 double e2 = se.Evaluate(1.0) ;
//		 		 
//		 		 double cn = se.EvaluateIntegral(-1.0,0.0) ;
//		 		 double cp = se.EvaluateIntegral(1.0, 0.0);
//		 		 c0 += (cp-cn)*(0.5*SliceSize) ;
////		 		 double fa = se.FunctionToFit(r0+0.01*SliceSize) ;
////		 		 double ea = se.Evaluate(-0.98) ;
//		 		 cout << r0 
//		 		 		 << ' ' << f0 << ' ' << e0 
//		 		 		 << ' ' << f1 << ' ' << e1 
//		 		 		 << ' ' << f2 << ' ' << e2
//		 		 		 << ' ' << 1.0-c0 
////		 		 		 << '\n' << fa << ' ' << ea
////		 		 		 << ' ' << (ea-e0) << ' ' << (fa-f0) 
//		 		 		 << endl ; 
		 }
		 for ( int q1=0;q1<k_Slices;q1+=1)
		 {
		 	cout << "\n ," << c[q1] ;
		 }
		 return 0 ;
} ;

