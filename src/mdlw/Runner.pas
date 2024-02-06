constructor Runner.create(var engine: Core.Engine; response: Http.Response);
    begin
        self._runPos   := -1;
        self._engine   := engine;
        self._response := response;
        self._stack    := Mdlw.Stack.create()
    end;

function Runner.handle(request: Http.Request): Http.Response;
    var
        mdlware: Mdlw.Middleware;
    begin
        self._runPos := self._runPos + 1;

        if (self._runPos < self._stack.count) then
            begin
                mdlware := self._stack[self._runPos];
                result  := mdlware.handle(request, self.handle);
            end
        else
            begin
                result := self._response.setStatus(200);
            end;
    end;

function Runner.register(middleware: Mdlw.Middleware): Mdlw.Runner;
    begin
        self._stack.add(middleware);

        result := self;
    end;
