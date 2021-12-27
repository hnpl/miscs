// https://codeforces.com/contest/1002/problem/B4

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[1]);
            CNOT(qs[0], qs[1]);
            H(qs[0]);
            let qubit1 = (M(qs[1]) == One);
            let qubit0 = (M(qs[0]) == One);
            if (!qubit0 && !qubit1) { return 3; }
            elif (!qubit0 && qubit1) { return 1; }
            elif (qubit0 && !qubit1) { return 2; }
            return 0;
        }
    }
}
