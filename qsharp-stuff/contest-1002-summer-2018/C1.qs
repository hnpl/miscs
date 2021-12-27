// https://codeforces.com/contest/1002/problem/C1

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            // your code here
            mutable ans = new Int[1];
            R(PauliY, 3.14159/4.0, q);
            if (M(q) == Zero)
            {
                return 0;
            }
            return 1;
        }
    }
}
