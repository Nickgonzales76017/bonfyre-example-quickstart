#!/bin/sh
# setup.sh — Clone and build Bonfyre (only needs to run once)
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BONFYRE_DIR="$SCRIPT_DIR/bonfyre"

if [ -d "$BONFYRE_DIR" ] && [ -f "$BONFYRE_DIR/Makefile" ]; then
    echo "Bonfyre already cloned at $BONFYRE_DIR"
else
    echo "Cloning Bonfyre..."
    git clone https://github.com/Nickgonzales76017/bonfyre.git "$BONFYRE_DIR"
fi

echo ""
echo "Building all 46 binaries + libraries..."
echo "(This takes ~2 minutes on first run)"
echo ""

cd "$BONFYRE_DIR"
make 2>&1 | tail -5

echo ""
echo "Setup complete. Run ./run.sh to see the demos."
