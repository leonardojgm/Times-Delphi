unit UnitVerificarConfirmacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TFormVerificarConfirmacoes = class(TForm)
    BitBtnVerificar: TBitBtn;
    BitBtnLimpar: TBitBtn;
    BitBtnSair: TBitBtn;
    Image1: TImage;
    Label3: TLabel;
    MaskEditCodigo: TMaskEdit;
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnVerificarClick(Sender: TObject);
    procedure BitBtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Procedure VerificarDigito(Numero:String; Var DigVerificador:Integer); //Declara��o do procedimento

var
  FormVerificarConfirmacoes: TFormVerificarConfirmacoes;
  Codigo,Verificar:String[6];  //Declara��o de variaveis Universais do form
  DigitoVerificador:String[1];  //Declara��o de variaveis Universais do form
  i,DigitoVerificador1:Integer;  //Declara��o de variaveis Universais do form

implementation

{$R *.dfm}

Procedure VerificarDigito(Numero:String; Var DigVerificador:Integer);   //Procedimento para verifica��o do digito verificador do codigo do Time
Var Soma,Peso,Digito,Indice,Cod,DigitoVerif:Integer;
Begin
  Soma:=0; //Inicia a variavel com valor 0
  Peso:=2; //Informa o primeiro multiplicador
  For Indice:=Length(Numero) Downto 1 do  //Deecrementa do Valor do tamanho total do Indice at� o primeiro digito informado
    Begin
      Val (Numero[Indice],Digito,Cod); //Seleciona o digito do indice do codigo informado
      Soma:=Soma+(Digito*Peso); //Efetua a soma da multiplica��o dos 4 digitos por 5,4,3 e 2
      Peso:=Peso+1; //Incrementa o multiplicador em 1
    End;
    DigitoVerif:=Soma Mod 11; // Efetua o calculo para verificar se resto � 1 ou 0
    If (DigitoVerif=0) or (DigitoVerif=1) Then
      DigVerificador:=0    //se o digito obtido for 0 ou 1 o digitoverificador ser� 0
    Else
      DigVerificador:=11-DigitoVerif; //se o digito obtido for diferente de 0 ou 1 o digitoverificador ser� 11 - o digito obtido
End;

procedure TFormVerificarConfirmacoes.BitBtnSairClick(Sender: TObject);
begin
  Close; //Fecha o formulario
end;

procedure TFormVerificarConfirmacoes.BitBtnVerificarClick(Sender: TObject);
begin
  Codigo:=MaskEditCodigo.Text; //Coloca os dados da MaskEdit em uma variavel
  i:=Length(Codigo); //Gera o indice com o tamanho do codigo
  Verificar:=Copy(Codigo,1,i-2); //Seleciona somente o numero do codigo informado
  VerificarDigito(Verificar,DigitoVerificador1); //Executa o procedimento informando o numero informado e retornando um numero inteiro
  STR(DigitoVerificador1,DigitoVerificador); //Transforma o numero inteiro obtido em string
  Verificar:=Verificar+'-'+DigitoVerificador; //Junta o digito verificador gerado com o numero copiado
  MaskEditCodigo.Text:=Verificar;
  If Verificar=Codigo Then //Compara o numero gerado com o numero informado
    Showmessage('O Codigo '+Codigo+' � V�lido') //Apresenta uma menssage se o codigo for v�lido
  Else
    Showmessage('O Codigo '+Codigo+' � Inv�lido'); //Apresenta uma menssage se o codigo for inv�lido
  MaskEditCodigo.Clear;  //Limpa o MaskEdit
  MaskEditCodigo.SetFocus; //Coloca a sele��o no MaskEdit
end;

procedure TFormVerificarConfirmacoes.BitBtnLimparClick(Sender: TObject);
begin
  MaskEditCodigo.Clear;  //Limpa o MaskEdit
  MaskEditCodigo.SetFocus; //Coloca a sele��o no MaskEdit
end;

procedure TFormVerificarConfirmacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MaskEditCodigo.Clear;  //Limpa o MaskEdit
  MaskEditCodigo.SetFocus; //Coloca a sele��o no MaskEdit
end;

procedure TFormVerificarConfirmacoes.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
