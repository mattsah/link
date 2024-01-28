constructor Engine.create(var config: Core.Config);
    begin
        self._config := config;
        self._config.setEngine(self);
    end;


function Engine.get(symbol: string): TObject;
    begin
        result := findClass(symbol).create();
    end;


function Engine.run(handler: Core.Handler): integer;
    begin
        result := handler();
    end;
