import qsharp
from QuantumRandomNumberGen import randomBit

def generate_random_num(num_bits):
    result = 0

    for _ in range(num_bits):
        result *= 2
        result += int(randomBit.simulate())

    return result