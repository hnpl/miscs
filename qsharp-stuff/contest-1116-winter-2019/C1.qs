// https://codeforces.com/contest/1116/problem/C1

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    operation EvaluateInequalityClauses (x : Qubit[], ancillaRegister : Qubit[]) : Unit 
    {
        body (...) 
        {
            let N = Length(x);
            for (i in 0 .. N-2) 
            {
                CNOT(x[i], ancillaRegister[i]);
                CNOT(x[i+1], ancillaRegister[i]);
            }
        }
        adjoint auto;
    }
    operation Solve (x : Qubit[], y : Qubit) : Unit 
    {
        body (...) 
        {
            let N = Length(x);
            using (anc = Qubit[N-1]) 
            {
                WithA(EvaluateInequalityClauses(x, _), Controlled X(_, y), anc);
            }
        }
        adjoint auto;
    }
}
