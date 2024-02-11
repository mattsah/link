{$mode delphi}{$interfaces corba}{$H+}{$M+}{$J-}

program app;

uses
    Core, Http, Mdlw;

var
    engine: Core.Engine;
    config: Core.Config;

begin
    config := Core.Config.create();
    engine := Core.Engine.create(config);

    {
        Register delegates, this should eventually be moved to the config
    }
    engine.delegate('Mdlw.Runner', engine.get<Mdlw.RunnerFactory>());

    halt(engine.run(@Mdlw.Dispatcher));
end.