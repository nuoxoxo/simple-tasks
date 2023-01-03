import re

lines = open('_inputs_/1702.0')
r = 0
r2 = 0
for line in lines:
    a = [ int(_) for _ in re.findall('[0-9]+', line) ]
    r += max(a) - min(a)

    # p2
    a.sort(reverse=True)
    ok = False
    for i in range(0, len(a) - 1):
        if ok: break
        for j in range(i + 1, len(a)):
            if ok: break
            if a[i] % a[j] == 0:
                r2 += a[i] // a[j]
                ok = True
print(r)
print(r2)
