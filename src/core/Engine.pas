////////////////////////////////////////////////////////////////////////////////////////////////////
// PUBLIC
////////////////////////////////////////////////////////////////////////////////////////////////////

constructor Engine.create(var config: Core.Config);
    begin
        self._config     := config;
        self._context    := TRttiContext.create();
        self._factories  := Core.Factories.create();
        self._singletons := Core.Singletons.create();

        self._config.setEngine(self);
        self.share(self);
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.delegate(className: string; factory: Core.Factory): Core.Engine;
    begin
        self._factories.add(lowerCase(className), factory);

        result := self;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.get(identity: string): TObject;
    var
        regPos: integer;
    begin
        identity := identity.toLower();
        regPos   := self._singletons.indexOf(identity);

        if (regPos >= 0) then
            begin
                result := self._singletons.getData(regPos);
            end
        else
            begin
                regPos := self._factories.indexOf(identity);

                if (regPos >= 0) then
                    begin
                        result := self._factories.getData(regPos).getInstance(self);
                    end
                else
                    begin
                        result    := self.make(Core.registry.getData(Core.registry.indexOf(identity)));
                    end;
            end;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.run(handler: Core.Handler): integer;
    begin
        result := handler(self);
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.share(instance: TObject): Core.Engine;
    var
        classType: TClass;
        className: string;
    begin
        classType := instance.classType;
        className := lowerCase(format('%s.%s', [classType.unitName, classType.className]));

        self._singletons.add(className, instance);

        result := self;
    end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// PRIVATE
////////////////////////////////////////////////////////////////////////////////////////////////////

function Engine.make(classType: TClass): TObject;
    var
        rttiType: TRttiType;
        construct: TRttiMethod;
        argument: TRttiParameter;
    begin
        rttiType  := self._context.getType(classType);
        construct := rttiType.getMethod('create');

        if (construct <> nil) then
            begin
                for argument in construct.getParameters() do
                    begin
                        writeln(stderr, argument.name);
                    end;

                result := construct.invoke(classType, []).asObject();
            end
        else
            begin
                result := classType.create();
            end;
    end;