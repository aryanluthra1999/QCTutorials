import qsharp
from tqdm import tqdm
from SuperdenseCoding import superDenseSendTest

def main():
    b1 = 1
    b2 = 0

    print("Alice Wants to Send Bits: ", (b1, b2))

    result = superDenseSendTest.simulate(bit1 = b1, bit2 = b2)
    print("Bob ends up with bits: ", result)

if __name__ == '__main__':
    main()
