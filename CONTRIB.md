# Contributing

Right now I'm mostly taking suggestions.  Things I'd like to see implemented but have little to
no idea where to begin:

- Auto-wired recursive constructor dependency injection via `Engine.get()` method.
    - If a factory is registered for the corresponding class or interface it uses the factory.
- Suggestions on how to get a functional version of `fppkg`, as the stable version has a bad SSL
  dependency and building FPC from source results in "error: Access violation."
    - I mostly need this for TOML (which will be the preferred configuration language)
- Some sort of suggestion around an ORM or at least database abstraction library.

If you really want to give a pull request then please note the conventions already in place:

- Source is broken down into logical sub units
- No T/I or other garbage prefixes are allowed.
- Keep private class properties as `_` prefixed to avoid collisions with types as it's common to
  have properties that reflect the type.
- Don't use `property` for access to these (that will also collide with the type), use setters
  and getters instead.
- Always use `result :=` for consistenty and clarity.
- Always use `self.<property>`, `self.<method>()`, `inherited <method>()` for consistency and
  clarity.