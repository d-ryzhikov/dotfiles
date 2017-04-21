#!/usr/bin/env python
import argparse
import pickle
import subprocess
import re

SAVE_FILE = '.touchpad_on'


def main(load):
    if load:
        try:
            with open(SAVE_FILE, 'rb') as f:
                status = pickle.load(f)
        except IOError:
            status = False
    else:
        output = subprocess.check_output('synclient')
        status = bool(re.search(r'TouchpadOff(\s)+=(\s)+0', output))

    subprocess.check_call(['synclient', 'TouchpadOff=%d' % int(status)])
    with open(SAVE_FILE, 'wb') as f:
        pickle.dump(status, f)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Toggle touchpad or '
                                                 'load its last saved status')
    parser.add_argument('--load', action='store_true',
                        help='load last saved status')
    main(**vars(parser.parse_args()))
