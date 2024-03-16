// ext_gcd(a, b, &mut x, &mut y) -> d
// satisfies: a * x + b * y = gcd(a, b) = d
fn ext_gcd(a: Int, b: Int, x: &mut Int, y: &mut Int) -> Int {
    let mut d = a;

    if b != 0 {
        d = ext_gcd(b, a % b, y, x);
        *y -= (a / b) * *x;
    } else {
        *x = 1;
        *y = 0;
    }

    d.abs()
}
