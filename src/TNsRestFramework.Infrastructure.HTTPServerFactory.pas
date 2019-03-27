unit TNsRestFramework.Infrastructure.HTTPServerFactory;

interface

uses
  TNsRestFramework.Infrastructure.HTTPControllerFactory,
  TNsRestFramework.Infrastructure.HTTPServer,
  TNsRestFramework.Infrastructure.LoggerFactory;

type
  THTTPServerFactory = class
    protected
      fserver : ICustomHTTPServer;
    public
      class procedure Init(Port : Integer);
      class function GetCurrent : ICustomHTTPServer;
      destructor Destroy; override;
  end;

implementation

var
  HTTPServerFactory : THTTPServerFactory;

{ TMonitoringServiceFactory }

destructor THTTPServerFactory.Destroy;
begin
  fserver := nil;
  inherited;
end;

class function THTTPServerFactory.GetCurrent : ICustomHTTPServer;
begin
  if Assigned(HTTPServerFactory) and Assigned(HTTPServerFactory.fserver) then
  Result := HTTPServerFactory.fserver;
end;

class procedure THTTPServerFactory.Init(Port : Integer);
begin
  if not Assigned(HTTPServerFactory) then
  begin
    HTTPServerFactory := THTTPServerFactory.Create;
    HTTPServerFactory.fserver := TCustomHTTPServer.Create(Port);
  end;
end;

initialization
  HTTPServerFactory := nil;

finalization
  if Assigned(HTTPServerFactory) then HTTPServerFactory.Free;
end.
