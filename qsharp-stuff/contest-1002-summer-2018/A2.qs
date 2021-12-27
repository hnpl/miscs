// Problem: https://codeforces.com/contest/1002/problem/A2

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    operation Solve (qs : Qubit[], bits : Bool[]) : ()
    {
        body
        {
            let n = Length(qs);
            let true_bit = 0;
            H(qs[true_bit]);
            for (i in 1..n-1)
            {
                if (bits[i] == true)
                {
                    CNOT(qs[true_bit], qs[i]);
                }
            }
        }
    }
}
