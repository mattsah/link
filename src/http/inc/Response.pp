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
        procedure render();

        {

        }
        function setStatus(code: integer): Http.Response;

    end;