program projClients;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmClient},
  uDmConnection in 'uDmConnection.pas' {dmConnection: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uCustomer in 'uCustomer.pas' {frmCustomer},
  ViaCEP.Core in 'ViaCEP.Core.pas',
  ViaCEP.Intf in 'ViaCEP.Intf.pas',
  ViaCEP.Model in 'ViaCEP.Model.pas',
  InscricaoFiscal in 'InscricaoFiscal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Customers';
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TfrmClient, frmClient);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.Run;
end.
