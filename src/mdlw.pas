{$mode delphi}{$interfaces corba}{$H+}{$J-}

unit Mdlw;


interface
    uses fgl, Core, Http;


    type
        Runner     = class;
        Middleware = interface;
        Stack      = TFPGList<Mdlw.Middleware>;

    {$include 'mdlw/inc/Runner.pp'}
    {$include 'mdlw/inc/Middleware.pp'}

    DefaultMiddleware = class(TObject, Mdlw.Middleware)
        public
            function handle(request: Http.Request; next: Http.Handler): Http.Response;
        end;

    {$include 'mdlw/inc/Dispatcher.pp'}


implementation
    function DefaultMiddleware.handle(request: Http.Request; next: Http.Handler): Http.Response;
        var
            response: Http.Response;
        begin
            response := next(request);

            response.addHeader('Content-Type', 'text/html');
            response.addHeader('Connection', 'closed');
            response.addHeader('X-Test', 'foo');
            response.addHeader('X-Test', 'bar');

            response.setBody(concat('Hello Pascal! from: ', request.getUri().getPath()));

            result := response;
        end;

    {$include 'mdlw/Runner.pas'}
    {$include 'mdlw/Dispatcher.pas'}
end.