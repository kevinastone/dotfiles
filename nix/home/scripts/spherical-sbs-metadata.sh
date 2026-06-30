OUTPUT_FILE="${2:-output_video.mp4}"
INPUT_FILE="$1"
if [ -z "$INPUT_FILE" ]; then
    echo "Usage: $0 <input-file> [<output-file>]"
    exit 1
fi

echo "Writing output: to $OUTPUT_FILE"

exiftool -o "$OUTPUT_FILE" \
    -XMP-GSpherical:Spherical="True" \
    -XMP-GSpherical:Stitched="True" \
    -XMP-GSpherical:ProjectionType="equirectangular" \
    -XMP-GSpherical:StereoMode="left-right" \
    "$INPUT_FILE"
