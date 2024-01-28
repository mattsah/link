constructor Query.create();
begin
    self._parameters := Http.Parameters.create();
end;


constructor Query.createFromString(query: string);
var
    queryPos: integer;
    queryParts: TStringArray;
    parameterPos: integer;
begin
    self.create();

    if (query <> '') then
    begin
        queryParts := query.split('&');
        for queryPos := 0 to (length(queryParts) - 1) do;
        begin
            parameterPos := queryParts[queryPos].indexOf('=');

            if (parameterPos <> -1) then
            begin
                self.addParameter(
                    queryParts[queryPos].substring(0, parameterPos),
                    queryParts[queryPos].substring(parameterPos + 1)
                );
            end
            else
            begin
                self.addParameter(queryParts[queryPos], '');
            end;
        end;
    end
end;


function Query.addParameter(parameter: string; value: string): Http.Query;
var
    parameterPos: integer;
    values: TStringList;
begin
    parameterPos := self._parameters.indexOf(parameter);

    if (parameterPos = -1) then
    begin
        values       := TStringList.create();
        parameterPos := self._parameters.add(parameter, values);
    end;

    self._parameters.getData(parameterPos).add(value);

    result := self;
end;