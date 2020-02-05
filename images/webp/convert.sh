#!/bin/sh

find . -type f \( -iname '*.png' -or -iname '*.jpg' -or -iname '*.jpeg' \) -print0 | xargs -i -0 cwebp -o {}.webp {}
find . -type f -iname '*.gif' -print0 | xargs -i -0 gif2webp -o {}.webp {}
