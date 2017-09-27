from itertools import product
from bitstring import Bits

def expected(args):
    args = ''.join(args)
    a = Bits(bin = args[0:4]).uint
    b = Bits(bin = args[4:]).uint
    s = Bits(uint = a+b, length = 5).bin;
    overflow = s[0] != s[1] and args[0] == args[4];
    return [s[1], s[2], s[3], s[4], s[0], "1" if overflow else "0"]




inputs  = ["a[3]","a[2]","a[1]","a[0]","b[3]","b[2]","b[1]","b[0]"]
outputs = ["sum[3]", "sum[2]", "sum[1]", "sum[0]", "carryout", "overflow"]

lengths = []
delay = 10000;

numInputs = len(inputs)
numOutputs = len(outputs)
print("$display(\"", end="")
for eachInput in inputs:
    string = eachInput+" | "
    lengths.append(len(string))
    print(string, end="")
for eachOutput in outputs:
    string = eachOutput+" | "
    lengths.append(len(string))
    print(string, end="")
    string = eachOutput+" exp | "
    lengths.append(len(string))
    print(string, end="")
print("\");")

for inputVals in product("01",repeat=numInputs):
    for i, eachInput in enumerate(inputs):
        print(eachInput+"="+inputVals[i]+";",end="")
    print("#"+str(delay))
    print("$display(\"", end="")
    i = 0
    for eachInput in inputs:
        print("%b"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
    for eachOutput in outputs:
        print("%b"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
        print("%s"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
    print("\", ", end="")
    expectedOutputs = expected(inputVals)
    for eachInput in inputs:
        print(eachInput+", ", end="")
    for i, eachOutput in enumerate(outputs):
        print(eachOutput+", ", end="")
        if i < numOutputs-1:
            print("\""+expectedOutputs[i]+"\", ", end="")
        else:
            print("\""+expectedOutputs[i]+"\");")
