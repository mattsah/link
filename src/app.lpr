{$mode objfpc}{$H+}{$J-}

program app;

uses
    Core, Http;

var
    engine: Core.Engine;
    config: Core.Config;

begin
    config := Core.Config.create();
    engine := Core.Engine.create(config);

    halt(engine.run(@Http.Dispatcher));
end.