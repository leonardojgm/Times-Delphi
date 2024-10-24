unit UnitValorCache;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TFormValorCache = class(TForm)
    Image1: TImage;
    BitBtnCalcular: TBitBtn;
    BitBtnSair: TBitBtn;
    BitBtnLimpar: TBitBtn;
    Label3: TLabel;
    EditQuantidade: TEdit;
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnLimparClick(Sender: TObject);
    procedure BitBtnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Function CalculaCache(QtdTorcedores:Integer):Real;  //Declara��o da fun��o

var
  FormValorCache: TFormValorCache;
  Cache:Real; //Declara��o de variaveis Universais do form
  QuantidadeTorcedores:Integer; //Declara��o de variaveis Universais do form

implementation

{$R *.dfm}

Function CalculaCache(QtdTorcedores:Integer):Real; //Fun��o para calculo do cach�
Var Cach:Real;
Begin
  If (QtdTorcedores<=3000) Then
    Cach:=10*QtdTorcedores //Efetua Calculo do cach� at� 3000
  Else If (QtdTorcedores<=15000) Then
    Cach:=15*QtdTorcedores  //Efetua Calculo do cach� entre 3001 de 15000
  Else If (QtdTorcedores<=80000) Then
    Cach:=18*QtdTorcedores //Efetua Calculo do cach� entre 15001 de 80000
  Else
    Cach:=20*QtdTorcedores; //Efetua Calculo do cach� acima de 80000
  Result:=Cach;  //Retorna o resultado
end;

procedure TFormValorCache.BitBtnSairClick(Sender: TObject);
begin
  Close; //Fecha o formulario
end;

procedure TFormValorCache.BitBtnLimparClick(Sender: TObject);
begin
  EditQuantidade.Clear;  //Limpa o Edit
  EditQuantidade.SetFocus; //Coloca a sele��o no Edit
end;

procedure TFormValorCache.BitBtnCalcularClick(Sender: TObject);
begin
  Try     //tratamento de erro parte 1
    QuantidadeTorcedores:=StrToInt(EditQuantidade.Text); //Se o campo estiver preenchido copia os dados do Edit para a variavel QuantidadeTorcedores
  Except  //tratamento de erro parte 2
    ShowMessage('Digite um valor v�lido!'); //Se o campo n�o estiver preenchido apresenta uma menssagem  de erro
    EditQuantidade.Clear;  //Limpa o Edit
    EditQuantidade.SetFocus; //Coloca a sele��o no Edit
    Exit; // Aborta o Procedimento
  end;    //tratamento de erro parte 3
  Cache:=CalculaCache(QuantidadeTorcedores);  //Executa a fun��o com o valor da variavel QuantidadeTorcedores
  ShowMessage('Valor do Cach�: R$ '+FloatToStrF(Cache,ffnumber,15,2)); //Apresenta uma menssagem com o resultado
  EditQuantidade.Clear;  //Limpa o Edit
  EditQuantidade.SetFocus; //Coloca a sele��o no Edit
end;

procedure TFormValorCache.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFormValorCache.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EditQuantidade.Clear;  //Limpa o Edit
  EditQuantidade.SetFocus; //Coloca a sele��o no Edit
end;

procedure TFormValorCache.FormShow(Sender: TObject);
begin
  Cache:=0.0;  //Inicia a Variavel Zerada
end;

end.
