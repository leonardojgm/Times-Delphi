unit UnitAutorInformacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TFormAutorInformacoes = class(TForm)
    Image1: TImage;
    BitBtnSair: TBitBtn;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure BitBtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAutorInformacoes: TFormAutorInformacoes;

implementation

{$R *.dfm}

procedure TFormAutorInformacoes.BitBtnSairClick(Sender: TObject);
begin
  Close; //Fecha o formulario
end;

procedure TFormAutorInformacoes.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
