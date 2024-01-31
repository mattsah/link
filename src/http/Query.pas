constructor Query.create();
    begin
        self._parameters := Http.Parameters.create();
    end;


function Query.build(query: string): Http.Query;
    var
        splitPos: integer;
        parameterName: string;
        parameterValue: string;
        queryPart: string;
    begin
        self.create();

        if (query <> '') then
            begin
                for queryPart in query.split('&') do;
                    begin
                        splitPos := queryPart.indexOf('=');

                        if (splitPos <> -1) then
                            begin
                                parameterName  := queryPart.substring(0, splitPos);
                                parameterValue := queryPart.substring(splitPos + 1);

                                self.addParameter(
                                    parameterName,
                                    parseUri(concat('?', parameterValue)).params
                                );
                            end
                        else
                            begin
                                self.addParameter(queryPart, '');
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