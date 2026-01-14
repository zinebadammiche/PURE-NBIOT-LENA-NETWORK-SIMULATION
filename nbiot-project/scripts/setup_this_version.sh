#!/bin/bash
# Setup script for this ns3-lena-nb version on Kali

echo "========================================"
echo "SETUP NS3-LENA-NB (CUSTOM VERSION)"
echo "========================================"

# 1. Check scripts
if [ ! -f "configure.sh" ] || [ ! -f "compile.sh" ]; then
    echo "ERROR: Required scripts not found!"
    exit 1
fi

echo "Found configure.sh and compile.sh"

# 2. Configure
echo "Step 1: Configuring..."
chmod +x configure.sh compile.sh

# Try to see if configure.sh has help
if ./configure.sh --help 2>/dev/null | grep -q "help"; then
    echo "Configuring with options..."
    ./configure.sh --enable-examples --enable-tests
else
    echo "Configuring with default options..."
    ./configure.sh
fi

# 3. Compile
echo "Step 2: Compiling (this will take a while)..."
NPROC=$(nproc)
echo "Using $NPROC cores for compilation..."

./compile.sh -j$NPROC

# 4. Check for ns3 executable
echo "Step 3: Looking for ns3 executable..."
if [ -f "ns3" ]; then
    echo "Found ns3 executable"
    chmod +x ns3
elif [ -f "./build/ns3" ]; then
    echo "Found ns3 in build directory"
    ln -sf ./build/ns3 ns3
    chmod +x ns3
else
    echo "Creating ns3 wrapper..."
    # Check what was built
    find . -type f -name "*ns3*" -o -name "*.so" -o -name "*.a" | head -10
    
    # Create a simple wrapper
    cat > ns3 << 'WRAPPER'
#!/bin/bash
echo "NS3 wrapper for custom build"
echo "Available commands:"
echo "  ./compile.sh - recompile"
echo "  ./configure.sh - reconfigure"
echo "Check examples/ directory for examples"
WRAPPER
    chmod +x ns3
fi

# 5. Check examples
echo "Step 4: Checking examples..."
if [ -d "examples" ]; then
    echo "Examples directory found"
    ls examples/ 2>/dev/null | head -5
else
    echo "No examples directory found"
fi

echo "========================================"
echo "SETUP COMPLETE!"
echo "========================================"
echo "Next steps:"
echo "1. Create your experiment in scratch/ or examples/"
echo "2. Recompile: ./compile.sh"
echo "3. Run your experiment"
echo "========================================"
