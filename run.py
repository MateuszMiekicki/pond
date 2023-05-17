import sys
import os
import argparse

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


def __prepare_docker_compose_command(path: str, file: str = 'docker-compose.yml', command: str = 'up -d'):
    return f'docker-compose -f {SCRIPT_DIR}/{path}/{file} {command}'


def run_frog():
    print('Running frog...')
    os.system(__prepare_docker_compose_command("frog"))


def run_databases():
    print('Running databases...')
    os.system(__prepare_docker_compose_command("databases"))


def run_toad():
    print('Running toad...')
    os.system(__prepare_docker_compose_command("toad"))


def run_all():
    print('Running all...')
    run_databases()
    run_frog()
    run_toad()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', dest='target', required=True,
                        help='target to run', default='all')
    args = parser.parse_args()
    switcher = {
        'frog': run_frog,
        'databases': run_databases,
        'toad': run_toad,
        'all': run_all
    }
    switcher[args.target]()
    print('Done!')


if __name__ == '__main__':
    main()
