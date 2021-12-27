// https://codeforces.com/contest/1357/problem/B1

namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arithmetic;
    
    operation INC (qarray: Qubit[]) : Unit is Adj+Ctl 
    {
        if (Length(qarray) > 1) 
        {
            (Controlled INC)([qarray[0]], (qarray[1 ...]));
        }
        X(qarray[0]);
    }
 
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        
        body (...) {
            let N = Length(inputs);
            using (anc = Qubit[N/2+1])
            {
                for (i in 0 .. N-1)
                {
                    (Controlled INC)([inputs[i]], (anc));
                }
                for (i in 0 .. N-1)
                {
                    X(inputs[i]);
                    (Controlled Adjoint INC)([inputs[i]], (anc));
                    X(inputs[i]);
                }
                
                X(output);
                (ControlledOnInt(0, X))(anc, output);
                X(output);
 
                for (i in 0 .. N-1)
                {
                    (Controlled Adjoint INC)([inputs[i]], (anc));
                }
                for (i in 0 .. N-1)
                {
                    X(inputs[i]);
                    (Controlled INC)([inputs[i]], (anc));
                    X(inputs[i]);
                }
 
            }
        }
        adjoint auto;
 
    }
}
