{$mode delphi}{$interfaces corba}{$H+}{$J-}

unit Core;

interface
    uses dos, fgl, classes, rtti;

    type
        Engine    = class;
        Config    = class;
        Delegate  = interface;
        Handler   = function(var engine: Core.Engine): integer;

    {$include 'core/inc/Engine.pp'}
    {$include 'core/inc/Config.pp'}
    {$include 'core/inc/Delegate.pp'}
implementation
    {$include 'core/Engine.pas'}
    {$include 'core/Config.pas'}
end.
