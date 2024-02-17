type Int = i32; // EDIT
fn gcd(m: Int, n: Int) -> Int {
    if n == 0 {
        return m;
    } else {
        return gcd(n, m % n);
    }
}
