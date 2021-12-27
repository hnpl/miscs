// https://codeforces.com/contest/1001/problem/I

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable rresult = new Bool[1];
            set rresult[0] = true;
            using (qs = Qubit[N])
            {
                using (qt = Qubit[1])
                {
                    X(qt[0]);
                    H(qt[0]);
                    for (i in 0..N-1) { H(qs[i]); }
                    Uf(qs, qt[0]);
                    for (i in 0..N-1) { H(qs[i]); }
                    for (i in 0..N-1)
                    {
                        set rresult[0] = rresult[0] && (M(qs[i]) == Zero);
                    }
                    ResetAll(qt);
                }
                ResetAll(qs);
            }
            return rresult[0];
        }
    }
}
