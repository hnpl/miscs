// https://codeforces.com/contest/1002/problem/A4

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            let n = Length(qs);
            mutable k = 0;
            if   (n == 1)  { set k = 0; }
            elif (n == 2)  { set k = 1; }
            elif (n == 4)  { set k = 2; }
            elif (n == 8)  { set k = 3; }
            elif (n == 16) { set k = 4; }
            let power2 = [1; 2; 4; 8; 16];
            X(qs[0]);
            for (i in 1..k)
            {
                H(qs[power2[i-1]]);
                for (j in 1..power2[i-1]-1)
                {
                    CCNOT(qs[j], qs[power2[i-1]], qs[power2[i-1]+j]);
                    CCNOT(qs[j], qs[power2[i-1]], qs[0]);
                }
                CNOT(qs[power2[i-1]], qs[0]);
                for (j in power2[i-1]+1..power2[i]-1)
                {
                    CNOT(qs[j], qs[j-power2[i-1]]);
                    CNOT(qs[j], qs[power2[i-1]]);
                }
            }
        }
    }
}
