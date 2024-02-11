{$mode delphi}{$interfaces corba}{$H+}{$M+}{$J-}

unit Mdlw;

interface
    uses fgl, classes, sysutils, Core, Http;


    type
        Runner     = class;
        Middleware = interface;
        Stack      = TFPGList<Mdlw.Middleware>;

    {$include 'mdlw/inc/Runner.pp'}
    {$include 'mdlw/inc/Middleware.pp'}
    {$include 'mdlw/inc/DefaultMiddleware.pp'}
    {$include 'mdlw/inc/RunnerFactory.pp'}
    {$include 'mdlw/inc/Dispatcher.pp'}

implementation
    {$include 'mdlw/Runner.pas'}
    {$include 'mdlw/DefaultMiddleware.pas'}
    {$include 'mdlw/RunnerFactory.pas'}
    {$include 'mdlw/Dispatcher.pas'}

initialization
    Core.register([
        Mdlw.RunnerFactory,
        Mdlw.DefaultMiddleware
    ]);

end.

