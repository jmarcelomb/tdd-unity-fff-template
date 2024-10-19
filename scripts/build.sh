#/usr/bin/env bash

VERSION=0.0.1
CLEANE_BUILD=false

show_help() {
    echo "Usage: ${0##*/} [-h|--help] [--version] [-c|--clean-build]"
    echo
    echo "Options:"
    echo "  -h, --help          Display this help message and exit."
    echo "  --version           Display the script version and exit."
    echo "  -c, --clean-build   Perform a clean build by removing the build directory before building."
}

# Argument Parsing
while :; do
    case $1 in
        -h|-\?|--help)
            show_help
            exit
            ;;
        --version)
            printf "%s\n" "$VERSION"
            exit 0
            ;;
        -c|--clean-build)
            CLEANE_BUILD=true
            ;;
        --)  # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)  # Default case: No more options, break.
            break
    esac
    shift
done

if [ "$CLEANE_BUILD" = "true" ]; then
    rm -rf build/
    mkdir build
fi

if [ -d "build" ]; then
    cd build
    cmake .. || { echo "cmake configuration failed"; exit 1; }
    cmake --build . || { echo "cmake build failed"; exit 1; }
    cd ..
else
    echo "Failed to create build directory"
    exit 1
fi
