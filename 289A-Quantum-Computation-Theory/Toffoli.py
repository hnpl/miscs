from sage.all import *
from gates import *

if __name__ == "__main__":
    #Toffoli = I.tensor_product(I).tensor_product(I)
    #Toffoli[6,6] = 0
    #Toffoli[7,7] = 0
    #Toffoli[6,7] = 1
    #Toffoli[7,6] = 1
    Toffoli = generate_CnX_gate(3, {2-0, 2-1}, {2-2})

    print("Target:")
    print(Toffoli)

    CX01 = generate_CnX_gate(3, {2-0}, {2-1})
    CX02 = generate_CnX_gate(3, {2-0}, {2-2})
    CX12 = generate_CnX_gate(3, {2-1}, {2-2})

    tensor3 = lambda A,B,C: A.tensor_product(B).tensor_product(C)

    a = tensor3(I, I, H)
    b = CX12
    c = tensor3(I, I, T.conjugate_transpose())
    d = CX02
    e = tensor3(I, I, T)
    f = CX12
    g = tensor3(I, I, T.conjugate_transpose())
    h = CX02
    i = tensor3(I, T.conjugate_transpose(), I) * tensor3(I, I, T)
    j = tensor3(I, I, H) * CX01
    k = tensor3(I, T.conjugate_transpose(), I)
    l = CX01
    m = tensor3(T, I, I) * tensor3(I, S, I)

    print("Answer:")
    print(product((a,b,c,d,e,f,g,h,i,j,k,l,m)))
