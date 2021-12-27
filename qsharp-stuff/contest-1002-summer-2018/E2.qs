// https://codeforces.com/contest/1002/problem/E2

namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            // your code here
            mutable rresult = new Int[N];
            using (qs = Qubit[N])
            {
                using (qt = Qubit[1])
                {
                    Uf(qs, qt[0]);
                    let MM = M(qt[0]);
                    if (MM == One) 
                    {
                        set rresult[0] = 1 - N%2;
                    }
                    else
                    {
                        set rresult[0] = N%2;
                    }
                    ResetAll(qt);
                }
                ResetAll(qs);
            }
            return rresult;
        }
    }
}
