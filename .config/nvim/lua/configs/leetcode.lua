return {
  injector = {
    cpp = {
      before = {
        "#include <bits/stdc++.h>",
        "#include <vector>",
        "#include <string>",
        "using namespace std;",
      },
    },
    rust = {
      before = { "struct Solution;" },
    },
  },
}
