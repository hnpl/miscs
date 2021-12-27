// https://codeforces.com/contest/1357/problem/A3

namespace Solution
{
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit()) {
            unitary(q);
            Z(q);
            unitary(q);
            let M1 = (M(q) == Zero);
            mutable ans = 0;
            if (M1) // Zero
            {
                set ans = 1;
            }
            else
            {
                X(q);
                set ans = 0;
            }
            return ans;
        }
    }
}
