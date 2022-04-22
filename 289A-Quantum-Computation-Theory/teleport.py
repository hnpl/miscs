from qulacs import QuantumState, QuantumCircuit, ParametricQuantumCircuit, Observable
from qulacs.state import inner_product, drop_qubit
from qulacs.gate import RX, RY, RZ, CZ, CNOT, Measurement

def do_teleport():
    q = QuantumState(1)
    circuit1 = ParametricQuantumCircuit(1)
    circuit1.add_parametric_RX_gate(0, 3.14/5)
    circuit1.add_parametric_RZ_gate(0, 3.14/3)
    circuit1.update_quantum_state(q)
    print(q)

    q = QuantumState(1)
    circuit2 = QuantumCircuit(1)
    circuit2.add_H_gate(0)
    circuit2.update_quantum_state(q)
    print(q)

    q = QuantumState(2)

    circuit = ParametricQuantumCircuit(2)
    circuit.add_parametric_RX_gate(0, 3.14/5)
    circuit.add_parametric_RZ_gate(0, 3.14/3)
    circuit.add_H_gate(1)
    circuit.update_quantum_state(q)
    print("Initial state")
    print(q)

    q = QuantumState(2)

    circuit = ParametricQuantumCircuit(2)
    circuit.add_parametric_RX_gate(0, 3.14/5)
    circuit.add_parametric_RZ_gate(0, 3.14/3)
    circuit.add_H_gate(1)
    circuit.add_CZ_gate(0, 1)

    circuit.update_quantum_state(q)

    print("After CZ")
    print(q)

    circuit = ParametricQuantumCircuit(2)
    circuit.add_H_gate(0)
    circuit.update_quantum_state(q)
    print("Before Measurement")
    print(q.get_vector())
    print("***** After Measurement *****")
    print("Qubit 0 measured to 0")
    q1 = drop_qubit(q, [1], [0])
    q1.normalize(q1.get_squared_norm())
    print(q1)
    print("Qubit 0 measured to 1")
    q2 = drop_qubit(q, [1], [1])
    q2.normalize(q2.get_squared_norm())
    print(q2)

    print("Post measurement ops")
    print("Qubit 0 measured to 0")
    circuit = QuantumCircuit(1)
    circuit.add_H_gate(0)
    circuit.update_quantum_state(q1)
    print(q1)
    print("Qubit 0 measured to 1")
    circuit = QuantumCircuit(1)
    #circuit.add_H_gate(0)
    circuit.add_X_gate(0)
    circuit.add_H_gate(0)
    circuit.update_quantum_state(q2)
    print(q2)

if __name__ == "__main__":
    do_teleport()
