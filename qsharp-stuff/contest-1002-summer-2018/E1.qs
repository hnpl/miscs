// https://codeforces.com/contest/1002/problem/E1

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable rresult = new Int[N];
            using (qs = Qubit[N])
            {
                using (qt = Qubit[1])
                {
                    X(qt[0]);
                    H(qt[0]);
                    for (i in 0..N-1)
                    {
                        H(qs[i]);
                    }
                    Uf(qs, qt[0]);
                    for (i in 0..N-1)
                    {
                        H(qs[i]);
                        if (M(qs[i]) == Zero) { set rresult[i] = 0; } 
                        else { set rresult[i] = 1; }
                    }
                    ResetAll(qt);
                }
                ResetAll(qs);
            }
            return rresult;
        }
    }
}
