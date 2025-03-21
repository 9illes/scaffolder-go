# Scaffolder Go

This is a simple scaffolder for Go projects. It creates a basic project structure with a main.go file and a go.mod file.

Usage :

```sh
wget https://raw.githubusercontent.com/9illes/scaffolder-go/master/init.sh
chmod +x init.sh
sh init.sh github.com/{username}/{project_name}
```

This will create a project structure with the following files:

```txt
.
├── LICENSE
├── Makefile
├── README.md
├── cmd
│   ├── root.go
│   └── serve.go
├── go.mod
├── go.sum
├── init.sh
├── internal
├── main.go
├── pkg
├── scripts
└── var
    ├── data
    ├── log
    └── tmp
```
