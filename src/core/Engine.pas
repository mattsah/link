constructor Engine.create(var config: Core.Config);
    begin
        self._config := config;
        self._config.setEngine(self);
    end;

generic function Engine.get<T>(): T;
    begin
        result := T.create();
    end;


function Engine.run(handler: Core.Handler): integer;
    begin
        result := handler(self);
    end;
