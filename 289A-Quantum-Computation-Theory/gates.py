from sage.all import *

I = matrix(SR, nrows=2)
I[0,0] = 1
I[1,1] = 1

X = matrix(SR, nrows=2)
X[0,1] = 1
X[1,0] = 1

Z = matrix(SR, nrows=2)
Z[0,0] = 1
Z[1,1] = -1

Y = matrix(SR, nrows=2)
Y[0,1] = -i
Y[1,0] = i

H = matrix(SR, nrows=2)
H[0,0] = 1/sqrt(2)
H[0,1] = 1/sqrt(2)
H[1,0] = 1/sqrt(2)
H[1,1] = -1/sqrt(2)

S = matrix(SR, nrows=2)
S[0,0] = 1
S[1,1] = i

T = matrix(SR, nrows=2)
T[0,0] = 1
T[1,1] = e**(i*pi/4)

int_to_bits = lambda n, j: list(map(int, reversed(bin(j)[2:].zfill(n))))
bits_to_int = lambda j: int("".join(reversed(list(map(str, j)))), 2)

tensor3 = lambda A, B, C: A.tensor_product(B).tensor_product(C)

CCZ = tensor3(I, I, I)
CCZ[7,7] = -1

def generate_CnX_gate(n, control_bits, target_bits):
    CnX = matrix(SR, nrows=2**n)
    for j in range(2**n):
        CnX[j,j] = 1
    seen = set()
    for j in range(2**n):
        if j in seen:
            continue
        bits = int_to_bits(n, j)
        control_bits_are_one = True
        for control_bit in control_bits:
            control_bits_are_one &= (bits[control_bit] == 1)
        if control_bits_are_one:
            target_row1 = j
            target_row2_bits = bits[:]
            for target_bit in target_bits:
                target_row2_bits[target_bit] = 1 - target_row2_bits[target_bit]
            target_row2 = bits_to_int(target_row2_bits)
            CnX[target_row1], CnX[target_row2] = CnX[target_row2], CnX[target_row1]
            seen.add(target_row1)
            seen.add(target_row2)
    return CnX
