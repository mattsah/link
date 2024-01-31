function Dispatcher(var engine: Core.Engine): integer;
    var
        runner: Mdlw.Runner;
        request: Http.Request;
        response: Http.Response;
        default: Mdlw.DefaultMiddleware; // TODO: delete
    begin
        runner   := Mdlw.Runner.create(engine, Http.Response.create()); // TODO: Replace with engine.get()
        request  := Http.Request.createFromServer();

        default  := Mdlw.DefaultMiddleware.create(); // TODO: delete
        runner.register(default); // TODO: delete

        response := runner.handle(request);

        response.render();

        if (response.getStatus() >= 200) and (response.getStatus() < 300) then
            result := 0
        else
            result := response.getStatus();
    end;