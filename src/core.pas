{$mode delphi}{$interfaces corba}{$H+}{$M+}{$J-}

unit Core;

interface
    uses dos, fgl, classes, rtti, sysutils;

    type
        Config     = class;
        Engine     = class;
        Factory    = interface;
        Factories  = TFPGMap<string, Core.Factory>;
        Singletons = TFPGMap<string, TObject>;
        Classes    = TFPGMap<string, TClass>;
        Handler    = function(var engine: Core.Engine): integer;

        {$include 'core/inc/Config.pp'}
        {$include 'core/inc/Engine.pp'}
        {$include 'core/inc/Factory.pp'}

        procedure register(classes: array of TClass);

    var
        registry: Core.Classes;

implementation
    {$include 'core/Config.pas'}
    {$include 'core/Engine.pas'}

    procedure register(classes: array of TClass);
        var
            identity: string;
            classPos: integer;
            classType: TClass;
        begin
            for classPos := low(classes) to high(classes) do
                begin
                    classType := classes[classPos];
                    identity  := format('%s.%s', [classType.unitName, classType.className]);
                    identity  := identity.toLower();

                    Core.registry.add(identity, classType);
                end;
        end;

initialization
    Core.registry := Core.Classes.create();

end.
