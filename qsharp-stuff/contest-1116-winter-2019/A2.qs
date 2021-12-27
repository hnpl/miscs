// https://codeforces.com/contest/1116/problem/A2

namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits : Bool[][]) : Unit {
        // your code here
        let N = Length(qs);
        H(qs[0]);
        H(qs[1]);
        using (q = Qubit[2])
        {
            SWAP(qs[0], q[0]);
            SWAP(qs[1], q[1]);
            
            // w0
            X(q[0]);
            X(q[1]);
            for (i in 0..N-1)
            {
                if (bits[0][i])
                {
                    CCNOT(q[0], q[1], qs[i]);
                }
            }
            X(q[1]);
            X(q[0]); 
            // w1  
            X(q[0]);
            for (i in 0..N-1)
            {
                if (bits[1][i])
                {
                    CCNOT(q[0], q[1], qs[i]);
                }
            }
            X(q[0]);  
            // w2 
            X(q[1]);
            for (i in 0..N-1)
            {
                if (bits[2][i])
                {
                    CCNOT(q[0], q[1], qs[i]);
                }
            }
            X(q[1]);   
            // w3  
            for (i in 0..N-1)
            {
                if (bits[3][i])
                {
                    CCNOT(q[0], q[1], qs[i]);
                }
            }   
            
            // untangling w1
            for (i in 0..N-1)
            {
                if (!bits[1][i])
                {
                    X(qs[i]);
                }
            }
            (Controlled X)(qs, q[1]);
            for (i in 0..N-1)
            {
                if (!bits[1][i])
                {
                    X(qs[i]);
                }
            }
            
            // untangling w2
            for (i in 0..N-1)
            {
                if (!bits[2][i])
                {
                    X(qs[i]);
                }
            }
            (Controlled X)(qs, q[0]);
            for (i in 0..N-1)
            {
                if (!bits[2][i])
                {
                    X(qs[i]);
                }
            }
            // untangling w3
            for (i in 0..N-1)
            {
                if (!bits[3][i])
                {
                    X(qs[i]);
                }
            }
            (Controlled X)(qs, q[0]);
            (Controlled X)(qs, q[1]);
            for (i in 0..N-1)
            {
                if (!bits[3][i])
                {
                    X(qs[i]);
                }
            }
        }
    }
}
