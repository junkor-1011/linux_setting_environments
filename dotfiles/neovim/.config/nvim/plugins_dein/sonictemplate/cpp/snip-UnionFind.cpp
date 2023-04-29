vector<int> par(MAX_N);
vector<int> depth(MAX_N, 0);

void init(int n) {
    for (int i = 0; i < n; ++i) {
        par[i] = i;
    }
}

// find root
int find(int x) {
    if (par[x] == x) {
        return x;
    } else {
        return par[x] = find(par[x]);
    }
}

// unite group
void unite(int x, int y) {
    x = find(x);
    y = find(y);
    if (x == y) return;

    if (depth[x] < depth[y]) {
        par[x] = y;
    } else {
        par[y] = x;
        if (depth[x] == depth[y]) depth[x]++;
    }
}

// judge whether both x and y belong to the same group
bool same(int x, int y) {
    return find(x) == find(y);
}
