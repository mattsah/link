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
        procedure render(); virtual;

        {
            Add a header to the Message
        }
        function addHeader(header: string; value: string): Http.Message; virtual;

        {
            Delete a header to the Message
        }
        function delHeader(header: string; value: string = ''): Http.Message; virtual;

        {
            Set the body of the Message
        }
        function setBody(content: string): Http.Message; virtual;

        {
            Set a header on the Message (wiping out the previous value)
        }
        function setHeader(header: string; value: string): Http.Message; virtual;
    end;