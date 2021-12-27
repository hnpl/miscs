// https://codeforces.com/contest/1001/problem/H

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : ()
    {
        body
        {
            let l = Length(x);
            for (i in 0..l-1)
            {
                CNOT(x[i], y);
            }
        }
    }
}
