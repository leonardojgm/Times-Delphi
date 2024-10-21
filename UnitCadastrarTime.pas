unit UnitCadastrarTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TFormCadastrarTime = class(TForm)
    BitBtnCadastrar: TBitBtn;
    BitBtnLimpar: TBitBtn;
    BitBtnSair: TBitBtn;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image1: TImage;
    TblTimes: TADOTable;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBComboBox1: TDBComboBox;
    TblTimesCodigo: TWideStringField;
    TblTimesNomeDoTime: TWideStringField;
    TblTimesUltimoTitulo: TWideStringField;
    TblTimesCorCamisa: TWideStringField;
    TblTimesCidadeOrigem: TWideStringField;
    TblTimesEstadoOrigem: TWideStringField;
    TblTimesPricipalTorcida: TWideStringField;
    TblTimesPossuiEstadio: TWideStringField;
    TblTimesDataDeInscricao: TDateTimeField;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnCadastrarClick(Sender: TObject);
    procedure BitBtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastrarTime: TFormCadastrarTime;

implementation

{$R *.dfm}

procedure TFormCadastrarTime.BitBtnSairClick(Sender: TObject);
begin
  Close; //Fecha o formulario
end;

procedure TFormCadastrarTime.BitBtnCadastrarClick(Sender: TObject);
begin
  If (DBEdit1.Text='') Then //Verifica se os Edits de Nome do Time e Codigo estão vazios
    Begin
      ShowMessage('Favor verificar se o Nome do time foi digitado!');
      DBEdit1.SetFocus;
    End
  Else if (DBEdit2.Text='    - ') Then
    Begin
      ShowMessage('Favor verificar se o Código foi digitado!');
      DBEdit2.SetFocus;
    End
  Else
    Begin
	    TBLTimes.Post; //Salva o registro atual na base de dados do ADOTable
      ShowMessage('Cadastrado com sucesso!');
      TBLTimes.Append; //Cria um novo Registro em Branco na base de dados do ADOTable
    End
end;

procedure TFormCadastrarTime.BitBtnLimparClick(Sender: TObject);
begin
  If (DBEdit1.Text<>'') or (DBEdit2.Text<>'    - ') Then //Verifica se o Edit e o MaskEdit de Nome do Time e Código estão vazios
  If MessageDlg ('Salvar modificações?', mtConfirmation, mbOkCancel,0) = mrOk //Mensagem na tela que efetua uma pergunta se deseja salvar as modificações se pressionar ok
  Then
    Begin
        If (DBEdit1.Text='') Then //Verifica se os Edit de Nome do Time esta vazio
          Begin
            ShowMessage('Favor verificar se o Nome do time foi digitado!');
            DBEdit1.SetFocus;
          End
        Else if (DBEdit2.Text='    - ') Then //Verifica se os MaskEdit do Código esta vazio
          Begin
            ShowMessage('Favor verificar se o Código foi digitado!');
            DBEdit2.SetFocus;
          End
        Else
          Begin
	          TBLTimes.Post; //Salva o registro atual na base de dados do ADOTable
            ShowMessage('Cadastrado com sucesso!');
            TBLTimes.Append;
          End;
    End
  Else
    Begin
	    TBLTimes.Cancel;
	    TBLTimes.Append;
      DBEdit1.SetFocus;
    End;
end;

procedure TFormCadastrarTime.FormShow(Sender: TObject);
begin
  TBLTimes.Active:=True; //Ativa a tabela do BD
	TBLTimes.Append; //Cria um novo Registro em Branco no BD
end;

procedure TFormCadastrarTime.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFormCadastrarTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If (DBEdit1.Text<>'') or (DBEdit2.Text<>'    - ') Then //Verifica se o Edit e o MaskEdit de Nome do Time e Código estão vazios
  If MessageDlg ('Salvar modificações?', mtConfirmation, mbOkCancel,0) = mrOk //Mensagem na tela que efetua uma pergunta se deseja salvar as modificações se pressionar ok
  Then
    Begin
        If (DBEdit1.Text='') Then //Verifica se os Edit de Nome do Time esta vazio
          Begin
            ShowMessage('Favor verificar se o Nome do time foi digitado!');
            DBEdit1.SetFocus;
            Abort;
          End
        Else if (DBEdit2.Text='    - ') Then //Verifica se os MaskEdit do Código esta vazio
          Begin
            ShowMessage('Favor verificar se o Código foi digitado!');
            DBEdit2.SetFocus;
            Abort;
          end
        Else
          Begin
	          TBLTimes.Post; //Salva o registro atual na base de dados do ADOTable
            ShowMessage('Cadastrado com sucesso!');
          End;
    End;
  TBLTimes.Cancel; //Cancela as modificações feitas na base de dados do ADOTable através do formulário e limpa os campos
  TBLTimes.Active:=False; //Desativa a base de dados do ADOTable
end;

end.
