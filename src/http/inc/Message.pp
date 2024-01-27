type
    {
        Messages contain the core pieces of the HTTP protocol, headers, body, etc...
    }
    Message = class

    private
        _headers: Http.Headers;
        _body: string;

    public
        {
            Create a new Message
        }
        constructor create();

        {
            Render the Message to standard output
        }
        procedure render();

        {
            Add a header to the Message
        }
        function addHeader(header, value: string): Http.Message;

        {
            Set the body of the Message
        }
        function setBody(content: string): Http.Message;
    end;