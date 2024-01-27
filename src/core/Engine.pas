constructor Engine.create(var config: Config);
begin
    self._config := config;
    self._config.setEngine(self);
end;


function Engine.get(symbol: string): TObject;
begin
    result := findClass(symbol).create();
end;


function Engine.run(): integer;
var
    response: Http.Response;
begin
    response := Http.Response.create();

    response.addHeader('Content-Type', 'text/html');
    response.addHeader('Connection', 'closed');
    response.addHeader('X-Test', 'foo');

    response.setStatus(200).setBody('<h1>Hello Pascal!</h1>');

    response.render();

    result := 0;
end;
