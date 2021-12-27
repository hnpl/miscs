// https://codeforces.com/contest/1357/problem/C1

namespace Solution
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit
    {
        using (q = Qubit())
        {
            repeat
            {
                ApplyToEach(H, qs);
                Controlled X(qs, q);
                let res = MResetZ(q);
            } 
            until (res == Zero)
            fixup
            {
                ResetAll(qs);
            }
        }
    }
}
