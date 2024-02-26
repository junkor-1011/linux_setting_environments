// return Vec of (primary, count) pair
type K = i64;
fn prime_factorization(n: K) -> Vec<(K, K)> {
    let mut n = n;
    let mut x = 2;

    let mut v = Vec::new();

    while x * x <= n {
        if n % x != 0 {
            x += 1;
            continue;
        }

        let mut cnt = 0;
        while n % x == 0 {
            cnt += 1;
            n /= x;
        }

        v.push((x, cnt));
    }

    if n != 1 {
        v.push((n, 1));
    }

    v
}
