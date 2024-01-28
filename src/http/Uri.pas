constructor Uri.create();
begin
    self._query := Http.Query.create();
end;


function Uri.getQuery(): Http.Query;
begin
    result := self._query;
end;


function Uri.getPath(): string;
begin
     result := self._path;
end;


function Uri.setPath(path: string): Http.Uri;
begin
    self._path := path;
    result     := self;
end;


function Uri.setQuery(query: Http.Query): Http.Uri;
begin
    self._query := query;
    result      := self;
end;