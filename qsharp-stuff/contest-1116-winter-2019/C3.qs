// https://codeforces.com/contest/1116/problem/C3

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Evaluation (x : Qubit[], qs : Qubit[]) : Unit 
    {
        body (...)
        {
            let N = Length(x);
            for (i in 0..N-1) 
            {
                CCNOT(x[i], qs[0], qs[1]);
                (Controlled X)([x[i]], qs[0]);
                (Controlled X)([x[i]], qs[1]);
                CCNOT(x[i], qs[1], qs[0]);
                (Controlled X)([x[i]], qs[1]);
            }
        }
        adjoint auto;
    }
 
 
    operation Solve (x : Qubit[], y : Qubit) : Unit 
    {
        body (...) 
        {
            // your code here
            let N = Length(x);
            using (qs = Qubit[2])
            {
                X(qs[0]);
                X(qs[1]);
                WithA(Evaluation(x, _), (Controlled X)(_, y), qs);
                X(qs[1]);
                X(qs[0]);
            }
        }
        adjoint auto;
    }
}
