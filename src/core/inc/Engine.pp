type
    {
        The engine is the core of the application
    }
    Engine = class

    private
        _config: Config;
        _delegates: specialize TFPGMap<String, Delegate>;

    public
        {
            Create a new application engine by passing in the configuraiton
        }
        constructor create(var config: Config);

        {
            Get a new or shared instance of an object, by class or interface name
        }
        function get(symbol: string): TObject;

        {
            Run the application engine
        }
        function run(): integer;

     end;
