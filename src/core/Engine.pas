constructor Engine.create(var config: Core.Config);
    begin
        self._config    := config;
        self._context   := TRttiContext.create();
        self._factories := Core.Factories.create();

        self._config.setEngine(self);
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.delegate(className: string; factory: Core.Factory): Core.Engine;
    begin
        self._factories.add(lowerCase(className), factory);

        result := self;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.get<T>(): T;
    var
        className: string;
        regPos: integer;
    begin
        className := lowerCase(format('%s.%s', [T.unitName, T.className]));
        regPos    := self._factories.indexOf(className);

        if (regPos >= 0) then
            begin
                result := T(self._factories.getData(regPos).getInstance(self));
            end
        else
            begin
                result := T(self.make(T));
            end;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.make(T: TClass): TObject;
    var
        classType: TRttiType;
        construct: TRttiMethod;
        argument: TRttiParameter;
    begin
        classType := self._context.getType(T);
        construct := classType.getMethod('create');

        if (construct <> nil) then
            begin
                for argument in construct.getParameters() do
                    begin
                        writeln(stderr, argument.name);
                    end;

                result := construct.invoke(T, []).asObject();
            end
        else
            begin
                result := T.create();
            end;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.run(handler: Core.Handler): integer;
    begin
        result := handler(self);
    end;
