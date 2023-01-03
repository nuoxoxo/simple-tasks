// 600851475143

#include "iostream"

int		isprime(long long);
long long	N = 600851475143;

int	main()
{
	/*std::cout << isprime(4) << '\n';
	std::cout << isprime(3) << '\n';
	*/
	long long n = 3;
	long long r = -1;
	while (n * n < N + 1)
	{
		if (N % n == 0 && isprime(n))
			r = n;
		n += 2;
	}
	std::cout << r << '\n';;
}

int	isprime(long long n)
{
	if (n < 2)
		return 0;
	if (n == 2)
		return 1;
	long long i = 3;
	while (i * i <= n)
	{
		if (n % i == 0)
			return 0;
		i += 2;
	}
	return 1;
}
