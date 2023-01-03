# 600851475143

def isprime(n: int) -> bool:
    if n < 2:
        return False
    if n == 2:
        return True
    i = 3
    while i * i <= n:
        if n % i == 0:
            return False
        i += 2
    return True


N = 600851475143
r = -1
n = 3
while n * n < N + 1:
    if N % n == 0 and isprime(n):
        r = n
    n += 2
print(r)
