#!/bin/sh

find . -type f \( -iname '*.png' -or -iname '*.jpg' -or -iname '*.jpeg' \) -print0 | xargs -0 -I {} cwebp -o {}.webp {}
find . -type f -iname '*.gif' -print0 | xargs -0 -I {} gif2webp -o {}.webp {}
