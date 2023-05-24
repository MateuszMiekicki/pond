import sys
import os
import argparse
import shutil
import docker

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


def __prepare_docker_compose_command(path: str, command: str = 'up -d', file: str = 'docker-compose.yml'):
    return f'docker-compose -f "{SCRIPT_DIR}/{path}/{file}" {command}'


def __run_container(path: str):
    os.system(__prepare_docker_compose_command(path))


def run_frog():
    print('Running frog...')
    __run_container('frog')


def run_databases():
    print('Running databases...')
    __run_container('databases')


def run_toad():
    print('Running toad...')
    __run_container('toad')


def run_all():
    print('Running all...')
    run_databases()
    run_frog()
    run_toad()


RUNNABLE_TARGETS = {
    'frog': run_frog,
    'databases': run_databases,
    'toad': run_toad,
    'all': run_all
}


def __force_rebuild(path: str):
    os.system(__prepare_docker_compose_command(
        path, 'build --no-cache'))


def force_rebuild_frog():
    print('Forcing rebuild of frog...')
    __force_rebuild('frog')


def force_rebuild_toad():
    print('Forcing rebuild of toad...')
    __force_rebuild('toad')


def force_rebuild_all():
    force_rebuild_frog()
    force_rebuild_toad()


FORCE_REBUILD_TARGETS = {
    'frog': force_rebuild_frog,
    'toad': force_rebuild_toad,
    'all': force_rebuild_all
}


def __check_targets(targets: list, predefined_targets: dict):
    if targets is None:
        return False
    for target in targets:
        if target not in predefined_targets.keys():
            print(f'Unknown target: {target}')
            return False
    return True


def __print_helper_for_targets(targets: list):
    print('Available targets:')
    for target in targets.keys():
        print(f' - {target}')


def preprocessing_runnable_targets(targets: list):
    if not __check_targets(targets, RUNNABLE_TARGETS):
        __print_helper_for_targets(RUNNABLE_TARGETS)
        return False
    return True


def preprocessing_force_rebuild_targets(targets: list):
    if not __check_targets(targets, FORCE_REBUILD_TARGETS):
        __print_helper_for_targets(FORCE_REBUILD_TARGETS)
        return False
    return True


def run(target):
    RUNNABLE_TARGETS[target]()


def force_rebuild(target):
    FORCE_REBUILD_TARGETS[target]()


def remove_volumes():
    print('Run remove volumes...')
    for root, dirs, files in os.walk(SCRIPT_DIR):
        for directory in dirs:
            if directory == "volumes":
                dir_path = os.path.join(root, directory)
                shutil.rmtree(dir_path, ignore_errors=True)
                print(f"Remove directory: {dir_path}")


def create_network_if_not_exists(network_name):
    client = docker.from_env()
    existing_networks = client.networks.list(names=[network_name])

    if not existing_networks:
        client.networks.create(network_name)
        print(f'Network "{network_name}" created.')
    else:
        print(f'Network "{network_name}" already exists.')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', dest='targets',
                        help='select target to run', default=['all'], nargs='+')
    parser.add_argument('--force-rebuild', dest='force_rebuild_targets',
                        help='select target to run', nargs='+')
    parser.add_argument('--remove-volumes', dest='remove_volumes',
                        help='remove all volumes in dir', action='store_true')
    args, unknown = parser.parse_known_args()
    if unknown:
        print("unknown command: ", unknown)
        return
    create_network_if_not_exists('pond_network')
    if args.remove_volumes:
        remove_volumes()
    if args.force_rebuild_targets is not None and preprocessing_force_rebuild_targets(args.force_rebuild_targets):
        for target in args.force_rebuild_targets:
            force_rebuild(target)
    if args.targets is not None and preprocessing_runnable_targets(args.targets):
        for target in args.targets:
            run(target)


if __name__ == '__main__':
    main()
