// https://codeforces.com/contest/1116/problem/D5

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit 
    {
        (Controlled X)([qs[0]], qs[1]);
        (Controlled X)([qs[0]], qs[2]);
        using (qq = Qubit[1])
        {
            let q = qq[0];
            (ControlledOnInt (0, X))([qs[1], qs[2]], q);
            (Controlled H)([q], qs[0]);
            (ControlledOnInt (0, X))([qs[1], qs[2]], q);
            
            (Controlled X)([qs[1], qs[2]], q);
            (Controlled H)([q], qs[0]);
            (Controlled X)([qs[1], qs[2]], q);
            (ControlledOnInt (0, Controlled X))([qs[1], qs[2]], ([qs[0]], q));
            CCNOT(q, qs[0], qs[1]);
            CCNOT(q, qs[0], qs[2]);
            (Controlled X)(qs, q);
            (Controlled X)([qs[0], q], qs[1]);
            (Controlled X)([qs[0], q], qs[2]);
            (ControlledOnInt(1, X))(qs, q);
        }
        X(qs[0]);
        X(qs[1]);
        X(qs[2]);
        H(qs[0]);
    }
}
