#include "iostream"
#include "set"
#include "tuple"
#include "vector"

using	namespace std;

#define tii tuple<int,int>

int	main()
{
	std::string s;
	std::cin >> s;
	// vector<vector<int>> V{{-1, 0}, {1, 0}, {0, 1},{0, -1}};
	set<vector<int>> S{{0, 0}};
	int x = 0, y = 0;
	for (char & c: s)
	{
		if (c == '^')
			y -= 1;
		if (c == 'v')
			y += 1;
		if (c == '<')
			x -= 1;
		if (c == '>')
			x += 1;
		S.insert({x, y});
	}
	int res = S.size();
	S.clear();
	x = 0, y = 0;
	int xx = 0, yy = 0, i = 0;
	while (i < s.length() - 1)
	{
		char l = s[i], r = s[i + 1];
		if (l == '^')
			y -= 1;
		if (l == 'v')
			y += 1;
		if (l == '<')
			x -= 1;
		if (l == '>')
			x += 1;
		S.insert({x, y});
		if (r == '^')
			yy -= 1;
		if (r == 'v')
			yy += 1;
		if (r == '<')
			xx -= 1;
		if (r == '>')
			xx += 1;
		S.insert({xx, yy});
		i += 2;
	}
	int res2 = S.size();
	cout << res << endl;
	cout << res2 << endl;
}
