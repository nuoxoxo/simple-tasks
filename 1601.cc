#include "iostream"
#include "sstream"
#include "cstdlib"
#include "set"
#include "utility"

using	namespace std;

int	main()
{
	string s;
	int r = 0, c = 0;
	int dir = 0;
	set<pair<int, int>> S; // p2
	int r2 = 0; // p2
	int ok = 0;
	while (!cin.eof() && cin >> s)
	{
		cout << s << endl;
		char ch = s[0];
		int n = stoi(s.substr(1).c_str());
		if (ch == 'R')
			dir += 1;
		if (ch == 'L')
			dir -= 1;
		dir = (dir + 4) % 4;
		switch(dir)
		{
			case 0:
				r -= n;
				break ;
			case 2:
				r += n;
				break ;
			case 1:
				c += n;
				break ;
			case 3:
				c -= n;
				break ;
		}
		// cout << r << ' ' << c << endl;
		
		if (!ok && S.find({r, c}) != S.end())
		{
			r2 = abs(r) + abs(c);
			ok = 1;
		}
		S.insert({r, c});
	}
	cout << abs(r) + abs(c) << endl;
	cout << r2 << endl;
}
