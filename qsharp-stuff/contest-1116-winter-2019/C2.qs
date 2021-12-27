// https://codeforces.com/contest/1116/problem/C2

// How did I figure this out :D

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Evaluation2 (x : Qubit[], ancillaRegister : Qubit[], P : Int) : Unit
    {
        body (...)
        {
            let N = Length(x);
            for (i in 0..N-P-1)
            {   // XOR
                CNOT(x[i], ancillaRegister[i]);
                CNOT(x[i+P], ancillaRegister[i]);
                X(ancillaRegister[i]);
            }
        }
        adjoint auto;
    }
 
    operation Evaluation (x : Qubit[], ancillaRegister : Qubit[]) : Unit 
    {
        body (...)
        {
            let N = Length(x);
            if (N <= 2)
            {
                for (P in 1..N-1) 
                {
                    using (anc2 = Qubit[N-P])
                    {
                        //                       AND
                        WithA(Evaluation2(x, _, P), (Controlled X)(_, ancillaRegister[P-1]), anc2);
                    }
                }
            }
            elif (N == 7)
            {
                //set P = 6;
                using (anc2 = Qubit[N-6])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 6), (Controlled X)(_, ancillaRegister[0]), anc2);
                }
                //set P = 5;
                using (anc2 = Qubit[N-5])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 5), (Controlled X)(_, ancillaRegister[1]), anc2);
                }
                //set P = 4;
                using (anc2 = Qubit[N-4])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 4), (Controlled X)(_, ancillaRegister[2]), anc2);
                }
            }
            elif (N == 6)
            {
                //set P = 5;
                using (anc2 = Qubit[N-5])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 5), (Controlled X)(_, ancillaRegister[0]), anc2);
                }
                //set P = 4;
                using (anc2 = Qubit[N-4])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 4), (Controlled X)(_, ancillaRegister[1]), anc2);
                }
                //set P = 3;
                using (anc2 = Qubit[N-3])
                {
                    //                       AND
                    WithA(Evaluation2(x, _, 3), (Controlled X)(_, ancillaRegister[2]), anc2);
                }
            }
            else
            {
                for (P in 2..N-1) 
                {
                    using (anc2 = Qubit[N-P])
                    {
                        //                       AND
                        WithA(Evaluation2(x, _, P), (Controlled X)(_, ancillaRegister[P-1]), anc2);
                    }
                }        
            }
 
        }
        adjoint auto;
    }
 
    operation Solve (x : Qubit[], y : Qubit) : Unit 
    {
        body (...)
        {
            let N = Length(x);
            X(y);
            if (N == 7)
            {
                using (anc = Qubit[3]) 
                {
                    //                      OR
                    WithA(Evaluation(x, _), (ControlledOnInt(0, X))(_, y), anc);
                }
            }
            elif (N == 6)
            {
                using (anc = Qubit[3]) 
                {
                    //                      OR
                    WithA(Evaluation(x, _), (ControlledOnInt(0, X))(_, y), anc);
                }
            }
            else
            {
                using (anc = Qubit[N-1]) 
                {
                    //                      OR
                    WithA(Evaluation(x, _), (ControlledOnInt(0, X))(_, y), anc);
                }
            }
        }
        adjoint auto;
    }
}
