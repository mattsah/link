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
            Create a new Request from the Server Environment
        }
        constructor createFromServer();

        {
            Get the Uri for the Request
        }
        function getUri(): Http.Uri;

        {

        }
        function setUri(uri: Http.Uri): Http.Request;

    end;