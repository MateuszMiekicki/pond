# pound
A repository created specifically for storing Infrastructure as Code (IaC) for projects:
* [toad]([https://linktodocumentation](https://github.com/MateuszMiekicki/toad))
* [frog]([https://linktodocumentation](https://github.com/MateuszMiekicki/frog))

## Usage
The following command runs two tasks. The first task builds and deploys the database from the init step. The second task builds the API image according to the `Dockerfile` in the docker dir.
The API is available at 8080
```bash
# if you want to update the versions
docker-compose build --no-cache
docker-compose up --build --force-recreate --no-deps -d
# Options:
#     -d, --detach        Detached mode: Run containers in the background,
#                         print new container names. Incompatible with
#                         --abort-on-container-exit.
#     --no-deps           Don't start linked services.
#     --force-recreate    Recreate containers even if their configuration
#                         and image haven't changed.
#     --build             Build images before starting containers.
#
```