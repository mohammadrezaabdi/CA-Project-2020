from mipsRunner import MipsRunner

if __name__ == '__main__':

    with open('code.txt') as f:
        lines = f.readlines()
        lines = [line[:-1] for line in lines]

    mipsRunner = MipsRunner(lines=lines)

    mipsRunner.save_to_bin('out.mem')

    mipsRunner.memory[0] = 10
    mipsRunner.run()
