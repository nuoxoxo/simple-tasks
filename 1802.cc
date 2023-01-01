#include "iostream"
#include "vector"

int	main()
{
	std::string s;
	int c2 = 0, c3 = 0, i;
	std::vector<std::string> a;
	while (!std::cin.eof() && std::cin >> s)
	{
		int D[26] = {0};
		for (char c: s)
			D[c - 'a']++;
		i = -1;
		bool two = false, three = false;
		while (++i < 26)
		{
			if (D[i] == 2)
				two = true;
			if (D[i] == 3)
				three = true;
		}
		if (two)
			++c2;
		if (three)
			++c3;
		a.push_back(s);
	}
	i = -1;
	int j, k;
	int len = a[0].length();
	std::string res;
	while (++i < len)
	{
		j = -1;
		while (++j < a.size())
		{
			std::string L;
			L = a[j].substr(0, i) + a[j].substr(i + 1, len - 1 - i);
			k = -1;
			while (++k < a.size())
			{
				if (j == k)
					continue ;
				std::string R;
				R = a[k].substr(0, i) + a[k].substr(i + 1, len - 1 - i);
				if (L == R)
				{
					res = L;
					break ;
				}
			}
		}
	}
	std::cout << c2 * c3 << '\n';
	std::cout << res << '\n';
	assert (res == "aixwcbzrmdvpsjfgllthdyoqe");
}
