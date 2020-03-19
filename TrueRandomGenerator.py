import qsharp
from tqdm import tqdm
from QuantumRandomNumberGen import randomBit

def generate_random_num(num_bits):
    result = 0

    for _ in range(num_bits):
        result *= 2
        result += int(randomBit.simulate())

    return result

def main():
    result = {}
    for i in tqdm(range(10000)):
        r = generate_random_num(3)
        if r in result:
            result[r] += 1
        else:
            result[r] = 1

    s = sum(result.values())
    result = {k:result[k]/s for k in result.keys()}
    print(result)

if __name__ == '__main__':
    main()
    