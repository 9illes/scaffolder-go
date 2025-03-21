#!/bin/sh

# Check if the module name is provided
if [ -z "$1" ]; then
  echo "Error: Go module name is required"
  exit 1
fi

# Set the module name
MODULE_NAME=$1

# Initialize the Go module
go mod init $MODULE_NAME

echo "Go project initialized with module name: $MODULE_NAME"

# Install Cobra CLI
echo "Installing Cobra CLI..."
go get -u github.com/spf13/cobra-cli

# Create a new Cobra command
cobra-cli init

# Create a new command
cobra-cli add serve

# Initialize air for live reload

go get -u github.com/cosmtrek/air
air init

# Initialize directory structure

mkdir -p {internal,pkg,scripts,var/{tmp,data,log}}

# Initialize the Git repository

if [ -d "/path/to/directory" ]; then
  echo "Git repository already exists, skipping..."
else
  git init
  cat > .gitignore << EOF
/build
/tmp
/var/data/*.db
/var/log/*.log
EOF
fi

cat > Makefile << EOF
BINARY_NAME=main
BUILD_DIR=build

test: ## Run tests
	go clean -testcache
	go test ./...

coverage: ## Run tests with coverage
	mkdir -p ${BUILD_DIR}
	go test -coverprofile=${BUILD_DIR}/coverage.out ./...
	go tool cover -html=${BUILD_DIR}/coverage.out

build: ## Build the binary file
	go build -o ${BINARY_NAME} main.go

run: ## Run the binary file
	go build -o ${BINARY_NAME} main.go
	./${BINARY_NAME}

live: ## Run the binary file with live reload
	air

clean: ## Remove previous build
	go clean
	rm -f ${BINARY_NAME}
	rm -Rf ./${BUILD_DIR}
EOF

echo "# $MODULE_NAME" > README.md

echo "Go project initialized successfully with module name: $MODULE_NAME"