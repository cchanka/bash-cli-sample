#!/bin/bash

_print_help(){
  cat << "EOF"
Usage:  build.sh [OPTIONS]"

Options:
    -h  --help        Print help
    -t  --tags list   Comma separated tags list. eg: 1.0.0,latest
    -p  --push        Push to ifsaledockerdev registry
EOF
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --push|-p)
            push=true
            shift
            ;;
        --tag|-t)
            tags="$2"
            shift
            shift
            ;;
        --help|-h)
            _print_help
            shift
            shift
            ;;
        *)
          echo "Option not found"
          _print_help
          shift
          ;;
    esac
done
