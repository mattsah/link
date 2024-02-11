Files should start with:

```pascal
{$mode objfpc}{$interfaces corba}{$H+}{$M+}{$J-}
```

You can get an environment variable using the `getEnv()` function.  You will need to use `dos` for this function to be available:

```pascal
uses dos;

writeln(getEnv('FOO'));
```

### Working With Strings

Use the `sysutils` unit to enable some functions on strings:

```pascal
uses sysutils;
```

#### Trim

```pascal

```

#### Split

```pascal
for str in 'foo:bar'.split(':') do
    begin
        writeln(str);
    end;
```