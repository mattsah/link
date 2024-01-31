{$mode objfpc}{$interfaces corba}{$H+}{$J-}

program app;

uses
    Core, Http, Mdlw;

var
    engine: Core.Engine;
    config: Core.Config;

begin
    config := Core.Config.create();
    engine := Core.Engine.create(config);

    halt(engine.run(@Mdlw.Dispatcher));
end.