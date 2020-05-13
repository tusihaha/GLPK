import os
os.system("glpsol --model problem.mod > result.txt")

file = open("result.txt", "r")

lines = file.readlines()

cls = []
r = []
t = []

result = []

for line in lines:
	c = line.split(" ")
	if c[0] == "result:":
		if c[1] not in cls:
			cls.append(c[1])
		if c[2] not in r:
			r.append(c[2])
		if c[3] not in t:
			t.append(c[3])
		if c[4] == '1\n':
			result.append((c[1], c[2], c[3]))

print(" ", end=" ")
for i in r:
	print(i, end=" ")
print()
for i in t:
	print(i, end=" ")
	for j in range(len(r)):
		found = False
		for k in cls:
			if (k, r[j], i) in result:
				print(k, end=" ")
				found = True
		if not found:
			print(" ", end=" ")
	print() 
