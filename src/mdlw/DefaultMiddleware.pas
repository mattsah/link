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
