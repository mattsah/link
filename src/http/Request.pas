constructor Request.create();
begin
    self._uri := Http.Uri.create();

    inherited create();
end;

constructor Request.createFromServer();
begin
    self.create();

    self._uri.setPath(getEnv('PATH_INFO'));
end;

function Request.getUri(): Http.Uri;
begin
    result := self._uri;
end;

function Request.setUri(uri: Http.Uri): Http.Request;
begin
    self._uri := uri;
    result    := self;
end;