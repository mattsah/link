{
    The engine is the core of the application
}
Engine = class
    private
        _config: Core.Config;
        _context: TRttiContext;
        _factories: Core.Factories;
        _singletons: Core.Singletons;

        {

        }
        function make(classType: TClass): TObject;

    public
        {
            Create a new application engine by passing in the configuraiton
        }
        constructor create(var config: Core.Config);

        {

        }
        function delegate(className: string; factory: Core.Factory): Core.Engine;

        {
            Get a new or shared instance of an object, by class or interface name
        }
        function get(identity: string): TObject;

        {
            Run the application engine
        }
        function run(handler: Core.Handler): integer;

        {

        }
        function share(instance: TObject): Core.Engine;
    end;
