from sage.all import *
from gates import *

def hash_Pauli3(p):
    hash = 0
    k = 0
    for row in p:
        for element in row:
            hash += (2 ** k) * element
            k += 1
    return hash

if __name__ == "__main__":
    CX01 = generate_CnX_gate(3, {2-0}, {2-1})
    CX02 = generate_CnX_gate(3, {2-0}, {2-2})
    CX12 = generate_CnX_gate(3, {2-1}, {2-2})

    seen = {}
    P3 = []

    for A, a in zip([I, X, Y, Z], ["I", "X", "Y", "Z"]):
        for B, b in zip([I, X, Y, Z], ["I", "X", "Y", "Z"]):
            for C, c in zip([I, X, Y, Z], ["I", "X", "Y", "Z"]):
                t = tensor3(A, B, C)
                assert(not (hash_Pauli3 in seen))
                seen[ 1 * hash_Pauli3(t)] = f"  ({a} x {b} x {c})"
                seen[-1 * hash_Pauli3(t)] = f" -({a} x {b} x {c})"
                seen[ i * hash_Pauli3(t)] = f" i({a} x {b} x {c})"
                seen[-i * hash_Pauli3(t)] = f"-i({a} x {b} x {c})"
                P3.append(t)
                #print(t)
                #print(hash_Pauli3(t))
  
    print(len(seen))

    d_CCZ = CCZ.conjugate_transpose()

    n = 0
    for p in P3:
        for p_prime in P3:
            u = CCZ * p * d_CCZ
            t = u * p_prime * u.conjugate_transpose()
            h = hash_Pauli3(t)
            assert(h in seen)
