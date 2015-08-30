unit principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  disciplinas;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnIncluirDisciplinas: TButton;
    btnLimparCampos: TButton;
    btnSair: TButton;
    Label1: TLabel;
    lblSituacao: TLabel;
    txtSituacao: TEdit;
    txtNome: TEdit;
    txtCPF: TEdit;
    txtMatricula: TEdit;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblMatricula: TLabel;
    procedure btnIncluirDisciplinasClick(Sender: TObject);
    procedure btnLimparCamposClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  nome:         string;
  cpf:          string;
  matricula:    integer;
  periodo:      integer;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  periodo := 4; // não sei de onde saiu essa informação no enunciado, colocando manualmente
end;

procedure TfrmPrincipal.btnLimparCamposClick(Sender: TObject);
begin
  txtNome.Text      := '';
  txtCPF.Text       := '';
  txtMatricula.Text := '';
  txtSituacao.Text  := '';
end;

procedure TfrmPrincipal.btnIncluirDisciplinasClick(Sender: TObject);
begin
  if (txtNome.Text = '') or (txtCPF.Text = '') or (txtMatricula.Text = '') then
  begin
    ShowMessage('Todos os campos devem ser preenchidos.');
  end
  else if (length(txtMatricula.Text) < 5) then
  begin
    ShowMessage('A matrícula deve ter 5 algarismos.');
  end
  else
  begin
    nome      := txtNome.Text;
    cpf       := txtCPF.Text;
    matricula := StrToInt(txtMatricula.Text);
    // os campos de texto no segundo form devem ser setados
    // antes dele ser chamado
    frmDisciplinas.txtNome.Text := nome;
    frmDisciplinas.txtCPF.Text  := cpf;
    frmDisciplinas.ShowModal();
  end;
end;

end.

