import re

class Graph():

    def __init__(self,indices,gateInfo):
        self.indices = indices
        self.adjacent = [[] for i in indices]
        self.gateInfo = gateInfo

    def Traverse(self,Stack):
        if(len(Stack)==0):
            return

        if (self.adjacent[self.indices.index(Stack[-1])] == []):
            for i in Stack:
                gname = [j.gate for j in gateInfo if j.output==i]
                if(gname!=[]):
                    print("("+"".join(gname)+" ---> "+i+") --->",end="")
                else:
                    print(i+" --->",end="")
            print("\b\b\b\b    ")

        for j in self.adjacent[self.indices.index(Stack[-1])]:
            Stack.append(j)
            self.Traverse(Stack)
            Stack.pop()

class Gate():
    def __init__(self,gate,output):
        self.gate = gate 
        self.output = output

#x = input("Please enter the name of the file!\n")
x = "test.v"
file = open(x,"r")

lines = file.readlines()

gate =[]
nodes = set()
gateInfo = []

for i in lines:
    name = re.findall("[A-Za-z0-9]*[(].*[)]",i)
    if len(name)>0:
        name = name[0]
        name = name.split(')')[0]
        name = name.split('(')
        gname = name[0].replace(" ","")
        name = name[1]
        gateInfo.append(Gate(gname,name.split(',')[0]))
        gate.append(name.split(','))

        for j in name.split(','):
            nodes.add(j)

nodes = list(nodes)
nodes.sort()
G = Graph(nodes,gateInfo)

for i in gate:
    for j in range(1,len(i)):
        (G.adjacent[G.indices.index(i[j])]).append(i[0])

print("GRAPH:")
for i in range(len(G.indices)):
    print(G.indices[i]," : ",G.adjacent[i])
print()
print("-"*80)

out = [j for i in G.adjacent for j in i]
inputs = list(set(nodes)-set(out))
inputs.sort()
out = [G.indices[i] for i in range(len(G.indices)) if G.adjacent[i] == []]

print("Inputs:",inputs)
print("Outputs:",out)
print("-"*80)
print()


print("Paths in circuit:")
for i in inputs:
    Stack = [i]
    G.Traverse(Stack)

