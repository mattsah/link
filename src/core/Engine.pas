constructor Engine.create(var config: Core.Config);
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
    response.addHeader('X-Test', 'bar');

    response.setStatus(200).setBody(concat('Hello Pascal! from: ', getEnv('PATH_INFO')));

    response.render();

    result := 0;
end;
