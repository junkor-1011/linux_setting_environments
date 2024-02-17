type K = usize;

struct UnionFind {
    parent: Vec<K>,
    rank: Vec<usize>,
}

impl UnionFind {
    fn new(n: usize) -> Self {
        let parent = (0..n).collect::<Vec<K>>();
        let rank = vec![0usize; n];
        UnionFind { parent, rank }
    }

    fn root(&mut self, x: K) -> K {
        if self.parent[x] == x {
            x
        } else {
            let r = self.root(self.parent[x]);
            self.parent[x] = r;
            r
        }
    } 

    fn is_same(&mut self, x: K, y: K) -> bool {
        self.root(x) == self.root(y)
    }

    fn merge(&mut self, x: K, y: K) -> bool {
        let x = self.root(x);
        let y = self.root(y);
        if x == y {
            return false;
        }

        if self.rank[x] < self.rank[y] {
            self.parent[x] = y;
        } else if self.rank[x] > self.rank[y] {
            self.parent[y] = x;
        } else {
            self.rank[x] += 1;
            self.parent[y] = x;
        }

        true
    }
}
