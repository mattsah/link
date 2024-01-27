constructor Message.create();
begin
    self._headers := Http.Headers.create();
end;


procedure Message.render();
var
    headerPos: integer;
begin
    for headerPos := 0 to (self._headers.count - 1) do;
    begin
        writeln(
            self._headers.getKey(headerPos), ':',
            self._headers.getData(headerPos).delimitedText
        );
    end;

    writeln();
    writeln(self._body);
end;


function Message.addHeader(header, value: string): Http.Message;
var
    headerPos: integer;
    values: TStringList;
begin
    headerPos := self._headers.indexOf(header);

    if (headerPos = -1) then
    begin
        values           := TStringList.create();
        values.delimiter := ';';
        headerPos        := self._headers.add(header, values);
    end;

    self._headers.getData(headerPos).add(value);

    result := self;
end;


function Message.setBody(content: string): Http.Message;
begin
    self._body := content;
    result     := self;
end;