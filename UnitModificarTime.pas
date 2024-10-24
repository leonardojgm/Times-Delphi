unit UnitModificarTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCadastrarTime, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls, Mask,
  Buttons, jpeg;

type
  TFormModificarTime = class(TFormCadastrarTime)
    DBNavigator1: TDBNavigator;
    procedure BitBtnCadastrarClick(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModificarTime: TFormModificarTime;

implementation

{$R *.dfm}

procedure TFormModificarTime.BitBtnCadastrarClick(Sender: TObject);
begin
  If TBLTimes.State = dsEdit // Se ouve alguma modifica��o nos Edits
  Then If (DBEdit1.Text='') Then //Verifica se os Edit de Nome do Time esta vazio
    Begin
      ShowMessage('Favor verificar se o Nome do time foi digitado!');
      DBEdit1.SetFocus;
    End
  Else if (DBEdit2.Text='    - ') Then //Verifica se os MaskEdit do C�digo esta vazio
    Begin
      ShowMessage('Favor verificar se o C�digo foi digitado!');
      DBEdit2.SetFocus;
    End
  Else
    Begin
      TBLTimes.Post; // Atualiza o registro atual do BD
      ShowMessage('Moficado com sucesso!');
      TBLTimes.Active:=False;
      TBLTimes.Active:=True;
    End;
end;

procedure TFormModificarTime.BitBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormModificarTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If TBLTimes.State = dsEdit // Se ouve alguma modifica��o nos Edits
  Then If MessageDlg ('Salvar modifica��es?', mtConfirmation, mbOkCancel,0) = mrOk
  Then If (DBEdit1.Text='') Then //Verifica se os Edit de Nome do Time esta vazio
    Begin
      ShowMessage('Favor verificar se o Nome do time foi digitado!');
      DBEdit1.SetFocus;
      Abort;
    End
  Else if (DBEdit2.Text='    - ') Then //Verifica se os MaskEdit do C�digo esta vazio
    Begin
      ShowMessage('Favor verificar se o C�digo foi digitado!');
      DBEdit2.SetFocus;
      Abort;
    End
  Else
    Begin
      TBLTimes.Post; //Salva o registro atual na base de dados do ADOTable
      ShowMessage('Modificado com sucesso!');
    End;
  TBLTimes.Cancel; //Cancela as modifica��es feitas na base de dados do ADOTable atrav�s do formul�rio e limpa os campos
  TBLTimes.Active:=False; //Desativa a base de dados do ADOTable
end;

procedure TFormModificarTime.BitBtnLimparClick(Sender: TObject);
begin
If TBLTimes.State = dsEdit
  Then If MessageDlg ('Desfazer modifica��es n�o salvas?', mtConfirmation, mbOkCancel,0) = mrOk
	Then
    Begin
      TBLTimes.Cancel;
      ShowMessage('Mofica��es desfeitas!');
      DBEdit1.SetFocus;
    End;
end;

procedure TFormModificarTime.FormShow(Sender: TObject);
begin
  TBLTimes.Active:=True;
end;

procedure TFormModificarTime.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.


