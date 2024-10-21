unit UnitRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  TFormRelatorio = class(TForm)
    QuickRepTimes: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBTextNomeDoTime: TQRDBText;
    QRDBTextCodigo: TQRDBText;
    QRDBTextUltimoTitulo: TQRDBText;
    QRDBTextCorCamisa: TQRDBText;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    TblTimes: TADOTable;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBTextCidadeOrigem: TQRDBText;
    QRDBTextEstadoOrigem: TQRDBText;
    QRDBTextPricipalTorcida: TQRDBText;
    QRDBTextPossuiEstado: TQRDBText;
    QRDBTextDataDeInscricao: TQRDBText;
    QRSysDataPagina: TQRSysData;
    QRSysDataDataSistema: TQRSysData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

procedure TFormRelatorio.FormCreate(Sender: TObject);
begin
   DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
