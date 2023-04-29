// isOk: boolean function
// (ng, ok] or [ok, ng)
int ok = n; // ###EDIT###
int ng = -1; // ###EDIT###

while (abs(ok - ng) > 1) {
    int mid = (ok + ng) / 2;
    if (isOk(mid)) ok = mid;
    else ng = mid;
}
