unit UnitBuscaNome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFormBuscaNome = class(TForm)
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
    EditNome: TEdit;
    procedure BitBtnSairClick(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuscaNome: TFormBuscaNome;

implementation

{$R *.dfm}

procedure TFormBuscaNome.BitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormBuscaNome.EditNomeChange(Sender: TObject);
begin
  TBLTimes.Locate ('NomeDoTime', EditNome.Text, [loPartialKey]);
end;

procedure TFormBuscaNome.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EditNome.Clear;
  TBLTimes.Active:=False;
end;

procedure TFormBuscaNome.FormShow(Sender: TObject);
begin
  TBLTimes.Active:=True;
end;

procedure TFormBuscaNome.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
