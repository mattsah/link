{

}
Middleware = interface
    {

    }
    function handle(request: Http.Request; next: Http.Handler): Http.Response; virtual;

    end;