// https://codeforces.com/contest/1116/problem/D4

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit 
    {
        let N = Length(qs);
        for (i in 1..N-1)
        {
            (Controlled X)([qs[0]], qs[i]);
        }
        H(qs[0]);
        for (i in 1..N-1)
        {
            (Controlled X)([qs[0]], qs[i]);
        }
        ApplyToEach((ControlledOnInt(0, X))([Tail(qs)], _), Most(qs));
        for (i in 0..N-2)
        {
            (ControlledOnInt(1, X))([qs[N-1]], qs[i]);
        }
        
        if (N == 2)
        {
            X(qs[0]);
        }
        else
        {
            // minus 1
            (ControlledOnInt (0, X))([qs[N-1]], qs[0]);
            for (i in 0..N-3)
            {
                (ControlledOnInt (0, (Controlled X)))([qs[N-1]], (qs[0..i], qs[i+1]));
            }
            // plus 1
            (ControlledOnInt (1, X))([qs[N-1]], qs[0]);
            for (i in 0..N-3)
            {
                X(qs[i]);
                (ControlledOnInt (1, (Controlled X)))([qs[N-1]], (qs[0..i], qs[i+1]));
            }
            for (i in N-3..-1..0)
            {
                X(qs[i]);
            }
        }
    }
}
