unit UnitApagarTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TFormApagarTime = class(TForm)
    Image1: TImage;
    Image2: TImage;
    BitBtnSair: TBitBtn;
    BitBtnApagar: TBitBtn;
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
    DBGrid1: TDBGrid;
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormApagarTime: TFormApagarTime;

implementation

{$R *.dfm}

procedure TFormApagarTime.BitBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormApagarTime.BitBtnApagarClick(Sender: TObject);
begin
  If MessageDlg ('Excluir registro?', mtConfirmation, mbOkCancel,0) = mrOk //Messagem na tela que efetua uma pergunta se deseja excluir
	Then
    Begin
      TBLTimes.Delete; // O registro selecionado na tabela é deletado
      ShowMessage('Excluido com sucesso!');
    End;
end;

procedure TFormApagarTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TBLTimes.Active:=False;
end;

procedure TFormApagarTime.FormShow(Sender: TObject);
begin
  TBLTimes.Active:=True;
end;

procedure TFormApagarTime.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
