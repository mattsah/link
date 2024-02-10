{
    Factories are responsible for building new instances, they are registered in the
}
Factory = interface
    {
        Get the instance from the factory
    }
    function getInstance(var engine: Core.Engine): TObject;

    end;
