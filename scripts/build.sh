#!/bin/bash

# This script should be run from the project root: ./scripts/build.sh
# Usage: ./scripts/build.sh [OUTPUT_NAME] [--xe]
# Example: ./scripts/build.sh "My_CV" --xe

OUTPUT_NAME=${1:-"TungBuiThanh_CV"}
PDF_DIR="scripts/pdf"
USE_XE=false

# Check for --xe flag
for arg in "$@"; do
    if [ "$arg" == "--xe" ]; then
        USE_XE=true
    fi
done

# Ensure PDF directory exists
mkdir -p "$PDF_DIR"

# Detect main LaTeX file
MAIN_FILE=""
if [ -f "main.tex" ]; then
    MAIN_FILE="main.tex"
elif [ -f "resume.tex" ]; then
    MAIN_FILE="resume.tex"
else
    MAIN_FILE=$(ls *.tex 2>/dev/null | head -n 1)
fi

if [ -z "$MAIN_FILE" ]; then
    echo "❌ Error: Could not find a main LaTeX file (main.tex or resume.tex)."
    exit 1
fi

# Determine engine
ENGINE="-pdf"
if [ "$USE_XE" = true ] || grep -q "fontspec" "$MAIN_FILE"; then
    ENGINE="-xelatex"
    echo "⚙️  Using XeLaTeX engine..."
else
    echo "⚙️  Using pdfLaTeX engine..."
fi

echo "🚀 Building CV using $MAIN_FILE as: $OUTPUT_NAME.pdf in $PDF_DIR/..."

# Build the PDF
latexmk $ENGINE -jobname="$OUTPUT_NAME" -outdir="$PDF_DIR" -interaction=nonstopmode "$MAIN_FILE"

# Clean up
latexmk -c -jobname="$OUTPUT_NAME" -outdir="$PDF_DIR" "$MAIN_FILE"
rm -f "$PDF_DIR/$OUTPUT_NAME.xdv" "$PDF_DIR/$OUTPUT_NAME.bcf" "$PDF_DIR/$OUTPUT_NAME.run.xml"

if [ -f "$PDF_DIR/$OUTPUT_NAME.pdf" ]; then
    echo "✨ Build complete! Your file is ready at $PDF_DIR/$OUTPUT_NAME.pdf"
else
    echo "❌ Build failed. Please check the logs in $PDF_DIR/"
fi
