unit unitAula4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmRegistroGeral }

  TfrmRegistroGeral = class(TForm)
    btnLimpar: TButton;
    btnLer: TButton;
    btnArmazenar: TButton;
    chkCasado: TCheckBox;
    lblSalario: TLabel;
    lblTelefone: TLabel;
    lblControle: TLabel;
    txtControle: TEdit;
    txtSalario: TEdit;
    txtAltura: TEdit;
    lblAltura: TLabel;
    txtCasado: TEdit;
    lblCasado: TLabel;
    lblNome: TLabel;
    txtNome: TEdit;
    lblTitulo: TLabel;
    txtTelefone: TEdit;
    procedure btnArmazenarClick(Sender: TObject);
    procedure btnLerClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure chkCasadoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRegistroGeral: TfrmRegistroGeral;
  nome:     string;
  casado:   boolean;
  altura:   real;
  salario:  currency;
  telefone: integer;

implementation

{$R *.lfm}

{ TfrmRegistroGeral }

procedure TfrmRegistroGeral.chkCasadoChange(Sender: TObject);
begin
  if chkCasado.Checked then
  begin
    txtCasado.Text := 'Sim';
  end
  else
  begin
    txtCasado.Text := 'Não';
  end;
end;

procedure TfrmRegistroGeral.btnLimparClick(Sender: TObject);
begin
     txtNome.Text      := '';
     txtCasado.Text    := 'Não';
     chkCasado.Checked := false;
     txtAltura.Text    := '0';
     txtSalario.Text   := '0';
     txtTelefone.Text  := '0';
end;

procedure TfrmRegistroGeral.btnArmazenarClick(Sender: TObject);
begin
  nome     := txtNome.Text;
  casado   := chkCasado.Checked;
  altura   := StrToFloat(txtAltura.Text);
  salario  := StrToCurr(txtSalario.Text);
  telefone := StrToInt(txtTelefone.Text);
  txtControle.Text := nome;
end;

procedure TfrmRegistroGeral.btnLerClick(Sender: TObject);
begin
  txtNome.Text := nome;
  if Casado then
  begin
    txtCasado.Text := 'Sim';
    chkCasado.Checked := true;
  end
  else
  begin
    txtCasado.Text := 'Não';
    chkCasado.Checked := false;
  end;
  txtAltura.Text   := FloatToStr(altura);
  txtSalario.Text  := CurrToStr(salario);
  txtTelefone.Text := IntToStr(telefone);
end;

end.

