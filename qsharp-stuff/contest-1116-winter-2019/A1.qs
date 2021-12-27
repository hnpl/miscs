// https://codeforces.com/contest/1116/problem/A1

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Math;
 
    operation Solve (qs : Qubit[]) : Unit {
        Ry(0.6154797*2.0, qs[0]);
        X(qs[0]);
        (Controlled H)([qs[0]], qs[1]);
        X(qs[0]);
    }
}
