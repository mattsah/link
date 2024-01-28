type
    {
        Delegates are responsible for building new instances, they are registered in the
    }
    Delegate = interface
        {
            Get the instance from the delegate
        }
        function getInstance(var engine: Core.Engine): TObject;

        end;
