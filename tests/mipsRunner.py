from functions import *
from command import *


class MipsRunner:

    def __init__(self, lines):
        self.registers = [0] * 32
        self.memory = [0] * 64
        self.coded_values = list()
        self.commands = list()

        for line in lines:
            command = get_command(line)
            self.commands.append(command)

        self.pc = 0

    def save_to_bin(self, file_name):
        with open(file_name, 'w') as f:
            for command in self.commands:
                f.write(command.to_bin() + '\n')

    def run(self):
        self.pc = 0

        while True:
            command = self.commands[self.pc]
            if command.type == 'logical':
                function = globals()[command.instruction]
                self.registers[command.dst] = function(self.registers[command.src1], self.registers[command.src2],
                                                       command.sr) % (1 << 32)
            if command.type == 'load_immediate':
                if command.instruction == 'ldi':
                    self.registers[command.dst] = ((self.registers[command.dst] >> 16) << 16) + command.immediate
                else:
                    self.registers[command.dst] = (command.immediate << 16) + self.registers[command.dst] % (1 << 16)

            if command.type == "logic_immediate":
                function = globals()[command.instruction[:-1]]
                self.registers[command.dst] = function(self.registers[command.src], command.immediate, 0) % (1 << 32)

            if command.type == "memory":
                if command.instruction == 'lw':
                    self.registers[command.vr] = self.memory[self.registers[command.ar] + command.offset]
                if command.instruction == 'lb':
                    self.registers[command.vr] = ((self.registers[command.vr] >> 8) << 8) \
                                                 + self.memory[self.registers[command.ar] + command.offset] % (1 << 8)

                if command.instruction == 'sw':
                    self.memory[self.registers[command.ar] + command.offset] = self.registers[command.vr]
                if command.instruction == 'sb':
                    self.memory[self.registers[command.ar] + command.offset] =\
                        ((self.memory[self.registers[command.ar] + command.offset] >> 8) << 8) + \
                        self.registers[command.vr] % (1 << 8)

            if command.type == "jump":
                if command.instruction == 'jmp':
                    self.pc = ((self.pc >> 16) << 16) + command.address
                if command.instruction == 'jr':
                    self.pc = self.registers[command.reg1]

                if command.instruction in ['beq', 'blt']:
                    condition = (self.registers[command.reg1] == self.registers[command.reg2])
                    if command.instruction == 'blt':
                        condition = (self.registers[command.reg1] < self.registers[command.reg2])

                    if condition:
                        self.pc = self.pc + command.address
                    else:
                        self.pc = self.pc + 1

                if command.instruction == 'hlt':
                    break
            else:
                self.pc = self.pc + 1
        self.show_info()

    def show_info(self):
        with open('memory.mem', 'w') as f:
            for value in self.memory:
                f.write(f'{value:032b}\n')

        with open('cpu_register_file.mem', 'w') as f:
            for value in self.registers:
                f.write(f'{value:032b}\n')
        print('registers:', self.registers)
        print('memory:', self.memory)
