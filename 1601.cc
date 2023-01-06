#include "iostream"
#include "sstream"
#include "cstdlib"
#include "set"
#include "utility"
#include "vector"

using	namespace std;

int	main()
{
	string s;
	int r = 0, c = 0;
	int dir = 0;
	vector<vector<int>> dp = {{{0, -1}, {1, 0}, {0, 1}, {-1, 0}}}; // p1 hack
	set<pair<int, int>> S;
	int r2 = 0; // p2
	int ok = 0; // p2
	while (!cin.eof() && cin >> s)
	{
		S.insert({r, c});
		char ch = s[0];
		int n = stoi(s.substr(1).c_str());
		if (ch == 'R')
			dir += 1;
		if (ch == 'L')
			dir -= 1;
		dir = (dir + 4) % 4;
		int rr = r + n * dp[dir][0];
		int cc = c + n * dp[dir][1];
		// p2
		int i, j;
		if (ok)
		{
			r = rr, c = cc;
		}
		else
		{
			i = min(r, rr);
			j = max(r, rr);
			while (++i < j)
			{
				if (S.find({i, c}) != S.end())
				{
					ok = 1;
					r2 = abs(r) + abs(i);
					break ;
				}
				S.insert({i, c});
			}
			if (ok)
			{
				r = rr, c = cc;
				continue ;
			}
			i = min(c, cc);
			j = max(c, cc);
			while (++i < j)
			{
				if (S.find({r, i}) != S.end())
				{
					r2 = abs(r) + abs(i);
					ok = 1;
					break ;
				}
				S.insert({r, i});
			}
			r = rr, c = cc;
		}
	}
	cout << abs(r) + abs(c) << endl;
	cout << r2 << endl;
}
