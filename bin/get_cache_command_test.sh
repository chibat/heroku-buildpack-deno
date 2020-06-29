#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/get_cache_command.sh

IN='web: deno run foo.ts'
echo "$IN"
get_cache_command "$IN"
echo

IN='web: deno run "foo.ts"'
echo "$IN"
get_cache_command "$IN"
echo

IN="web: deno run 'foo.ts'"
echo "$IN"
get_cache_command "$IN"
echo

IN='web: deno run foo.js'
echo $IN
get_cache_command "$IN"
echo

IN='web: deno run foo.tsx'
echo $IN
get_cache_command "$IN"
echo

IN='web: deno run foo.jsx'
echo $IN
get_cache_command "$IN"
echo

IN='web: deno run --allow-env --allow-net=:${PORT} --unstable -c c.json --config config.json --importmap importmap.json "foo.ts"'
echo $IN
get_cache_command "$IN"
echo

IN='web: deno run --allow-env --allow-net :${PORT} --unstable -c=c.json --config=config.json --importmap=importmap.json "foo.ts"'
echo $IN
get_cache_command "$IN"
echo

