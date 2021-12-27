// https://codeforces.com/contest/1116/problem/D2

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        let N = Length(qs);
        for (i in N-1..-1..1)
        {
            for (j in 0..i-1)
            {
                (Controlled H)(qs[i..1..N-1], qs[j]);
            }
            X(qs[i]);
        }
        for (i in 1..N-1)
        {
            X(qs[i]);
        }
    }
}
