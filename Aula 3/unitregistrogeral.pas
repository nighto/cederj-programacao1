unit unitRegistroGeral;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmRegistroGeral }

  TfrmRegistroGeral = class(TForm)
    btnArmazenar: TButton;
    btnLimpar: TButton;
    btnLer: TButton;
    lblNome: TLabel;
    lblMatricula: TLabel;
    lblEndereco: TLabel;
    lblIdade: TLabel;
    lblNome1: TLabel;
    txtMatricula: TEdit;
    txtNome: TEdit;
    txtEndereco: TEdit;
    txtIdade: TEdit;
    txtDataDeNascimento: TEdit;
    lblTitulo: TLabel;
    procedure btnArmazenarClick(Sender: TObject);
    procedure btnLerClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure lblMatriculaClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRegistroGeral: TfrmRegistroGeral;
  intMatricula: integer;
  strNome: string;
  bytIdade: byte;
  strEndereco: string;
  dtmNascimento: TDateTime;


implementation

{$R *.lfm}

{ TfrmRegistroGeral }

procedure TfrmRegistroGeral.btnArmazenarClick(Sender: TObject);
begin
  intMatricula  := StrToInt(txtMatricula.Text);
  strNome       := txtNome.Text;
  strEndereco   := txtEndereco.Text;
  bytIdade      := StrToInt(txtIdade.Text);
  dtmNascimento := StrToDate(txtDataDeNascimento.Text);
end;

procedure TfrmRegistroGeral.btnLerClick(Sender: TObject);
begin
  txtMatricula.Text := IntToStr(intMatricula);
  txtNome.Text      := strNome;
  txtEndereco.Text  := strEndereco;
  txtIdade.Text     := IntToStr(bytIdade);
  txtDataDeNascimento.Text := DateToStr(dtmNascimento);
end;

procedure TfrmRegistroGeral.btnLimparClick(Sender: TObject);
begin
  txtMatricula.Text := '';
  txtNome.Text      := '';
  txtEndereco.Text  := '';
  txtIdade.Text     := '';
  txtDataDeNascimento.Text := '';
end;

procedure TfrmRegistroGeral.lblMatriculaClick(Sender: TObject);
begin

end;

end.

