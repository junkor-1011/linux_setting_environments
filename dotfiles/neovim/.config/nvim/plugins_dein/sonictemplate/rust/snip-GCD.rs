fn gcd(m: i32, n: i32) -> i32 {
    if n == 0 {
        return m;
    } else {
        return gcd(n, m % n);
    }
}
