RunnerFactory = class(TObject, Core.Factory)
    public
        function getInstance(var engine: Core.Engine): TObject;

    end;