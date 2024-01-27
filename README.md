# Link

Link is an experimental (as in first program I've written in Pascal) lightweight web framework
written in Object Pascal.  Don't expect this thing to be useful.

# Philosophy

While this project is mostly for learning purposes, it is, in part, because most of my learning
and exploration, thus far, has taught me that modern/complex Pascal is insanely horrendous to
read. Conventions are built on top of what is an otherwise extremely argumentative language with
lots of symbol/identifier collisions, inflexible namespacing (units), etc.  Pascal bros, come at
me!

> There are only two hard things in Computer Science: cache invalidation and naming things.
>
>  -- Phil Karlton

In a field where naming is already difficult, naming in Pascal is orders of magnitude higher if you
want clean, simple language, without the whole `IThis` and `TThat`.  In the end, the language may
get the better of me.  There are lots of things I really like about the Pascal syntax, and it's
been a long time since I worked in something that exposes lower level concepts.

# Building and Testing

- Install Free Pascal
- Install GVM and get a reasonable version of Go (tested with 1.21.3)
- Install xcaddy and build caddy with CGI:
    ```
    xcaddy build --with github.com/aksdb/caddy-cgi/v2 --output ./bin/caddy
    ```
- Get wasted and contemplate why you're doing this.
- Run `make.sh` to compile or `serve.sh` to compile and serve.
- Visit http://localhost:8080 (or whatever IP if you're running in Docker/WSL2/whatever)

   > NOTE: By default `caddy` will run over HTTP (not HTTPS) on all open IPs.  See `sup/caddy` to
   chane the configuration.