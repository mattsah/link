{$mode objfpc}{$H+}{$J-}

program app;

uses
    Core, Http;

var
    engine: Core.Engine;
    config: Core.Config;

function handler(): integer;
    var
        request: Http.Request;
        response: Http.Response;
    begin
        request  := Http.Request.createFromServer();
        response := Http.Response.create();

        response.addHeader('Content-Type', 'text/html');
        response.addHeader('Connection', 'closed');
        response.addHeader('X-Test', 'foo');
        response.addHeader('X-Test', 'bar');

        response.setStatus(200).setBody(
            concat('Hello Pascal! from: ', request.getUri().getPath())
        );

        response.render();

        if (response.getStatus() >= 200) and (response.getStatus() < 300) then
            result := 0
        else
            result := response.getStatus();
    end;

begin
    config := Core.Config.create();
    engine := Core.Engine.create(config);

    halt(engine.run(@handler));
end.