type
    {

    }
    Request = class(Http.Message)

    private
        _uri: Http.Uri;

    public
        {

        }
        function getUri(): Http.Uri;

    end;