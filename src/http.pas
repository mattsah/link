{$mode objfpc}{$H+}{$J-}

unit Http;


interface
    uses fgl, classes, sysutils;

    type
        Uri        = class;
        Query      = class;
        Message    = class;
        Request    = class;
        Response   = class;
        Headers    = specialize TFPGMap<string, TStringList>;
        Parameters = specialize TFPGMap<string, TStringList>;

    {$include 'http/inc/Uri.pp'}
    {$include 'http/inc/Query.pp'}
    {$include 'http/inc/Message.pp'}
    {$include 'http/inc/Request.pp'}
    {$include 'http/inc/Response.pp'}
implementation
    {$include 'http/Uri.pas'}
    {$include 'http/Query.pas'}
    {$include 'http/Message.pas'}
    {$include 'http/Request.pas'}
    {$include 'http/Response.pas'}
end.
