type
    {
        Handles HTTP query string functionality
    }
    Query = class

    private
        _parameters: Http.Parameters;

    public
        {
            Create a new Query
        }
        constructor create();

        {

        }
        function build(query: string): Http.Query;

        {
            Add a parameter to the Query.
        }
        function addParameter(parameter: string; value: string): Http.Query;

    end;