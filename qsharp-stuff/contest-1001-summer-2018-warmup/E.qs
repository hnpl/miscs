// https://codeforces.com/contest/1001/problem/E

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            CNOT(qs[0], qs[1]);
            mutable bit1 = (M(qs[1]) == One);
            H(qs[0]);
            mutable bit0 = (M(qs[0]) == One);
            if (bit1 && bit0) { return 3; }
            elif (bit1 && !bit0) { return 2; }
            elif (!bit1 && bit0) { return 1; }
            else { return 0; }
        }
    }
}
