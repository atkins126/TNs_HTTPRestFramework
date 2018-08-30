unit TNsRestFramework.Application.DefaultController;

interface

uses
  TNsRestFramework.Infrastructure.HTTPControllerFactory,
  TNsRestFramework.Infrastructure.HTTPRestRequest,
  TNsRestFramework.Infrastructure.HTTPRouting,
  TNsRestFramework.Infrastructure.HTTPController,
  TNsRestFramework.Infrastructure.Services.Logger;

type
  TRestDefaultController = class(THTTPController)
    public
      constructor Create;
      function ProcessRequest(Request : THTTPRestRequest) : Cardinal; override;
  end;

var
  DefaultController : IController;

implementation


{ TMVCDefaultController }

constructor TRestDefaultController.Create;
begin
  inherited;
  fisdefault := True;
  froute.Name := 'default';
  froute.IsDefault := True;
  froute.RelativePath := '/';
  froute.AddMethod('GET');
  froute.AddMethod('POST');
end;

function TRestDefaultController.ProcessRequest(Request: THTTPRestRequest): Cardinal;
begin
  Logger.Info('/default called');
  Request.ResponseInfo.ContentText := 'Hello World';
  Result := 200;
end;

initialization
  DefaultController := TRestDefaultController.Create;
  THTTPControllerFactory.Init;
  THTTPControllerFactory.GetInstance.Add(DefaultController);

end.



