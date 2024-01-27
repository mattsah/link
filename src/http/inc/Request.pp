type
    {

    }
    Request = class(Http.Message)

    private
        _uri: Http.Uri;

    public
        {
            Create a new Request
        }
        constructor create();

        {

        }
        function getUri(): Http.Uri;

    end;