<p style="text-align: right">
    View documentation: <a href="docs/en/main.md">en</a> | <a href="docs/pt-br/main.md">pt-br</a>
</p>

# Apache Nifi
A simple Apache NIFI docker implementation

## General informations:

### System requirements
```
Docker: v18.09.7 or latest
docker-compose: v1.23.1 or latest
```

### Project structure
```
.
├── app
│   └── nifi
│       ├── res
│       │   ├── content_repository
│       │   ├── database_repository
│       │   ├── flowfile_repository
│       │   ├── logs
│       │   ├── provenance_repository
│       │   └── state
│       └── src
│           ├── conf
│           │   ├── args.properties
│           │   └── nifi.properties
│           ├── flow
│           └── lib
├── env
│   ├── docker-compose.yml
│   └── nifi
│       ├── Dockerfile
│       └── scripts
│           └── helpers.sh
├── LICENSE
├── make.bat
├── Makefile
└── README.md
```