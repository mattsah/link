constructor Request.create();
begin
    self._uri := Http.Uri.create();

    inherited create();
end;

function Request.getUri(): Http.Uri;
begin
    result := self._uri;
end;