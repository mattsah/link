type
    Middleware = interface
        {

        }
        function handle(request: Http.Request; next: Http.Handler): Http.Response;

        end;