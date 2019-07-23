# Heroku Buildpack for Deno

## Specify a Deno Runtime

To specify your Deno version, you also need a `runtime.txt` file - unless you are using the latest Deno runtime version.
```
$ cat runtime.txt
v0.12.0
```

<!--
## Settings to download all dependencies at deployment time

Create `fetch.ts` to your app’s root directory.
Import the source code that starts the application in `fetch.ts`.

example
```typescript
import {} from "./main.ts";
```

The downloaded files are cached.
-->

## About listen port

Use the environment variable `PORT` provided by the heroku runtime as the port number that the application listen.

## Getting Started

https://github.com/chibat/heroku-deno-getting-started


## Remarks

### Directory structure
```
/app/.heroku/bin/deno
/app/.heroku/cache/deps/
/app/.heroku/cache/gen/
/app/.profile.d/deno.sh
```
