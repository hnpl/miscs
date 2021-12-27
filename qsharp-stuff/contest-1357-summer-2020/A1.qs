// https://codeforces.com/contest/1357/problem/A1

namespace Solution
{
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (qs = Qubit[2]) {
            X(qs[0]);
            X(qs[1]);
            unitary(qs);
            X(qs[0]);
            mutable ans = 0;
            if (M(qs[1]) == One)
            {
                X(qs[1]);
                X(qs[0]);
                set ans = 1;
            }
            return ans;
 
        }
    }
}
