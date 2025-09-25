set -e

echo "Running Ladybird tests..."

if [! -d "build"]; then
echo "No build folder found. Run ./scripts/build.sh first."
exit 1
fi

cd build

ctest --output-on-failure || true

if command -v lcov &> /dev/null; then
echo "Collecting coverage..."
lcov --directory . --capture --output-file coverage.info || true
genhtml coverage.info --output-directory coverage-report || true
fi

echo "Test completed."
