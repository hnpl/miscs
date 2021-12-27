// https://codeforces.com/contest/1001/problem/F

namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
            let l = Length(qs);
            mutable diffPos = new Int[1];
            set diffPos[0] = -1;
            repeat
            {
                set diffPos[0] = diffPos[0] + 1;
            }
            until (bits0[diffPos[0]] != bits1[diffPos[0]])
            fixup {}
            let MM = (M(qs[diffPos[0]]) == One);
            if (MM == bits0[diffPos[0]])
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
    }
}
