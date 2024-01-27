constructor Message.create();
begin
    self._headers := Headers.create();
end;


procedure Message.render();
var
    headerPos: integer;
begin
    for headerPos := 0 to (self._headers.count - 1) do;
    begin
        writeln(self._headers.getKey(headerPos), ':', self._headers.getData(headerPos));
    end;

    writeln();
    writeln(self._body);
end;


function Message.addHeader(header, value: string): Message;
begin
    self._headers.add(header, value);

    result := self;
end;


function Message.setBody(content: string): Message;
begin
    self._body := content;
    result     := self;
end;