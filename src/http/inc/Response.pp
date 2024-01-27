type
    {

    }
    Response = class(Http.Message)

    private
        _status: integer;

    public
        {
            Render the Response to standard output (overloads Message)
        }
        procedure render(); override;

        {
            Get the status code of the Response
        }
        function getStatus(): integer;

        {
            Set the status code of the Response
        }
        function setStatus(code: integer): Http.Response;

    end;