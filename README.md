# Heroku Buildpack for Deno

## Settings to download all dependencies at deployment time

Create `fetch.ts` in project root directory.
Import the source code that starts the application in `fetch.ts`.

example
```typescript
import {} from "./main.ts";
```

The downloaded files are cached.


## Remarks

### Directory structure
```
/app/.heroku/bin/deno
/app/.heroku/cache/deps/
/app/.heroku/cache/gen/
/app/.profile.d/deno.sh
```
