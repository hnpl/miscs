// https://codeforces.com/contest/1002/problem/B3

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            H(qs[1]);
            let qubit0 = (M(qs[0]) == One);
            let qubit1 = (M(qs[1]) == One);
            if (!qubit0 && !qubit1) { return 0; }
            elif (!qubit0 && qubit1) { return 1; }
            elif (qubit0 && !qubit1) { return 2; }
            return 3;
        }
    }
}
