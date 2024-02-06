{
    The engine is the core of the application
}
Engine = class
    private
        _config: Core.Config;
        _delegates: TFPGMap<String, Core.Delegate>;

    public
        {
            Create a new application engine by passing in the configuraiton
        }
        constructor create(var config: Core.Config);

        {
            Get a new or shared instance of an object, by class or interface name
        }
        function get<T: class>(): T;

        {
            Run the application engine
        }
        function run(handler: Core.Handler): integer;

    end;
