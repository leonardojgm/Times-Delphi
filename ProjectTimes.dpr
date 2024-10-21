program ProjectTimes;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadastrarTime in 'UnitCadastrarTime.pas' {FormCadastrarTime},
  UnitAutorInformacoes in 'UnitAutorInformacoes.pas' {FormAutorInformacoes},
  UnitValorCache in 'UnitValorCache.pas' {FormValorCache},
  UnitVerificarConfirmacoes in 'UnitVerificarConfirmacoes.pas' {FormVerificarConfirmacoes},
  UnitModificarTime in 'UnitModificarTime.pas' {FormModificarTime},
  UnitApagarTime in 'UnitApagarTime.pas' {FormApagarTime},
  UnitBuscaNome in 'UnitBuscaNome.pas' {FormBuscaNome},
  UnitBuscaCodigo in 'UnitBuscaCodigo.pas' {FormBuscaCodigo},
  UnitRelatorio in 'UnitRelatorio.pas' {FormRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Times CBF';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadastrarTime, FormCadastrarTime);
  Application.CreateForm(TFormAutorInformacoes, FormAutorInformacoes);
  Application.CreateForm(TFormValorCache, FormValorCache);
  Application.CreateForm(TFormVerificarConfirmacoes, FormVerificarConfirmacoes);
  Application.CreateForm(TFormModificarTime, FormModificarTime);
  Application.CreateForm(TFormApagarTime, FormApagarTime);
  Application.CreateForm(TFormBuscaNome, FormBuscaNome);
  Application.CreateForm(TFormBuscaCodigo, FormBuscaCodigo);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.Run;
end.
