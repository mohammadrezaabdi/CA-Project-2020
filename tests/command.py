from upcodes import upcodes, types


class Command:

    def __init__(self, type, instruction):
        self.type = type
        self.instruction = instruction

    def to_bin(self):
        pass


class Logical(Command):

    def __init__(self, instruction, dst, src1, src2, sr):
        super(Logical, self).__init__('logical', instruction)
        self.instruction = instruction
        self.dst = dst
        self.src1 = src1
        self.src2 = src2
        self.sr = sr

    def to_bin(self):
        return f"{upcodes[self.instruction]}_{self.dst:05b}_{self.src1:05b}_{self.src2:05b}_{self.sr:05b}_{0:06b}"


class LoadImmediate(Command):

    def __init__(self, instruction, dst, src, immediate):
        super(LoadImmediate, self).__init__('load_immediate', instruction)
        self.dst = dst
        self.src = src
        self.immediate = immediate

    def to_bin(self):
        return f"{upcodes[self.instruction]}_{self.dst:05b}_{self.src:05b}_{self.immediate & 0xffff:016b}"


class LogicImmediate(Command):

    def __init__(self, instruction, dst, src, immediate):
        super(LogicImmediate, self).__init__('logic_immediate', instruction)
        self.dst = dst
        self.src = src
        self.immediate = immediate

    def to_bin(self):
        return f"{upcodes[self.instruction]}_{self.dst:05b}_{self.src:05b}_{self.immediate & 0xffff:016b}"


class Memory(Command):

    def __init__(self, instruction, vr, ar, offset):
        super(Memory, self).__init__('memory', instruction)
        self.vr = vr
        self.ar = ar
        self.offset = offset

    def to_bin(self):
        return f"{upcodes[self.instruction]}_{self.vr:05b}_{self.ar:05b}_{self.offset & 0xffff:016b}"


class Jump(Command):

    def __init__(self, instruction, reg1, reg2, address):
        super(Jump, self).__init__('jump', instruction)
        self.reg1 = reg1
        self.reg2 = reg2
        self.address = address

    def to_bin(self):
        return f"{upcodes[self.instruction]}_{self.reg1:05b}_{self.reg2:05b}_{self.address & 0xffff:016b}"


def get_register_number(name):
    if name == 0:
        return 0
    if name[0:2] == '$r':
        return int(name[2:])
    if name == '$pc':
        return 1
    if name == '$ir':
        return 2
    return 0


def get_command(line):
    line = line.lower().split()
    instruction = line[0]

    for _ in range(10):
        line.append(0)

    if instruction == 'not':
        instruction = 'nt'

    if types[instruction] == 'logical':
        return Logical(instruction=instruction,
                       dst=get_register_number(line[1]),
                       src1=get_register_number(line[2]),
                       src2=get_register_number(line[3]),
                       sr=int(line[4]))

    if types[instruction] == 'load_immediate':
        return LoadImmediate(instruction=instruction,
                             dst=get_register_number(line[1]),
                             src=get_register_number(line[2]),
                             immediate=int(line[3]))

    if types[instruction] == 'logic_immediate':
        return LogicImmediate(instruction=instruction,
                              dst=get_register_number(line[1]),
                              src=get_register_number(line[2]),
                              immediate=int(line[3]))

    if types[instruction] == 'memory':
        return Memory(instruction=instruction,
                      vr=get_register_number(line[1]),
                      ar=get_register_number(line[2]),
                      offset=int(line[3]))

    if types[instruction] == 'jump':
        return Jump(instruction=instruction,
                    reg1=get_register_number(line[1]),
                    reg2=get_register_number(line[2]),
                    address=int(line[3]))
