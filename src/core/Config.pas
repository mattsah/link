function Config.setEngine(var engine: Core.Engine): Core.Config;
    begin
        self._engine := engine;
        result       := self;
    end;
