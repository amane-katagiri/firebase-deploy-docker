#!/bin/bash -Cue
SITE="$1"

firebase use --add "$SITE"
pip install -r ./requirements.txt
make firebase
