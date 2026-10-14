return {
  injector = {
    cpp = {
      before = {
        "#include <bits/stdc++.h>",
        "#include <vector>",
        "#include <string>",
        '#include "leetcode.hpp"',
        "using namespace std;",
      },
    },
    rust = {
      before = { "struct Solution;" },
    },
  },
}
