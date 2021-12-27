// https://codeforces.com/contest/1357/problem/C2

namespace Solution
{
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[], parity : Int) : Unit is Adj+Ctl
    {
        if (Length(qs) > 1)
        {
            H(qs[0]);
            (Controlled Solve)([qs[0]], (qs[1 ...], 1-parity));
            X(qs[0]);
            (Controlled Solve)([qs[0]], (qs[1 ...], parity));
            X(qs[0]);
        }
        if (Length(qs) == 1)
        {
            if (parity == 1)
            {
                X(qs[0]);
            }
        }
    }
}
