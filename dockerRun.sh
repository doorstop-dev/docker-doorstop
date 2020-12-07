docker run --name doorstop --rm \
    -v "$(pwd)/data:/usr/src/doorstop/data" \
    -i -t doorstop_image
