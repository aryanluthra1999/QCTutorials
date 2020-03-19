import qsharp
from tqdm import tqdm
from QHelloWorld import SayHello
from TrueRandomGenerator import generate_random_num

result = {}
for i in tqdm(range(100000)):
    r = generate_random_num(3)
    if r in result:
        result[r] += 1
    else:
        result[r] = 1

s = sum(result.values())
result = {k:result[k]/s for k in result.keys()}
print(result)


