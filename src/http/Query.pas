constructor Query.create();
begin
    self._parameters := Http.Parameters.create();
end;

function Query.addParameter(parameter: string; value: string): Http.Query;
var
    parameterPos: integer;
    values: TStringList;
begin
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
end;