#include "iostream"

int	main()
{
	std::string s;
	std::cin >> s;
	std::cout << s.length() << std::endl;
	int flr = 0;
	int i = -1;
	while (++i < s.length())
	{
		if (s[i] == '(')
			++flr;
		if (s[i] == ')')
			--flr;
	}
	int count = 0;
	i = -1;
	while (++i < s.length())
	{
		if (count == -1)
			break ;	
		if (s[i] == '(')
			++count;
		if (s[i] == ')')
			--count;
	}
	std::cout << flr << '\n';
	std::cout << i << '\n';
}
