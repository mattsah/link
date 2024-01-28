constructor Query.create();
    begin
        self._parameters := Http.Parameters.create();
    end;


function Query.build(query: string): Http.Query;
    var
        splitPos: integer;
        queryPos: integer;
        queryParts: TStringArray;
        parameterName: string;
        parameterValue: string;
    begin
        self.create();

        if (query <> '') then
            begin
                queryParts := query.split('&');
                for queryPos := 0 to (length(queryParts) - 1) do;
                    begin
                        splitPos := queryParts[queryPos].indexOf('=');

                        if (splitPos <> -1) then
                            begin
                                parameterName  := queryParts[queryPos].substring(0, splitPos);
                                parameterValue := queryParts[queryPos].substring(splitPos + 1);

                                self.addParameter(
                                    parameterName,
                                    parseUri(concat('?', parameterValue)).params
                                );
                            end
                        else
                            begin
                                self.addParameter(queryParts[queryPos], '');
                            end;
                    end;
            end;

        result := self;
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