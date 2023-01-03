#include "iostream"
#include "vector"
#include "sstream"
#include "algorithm"

int	main()
{
	std::string s;
	int r = 0;
	int r2 = 0;
	while (!std::cin.eof() && getline(std::cin, s))
	{
		std::vector<int> a;
		std::stringstream ss(s);
		int n;
		while (ss >> n)
			a.push_back(n);
		std::pair<std::vector<int>::iterator, std::vector<int>::iterator> it;
		it = minmax_element(a.begin(), a.end());
		r += *it.second - *it.first;

		// p2
		sort(a.begin(), a.end());
		int i = a.size();
		int ok = 0;
		while (--i > 0 && !ok)
		{
			int j = i;
			while (--j > -1)
			{
				if (a[i] % a[j] == 0)
				{
					ok = 1;
					r2 += a[i] / a[j];
				}
			}
		}
		
	}
	std::cout << r << '\n';
	std::cout << r2 << '\n';
}
