unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, jpeg;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ime1: TMenuItem;
    Modificar1: TMenuItem;
    Apagar1: TMenuItem;
    Cadastrar1: TMenuItem;
    Sair1: TMenuItem;
    Busca1: TMenuItem;
    Nome1: TMenuItem;
    Codigo1: TMenuItem;
    Cach1: TMenuItem;
    Valor1: TMenuItem;
    Confirmao1: TMenuItem;
    Verificar1: TMenuItem;
    Informaes1: TMenuItem;
    Autor1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ime2: TMenuItem;
    Busca2: TMenuItem;
    Cach2: TMenuItem;
    Confirmao2: TMenuItem;
    Informaes2: TMenuItem;
    Cadastrar2: TMenuItem;
    Modificar2: TMenuItem;
    Apagar2: TMenuItem;
    Sair2: TMenuItem;
    Autor2: TMenuItem;
    Verificar2: TMenuItem;
    Valor2: TMenuItem;
    Nome2: TMenuItem;
    Cdigo1: TMenuItem;
    Image1: TImage;
    Sair3: TMenuItem;
    Sair4: TMenuItem;
    N1: TMenuItem;
    Relatrio1: TMenuItem;
    PrVisualizao1: TMenuItem;
    Impresso1: TMenuItem;
    Relatrio2: TMenuItem;
    PrVisualizao2: TMenuItem;
    Impresso2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Autor1Click(Sender: TObject);
    procedure Valor1Click(Sender: TObject);
    procedure Verificar1Click(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
    procedure Nome1Click(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrVisualizao1Click(Sender: TObject);
    procedure Impresso1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses UnitCadastrarTime, UnitAutorInformacoes, UnitValorCache,
  UnitVerificarConfirmacoes, UnitModificarTime, UnitApagarTime,
  UnitBuscaNome, UnitBuscaCodigo, UnitRelatorio;

{$R *.dfm}

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Close; //Fecha o formulario
end;

procedure TFormPrincipal.Cadastrar1Click(Sender: TObject);
begin
        FormCadastrarTime.showmodal;
end;

procedure TFormPrincipal.Autor1Click(Sender: TObject);
begin
        FormAutorInformacoes.showmodal;
end;

procedure TFormPrincipal.Valor1Click(Sender: TObject);
begin
        FormValorCache.showmodal;
end;

procedure TFormPrincipal.Verificar1Click(Sender: TObject);
begin
        FormVerificarConfirmacoes.showmodal;
end;

procedure TFormPrincipal.Modificar1Click(Sender: TObject);
begin
        FormModificarTime.showmodal;
end;

procedure TFormPrincipal.Apagar1Click(Sender: TObject);
begin
  FormApagarTime.showmodal;
end;

procedure TFormPrincipal.Nome1Click(Sender: TObject);
begin
  FormBuscaNome.showmodal;
end;

procedure TFormPrincipal.Codigo1Click(Sender: TObject);
begin
  FormBuscaCodigo.showmodal;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND); //Impede que o form seja movido
end;

procedure TFormPrincipal.PrVisualizao1Click(Sender: TObject);
begin
  FormRelatorio.QuickRepTimes.Preview;
end;

procedure TFormPrincipal.Impresso1Click(Sender: TObject);
begin
  FormRelatorio.QuickRepTimes.Print;
end;

end.
