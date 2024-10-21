unit UnitBuscaCodigo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Mask;

type
  TFormBuscaCodigo = class(TForm)
    DBGrid1: TDBGrid;
    BitBtnSair: TBitBtn;
    Image2: TImage;
    TblTimes: TADOTable;
    TblTimesNomeDoTime: TWideStringField;
    TblTimesCodigo: TWideStringField;
    TblTimesUltimoTitulo: TWideStringField;
    TblTimesCorCamisa: TWideStringField;
    TblTimesCidadeOrigem: TWideStringField;
    TblTimesEstadoOrigem: TWideStringField;
    TblTimesPricipalTorcida: TWideStringField;
    TblTimesPossuiEstadio: TWideStringField;
    TblTimesDataDeInscricao: TDateTimeField;
    DataSource1: TDataSource;
    Label3: TLabel;
    EditCodigo: TEdit;
    procedure BitBtnSairClick(Sender: TObject);
    procedure EditCodigoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuscaCodigo: TFormBuscaCodigo;

implementation

{$R *.dfm}

procedure TFormBuscaCodigo.BitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormBuscaCodigo.EditCodigoChange(Sender: TObject);
begin
  TBLTimes.Locate ('Codigo', EditCodigo.Text, [loPartialKey]);
end;

procedure TFormBuscaCodigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EditCodigo.Clear;
  TBLTimes.Active:=False;
end;

procedure TFormBuscaCodigo.FormShow(Sender: TObject);
begin
  TBLTimes.Active:=True;
end;

procedure TFormBuscaCodigo.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
