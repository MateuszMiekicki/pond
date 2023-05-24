# pound
A repository created specifically for storing Infrastructure as Code (IaC) for projects:
* [toad]([https://linktodocumentation](https://github.com/MateuszMiekicki/toad))
* [frog]([https://linktodocumentation](https://github.com/MateuszMiekicki/frog))

## Usage
A python script - run.py - is used to run the services. The script builds a container, single. If you choose frog, you don't build the base, without it forgo doesn't work without proper configuration.
### tldr;
```bash
pip install docker
python run.py #build and run all
python run.py --run all --force-rebuild all --remove-volumes #clear, rebuild and run all
```
### Examples
```bash
pip install docker
python run.py #default target is run - 'all'
python run.py --run toad databases --force-rebuild toad #force rebuild 'toad' and run 'toad' and 'databases'
python run.py --remove-volumes #remove all volumes in pond dir and run target 'all'
```
## What you build
### Frog
If you run docker-compose at the root of the folder, you will build a Web Server for with databases(PostgreSQL and QuestDB). If you run docker-compose in the toad folder, you will only build the server responsible for the MQTT broker.
```
.
├── frog
├── databases
│   ├── PostgreSQL
│   │   └── PGAdmin
│   └── QuestDB
│       └── REST API and Web Console
└── toad
    └── MQTT broker
```