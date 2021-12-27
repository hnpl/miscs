// https://codeforces.com/contest/1002/problem/B2

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            // |GHZ>: start 0 end 0 OR start 1 end 1
            // |W>  : start 0 end 1 OR start 1 end 0
            mutable start = false;
            mutable end = false;
            let n = Length(qs);
            set start = (M(qs[0]) == One);
            for (i in 1..n-1)
            {
                set end = end || (M(qs[i]) == One);
            }
            if (start == end)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
    }
}
