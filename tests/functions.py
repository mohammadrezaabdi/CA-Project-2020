def add(a, b, c):
    return a + b


def sub(a, b, c):
    return a - b


def mul(a, b, c):
    return a * b


def div(a, b, c):
    return a / b


def mod(a, b, c):
    return a % b


def nt(a, b, c):
    return ~a


def nand(a, b, c):
    return nt(a & b, 0, 0)


def xnor(a, b, c):
    return nt(a ^ b, 0, 0)


def shl(a, b, c):
    return a << c


def shrl(a, b, c):
    return a >> c


def rol(a, b, c):
    c %= 32
    return int(f"{a:032b}"[c:] + f"{a:032b}"[:c], 2)


def ror(a, b, c):
    c %= 32
    return int(f"{a:032b}"[-c:] + f"{a:032b}"[:-c], 2)


def slt(a, b, c):
    if a < b:
        return 1
    return 0

