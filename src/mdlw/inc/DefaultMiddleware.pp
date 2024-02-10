DefaultMiddleware = class(TObject, Mdlw.Middleware)
    public
        function handle(request: Http.Request; next: Http.Handler): Http.Response;

    end;