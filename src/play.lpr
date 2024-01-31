{$mode objfpc}{$interfaces corba}{$H+}{$J-}

program play;

{
    This program is designed to show you how to perform some common and basic tasks in the Pascal
    programming language.  Add functional examples here and follow the template.
}

uses
    dos, fgl, classes, sysutils, rtti;

type
    foo = class
        private

        public
            constructor create();
            function bar(): string;
        end;

    constructor foo.create();
        begin
        end;

    function foo.bar(): string;
        begin
            result := 'bar';
        end;


var
    str: string;
    instance: foo;

begin
    {
        Get an environment variable

        uses dos;
    }
    writeln(getEnv('FOO'));

    {
        Split and iterate over a string.

        uses sysutils;
    }
    for str in 'foo:bar'.split(':') do
        begin
            writeln(str);
        end;

    {
        Construct object, or get pointer to an object.
    }
    instance := foo.create();

    {
        Get the class name of an object
    }
    writeln(instance.className);

    {
        Call a method
    }
    writeln(instance.bar());
end.