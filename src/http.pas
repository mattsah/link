{$mode objfpc}{$H+}{$J-}

unit Http;


interface
    uses fgl;

    type
        Headers  = specialize TFPGMap<string, string>;
        Message  = class;
        Response = class;

    {$include 'http/inc/Message.pp'}
    {$include 'http/inc/Response.pp'}
implementation
    {$include 'http/Message.pas'}
    {$include 'http/Response.pas'}
end.
