type
    {

    }
    Uri = class

    private
        _path:  string;
        _query: Http.Query;

    public
        {

        }
        constructor create();

        {

        }
        function getQuery(): Http.Query;

        {

        }
        function setPath(path: string): Http.Uri;

    end;