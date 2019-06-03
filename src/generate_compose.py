import sys
import html


def generate_grave_commands(inlet):
    outlet = []

    if inlet != 'n':
        for letter in [inlet, inlet.upper()]:
            result = html.unescape('&{}grave;'.format(letter))
            vars = [
                ('backslash', letter, result, ),
                (letter, 'backslash', result, ),
            ]
            for var in vars:
                outlet.append('<Multi_key> <{}> <{}> : "{}"'.format(*var))

    return outlet


def generate_tilde_commands(inlet):
    outlet = []

    if inlet != 'e':
        for letter in [inlet, inlet.upper()]:
            result = html.unescape('&{}tilde;'.format(letter))
            vars = [
                ('minus', letter, result, ),
                (letter, 'minus', result, ),
            ]
            for var in vars:
                outlet.append('<Multi_key> <{}> <{}> : "{}"'.format(*var))

    return outlet


if __name__ == '__main__':
    with open(sys.argv[1], 'w') as fp:
        fp.write('#include "%L"\n')
        for letter in 'aeioun':
            cmds = [
                *generate_grave_commands(letter),
                *generate_tilde_commands(letter),
            ]
            for cmd in cmds:
                fp.write('{}\n'.format(cmd))
        fp.write('<Multi_key> <backslash> <space> : "`"\n')
        fp.write('<Multi_key> <space> <backslash> : "`"\n')
