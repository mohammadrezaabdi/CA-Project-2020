upcodes = {'add': '000001', 'sub': '000010', 'mul': '000011', 'div': '000100', 'mod': '000101', 'max': '000110',
           'min': '000111', 'not': '001000', 'nand': '001001', 'xnor': '001010', 'shl': '001011', 'shrl': '001100',
           'rol': '001101', 'ror': '001110', 'slt': '001111', 'ldi': '010000', 'lui': '010001', 'addi': '010010',
           'subi': '010011', 'muli': '010100', 'divi': '010101', 'nandi': '010110', 'xnori': '010111', 'lw': '011000',
           'sw': '011001', 'lb': '011010', 'sb': '011011', 'jmp': '011100', 'jr': '011101', 'beq': '011110',
           'blt': '011111',
           'hlt': '000000'}

types = {
    'add': 'logical', 'sub': 'logical', 'mul': 'logical', 'div': 'logical', 'mod': 'logical', 'max': 'logical',
    'min': 'logical', 'not': 'logical', 'nand': 'logical', 'xnor': 'logical', 'shl': 'logical', 'shrl': 'logical',
    'rol': 'logical', 'ror': 'logical', 'slt': 'logical', 'ldi': 'load_immediate', 'lui': 'load_immediate',
    'addi': 'logic_immediate', 'subi': 'logic_immediate', 'muli': 'logic_immediate', 'divi': 'logic_immediate',
    'nandi': 'logic_immediate', 'xnori': 'logic_immediate', 'lw': 'memory', 'sw': 'memory', 'lb': 'memory',
    'sb': 'memory', 'jmp': 'jump', 'jr': 'jump', 'beq': 'jump', 'blt': 'jump', 'hlt': 'jump'
}
