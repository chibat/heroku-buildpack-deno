
function get_cache_command() {
  RUN_COMMAND=$1
  CACHE_OPTION=''
  OPTION_VALUE=off
  for WORD in $RUN_COMMAND
  do
    if [ "$OPTION_VALUE" = "on" ]
    then
      CACHE_OPTION="$CACHE_OPTION $WORD"
      OPTION_VALUE=off
      continue
    fi
    if [ "$WORD" = "--help" \
      -o "$WORD" = "--lock-write" \
      -o "$WORD" = "--no-remote" \
      -o "$WORD" = "--quiet" \
      -o "$WORD" = "--unstable" ]
    then
      CACHE_OPTION="$CACHE_OPTION $WORD"
      continue
    fi
    if [ "$WORD" = "--cert" \
      -o "$WORD" = "-c" \
      -o "$WORD" = "--config" \
      -o "$WORD" = "--importmap" \
      -o "$WORD" = "--lock" \
      -o "$WORD" = "--log-level" ]
    then
      CACHE_OPTION="$CACHE_OPTION $WORD"
      OPTION_VALUE=on
      continue
    fi

    if [[ "$WORD" =~ --cert=.* ]] \
      || [[ "$WORD" =~ -c=.* ]] \
      || [[ "$WORD" =~ --config=.* ]] \
      || [[ "$WORD" =~ --importmap=.* ]] \
      || [[ "$WORD" =~ --lock=.* ]] \
      || [[ "$WORD" =~ --log-level=.* ]]
    then
      CACHE_OPTION="$CACHE_OPTION $WORD"
      continue
    fi

    if [[ "$WORD" =~ .+\.(t|j)sx?(\"|\')?$ ]]
    then
      SCRIPT=$WORD
      echo "deno cache$CACHE_OPTION $SCRIPT"
      break
    fi
  done
}

