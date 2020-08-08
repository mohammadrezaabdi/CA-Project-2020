from mipsRunner import MipsRunner

if __name__ == '__main__':

    with open('code.txt') as f:
        lines = f.readlines()
        lines = [line[:-1] for line in lines]

    mipsRunner = MipsRunner(lines=lines)

    mipsRunner.save_to_bin('out.mem')

    with open('input_memory.mem') as f:
        lines = f.readlines()
        lines = [line[:-1] for line in lines]
        for i in range(64):
            mipsRunner.memory[i] = int(lines[i], 2)

    mipsRunner.run()
