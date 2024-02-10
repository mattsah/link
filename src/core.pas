{$mode delphi}{$interfaces corba}{$H+}{$M+}{$J-}

unit Core;

interface
    uses dos, fgl, classes, rtti, sysutils;

    type
        Config    = class;
        Engine    = class;
        Factory   = interface;
        Factories = TFPGMap<string, Core.Factory>;
        Handler   = function(var engine: Core.Engine): integer;

    {$include 'core/inc/Config.pp'}
    {$include 'core/inc/Engine.pp'}
    {$include 'core/inc/Factory.pp'}
implementation
    {$include 'core/Config.pas'}
    {$include 'core/Engine.pas'}
end.
