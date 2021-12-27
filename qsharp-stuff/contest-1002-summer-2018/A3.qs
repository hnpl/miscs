// https://codeforces.com/contest/1002/problem/A3

namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        body
        {
            let N = Length(qs);
            mutable diff_bit = -1;
            mutable diff_bit_0 = false;
 
            repeat 
            { 
                set diff_bit = diff_bit + 1; 
                set diff_bit_0 = bits0[diff_bit]; 
            }
            until (bits0[diff_bit] != bits1[diff_bit])
            fixup {}
 
            H(qs[diff_bit]);
            for (i in 0..diff_bit-1)
            {
                if (bits0[i] && bits1[i])
                {
                    X(qs[i]);
                }
                elif (bits0[i] && !bits1[i])
                {
                    if (diff_bit_0)
                    {
                        CNOT(qs[diff_bit], qs[i]);
                    }
                    else
                    {
                        X(qs[diff_bit]);
                        CNOT(qs[diff_bit], qs[i]);
                        X(qs[diff_bit]);
                    }
                }
                elif (!bits0[i] && bits1[i])
                {
                    if (!diff_bit_0)
                    {
                        CNOT(qs[diff_bit], qs[i]);
                    }
                    else
                    {
                        X(qs[diff_bit]);
                        CNOT(qs[diff_bit], qs[i]);
                        X(qs[diff_bit]);
                    }
                }
            }
 
            for (i in diff_bit+1..N-1)
            {
                if (bits0[i] && bits1[i])
                {
                    X(qs[i]);
                }
                elif (bits0[i] && !bits1[i])
                {
                    if (diff_bit_0)
                    {
                        CNOT(qs[diff_bit], qs[i]);
                    }
                    else
                    {
                        X(qs[diff_bit]);
                        CNOT(qs[diff_bit], qs[i]);
                        X(qs[diff_bit]);
                    }
                }
                elif (!bits0[i] && bits1[i])
                {
                    if (!diff_bit_0)
                    {
                        CNOT(qs[diff_bit], qs[i]);
                    }
                    else
                    {
                        X(qs[diff_bit]);
                        CNOT(qs[diff_bit], qs[i]);
                        X(qs[diff_bit]);
                    }
                }
            }
 
        }
    }
}
