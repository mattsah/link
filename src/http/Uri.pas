constructor Uri.create();
begin
    self._query := Http.Query.create();
end;

function Uri.getQuery(): Http.Query;
begin
    result := self._query;
end;


function Uri.setPath(path: string): Http.Uri;
begin
    self._path := path;
    result     := self;
end;