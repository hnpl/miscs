// https://codeforces.com/contest/1357/problem/A2

namespace Solution
{
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (qs = Qubit[2]) {
            X(qs[1]);
            unitary(qs);
            let M1 = (M(qs[0]) == Zero);
            mutable ans = 0;
            if (M1) // Zero
            {
                X(qs[0]);
                unitary(qs);
                let M3 = (M(qs[1]) == Zero);
                X(qs[0]);
                if (M3)
                {
                    set ans = 1;
                }
                else
                {
                    X(qs[1]);
                }
            }
            else
            {
                X(qs[0]);
                let M2 = (M(qs[1]) == Zero);
                if (M2)
                {
                    set ans = 3;
                }
                else
                {
                    X(qs[1]);
                    set ans = 2;
                }
            }
            return ans;
        }
    }
}
