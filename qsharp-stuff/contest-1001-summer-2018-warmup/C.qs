// https://codeforces.com/contest/1001/problem/C

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            H(qs[0]);
            let l = Length(qs);
            for (i in 1..l-1)
            {
                CNOT(qs[0], qs[i]);
            }
        }
    }
}
