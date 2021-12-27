// https://codeforces.com/contest/1116/problem/D3

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        let N = Length(qs);
        for (i in 1..N-1)
        {
            (Controlled X)([qs[0]], qs[i]);
        }
        H(qs[0]);
        for (i in 1..N-1)
        {
            (Controlled X)([qs[0]], qs[i]);
        }
    }
}
