// https://codeforces.com/contest/1357/problem/B2

namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arithmetic;
    
    operation IncreaseState (qs: Qubit[]) : Unit is Adj+Ctl 
    {
        SWAP(qs[0], qs[1]);
        CNOT(qs[0], qs[1]);
    }
 
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl 
    {    
        body (...) 
        {
            let N = Length(inputs);
            let REM = N % 2;
            using (anc = Qubit[2])
            {
                X(anc[0]);
                X(anc[1]);
                for (i in 0 .. N/2-1+REM) { (Controlled IncreaseState)([inputs[i*2]], (anc)); }
                for (i in 0 .. N/2-1) { (Controlled Adjoint IncreaseState)([inputs[i*2+1]], (anc)); }
                (Controlled X) (anc, output);
                for (i in 0 .. N/2-1+REM) { (Controlled Adjoint IncreaseState)([inputs[i*2]], (anc)); }
                for (i in 0 .. N/2-1) { (Controlled IncreaseState)([inputs[i*2+1]], (anc)); }
                X(anc[1]);
                X(anc[0]);
            }
        }
        adjoint auto;
    }
 
}
