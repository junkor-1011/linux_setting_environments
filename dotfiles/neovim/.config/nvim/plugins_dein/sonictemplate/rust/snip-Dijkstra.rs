use std::cmp::Reverse;

type K = i64;
const INF: K = 1i64 << 61;
struct Edge {
    from: usize,
    to: usize,
    weight: K,
}

fn dijkstra(edges: &Vec<Edge>, node_count: usize, node_from: usize) -> Vec<K> {
    let mut edges_from_nodes = vec![Vec::<(usize, K)>::new(); node_count];
    for Edge { from, to, weight } in edges {
        edges_from_nodes[*from].push((*to, *weight));
    }

    #[derive(Ord, PartialOrd, Eq, PartialEq)]
    struct Item(Reverse<K>, usize);

    let mut heap = std::collections::BinaryHeap::<Item>::new();
    heap.push(Item(Reverse(0), node_from));

    let mut shortest = vec![INF; node_count];

    while let Some(x) = heap.pop() {
        let Item(Reverse(score), node) = x;
        if score < shortest[node] {
            shortest[node] = score;
            for (to, w) in &edges_from_nodes[node] {
                heap.push(Item(Reverse(score + *w), *to));
            }
        }
    }

    shortest
}
