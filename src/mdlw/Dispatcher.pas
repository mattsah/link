function Dispatcher(var engine: Core.Engine): integer;
    var
        runner: Mdlw.Runner;
        request: Http.Request;
        response: Http.Response;
    begin
        runner  := engine.get<Mdlw.Runner>;
        request := Http.Request.createFromServer();

        runner.register(engine.get<Mdlw.DefaultMiddleware>); // TODO: delete

        response := runner.handle(request);

        response.render();

        if (response.getStatus() >= 200) and (response.getStatus() < 300) then
            result := 0
        else
            result := response.getStatus();
    end;