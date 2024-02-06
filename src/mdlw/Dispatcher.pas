function Dispatcher(var engine: Core.Engine): integer;
    var
        runner: Mdlw.Runner;
        request: Http.Request;
        response: Http.Response;
        test: Mdlw.DefaultMiddleware; // TODO: delete
    begin
        test    := engine.get<Mdlw.DefaultMiddleware>(); // TODO: delete
        runner  := Mdlw.Runner.create(engine, Http.Response.create());
        request := Http.Request.createFromServer();

        runner.register(test); // TODO: delete

        response := runner.handle(request);

        response.render();

        if (response.getStatus() >= 200) and (response.getStatus() < 300) then
            result := 0
        else
            result := response.getStatus();
    end;