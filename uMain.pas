unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmConnection, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, uCustomer, ComObj,
  frxClass, frxDBSet;

type
  TfrmClient = class(TForm)
    dsClient: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    cmbSearch: TComboBox;
    SpeedButton7: TSpeedButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure cmbSearchChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}


procedure TfrmClient.cmbSearchChange(Sender: TObject);
begin
  edtSearch.ReadOnly := (cmbSearch.ItemIndex = 0);
end;

procedure TfrmClient.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCustomer, frmCustomer);

  with frmCustomer do
  begin
    dmConnection.fdtClient.Filter := 'id = ' + QuotedStr(IntToStr(dmConnection.fdqSearch.FieldByName('id').AsInteger));
    dmConnection.fdtClient.Filtered := True;
    if dmConnection.fdtClient.Active then
    begin
      dsCustomer.DataSet.Edit;
    end;

    btnExcluir.Visible := True;
    ShowModal;
    dmConnection.fdtClient.Filtered := False;
    dsClient.DataSet.Refresh;
    btnExcluir.Visible := False;
    Free;

  end;
end;

procedure TfrmClient.FormActivate(Sender: TObject);
begin
  if dmConnection.fdqSearch.Active then
    dmConnection.fdqSearch.Close;
  dmConnection.fdqSearch.Open;
end;

procedure TfrmClient.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCustomer, frmCustomer);

  with frmCustomer do
  begin
    if dmConnection.fdtClient.Active then
    begin
      dsCustomer.DataSet.Insert;
    end;

    ShowModal;
    dsClient.DataSet.Refresh;
    Free;
  end;
end;

procedure TfrmClient.SpeedButton4Click(Sender: TObject);
var
  linha, coluna : integer;
  planilha : variant;
  valorcampo : string;
begin

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Rela��o de Clientes';
  planilha.visible := true;

  dsClient.DataSet.First;
  for linha := 0 to dsClient.DataSet.RecordCount - 1 do
  begin
    for coluna := 1 to dsClient.DataSet.FieldCount do
    begin
      valorcampo := dsClient.DataSet.Fields[coluna - 1].AsString;
      planilha.cells[linha + 2,coluna] := valorCampo;
    end;
    dsClient.DataSet.Next;
  end;
  for coluna := 1 to dsClient.DataSet.FieldCount do
  begin
    valorcampo := dsClient.DataSet.Fields[coluna - 1].DisplayLabel;
    planilha.cells[1,coluna] := valorcampo;
  end;
  planilha.columns.Autofit;
end;

procedure TfrmClient.SpeedButton5Click(Sender: TObject);
begin
  if frxReport1.PrepareReport then
    frxReport1.ShowPreparedReport;
end;

procedure TfrmClient.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmClient.SpeedButton7Click(Sender: TObject);
begin
  case cmbSearch.ItemIndex of
    0: begin
      dsClient.DataSet.Filter   := '';
      dsClient.DataSet.Filtered := False;
    end;
    1: begin
      dsClient.DataSet.Filtered := False;
      dsClient.DataSet.Filter   := 'name LIKE ' + QuotedStr( '%' + Trim(edtSearch.Text) + '%' );
      dsClient.DataSet.Filtered := True;
    end;
    2: begin
      dsClient.DataSet.Filtered := False;
      dsClient.DataSet.Filter   := 'municipio LIKE ' + QuotedStr( '%' + Trim(edtSearch.Text) + '%' );
      dsClient.DataSet.Filtered := True;
    end;
    3: begin
      dsClient.DataSet.Filtered := False;
      dsClient.DataSet.Filter   := 'uf LIKE ' + QuotedStr( '%' + uppercase(Trim(edtSearch.Text)) + '%' );
      dsClient.DataSet.Filtered := True;
    end;
  end;
end;

end.