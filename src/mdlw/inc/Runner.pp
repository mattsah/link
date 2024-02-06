{

}
Runner = class
    private
        _runPos: integer;
        _engine: Core.Engine;
        _response: Http.Response;
        _stack: Mdlw.Stack;

    public
        {

        }
        constructor create(var engine: Core.Engine; response: Http.Response);

        {

        }
        function register(middleware: Mdlw.Middleware): Mdlw.Runner;

        {

        }
        function handle(request: Http.Request): Http.Response;

    end;