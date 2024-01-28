procedure Response.render();
    begin
        writeln('Status', ':', self._status);

        inherited render();
    end;

function Response.getStatus(): integer;
    begin
        result := self._status;
    end;

function Response.setStatus(code: integer): Http.Response;
    begin
        self._status := code;
        result       := self;
    end;