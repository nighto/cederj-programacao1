unit unitAula1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmPrimeiro }

  TfrmPrimeiro = class(TForm)
    btnLimpar: TButton;
    btnPreencher: TButton;
    txtCaixa: TEdit;
    lblLabel1: TLabel;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPreencherClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmPrimeiro: TfrmPrimeiro;

implementation

{$R *.lfm}

{ TfrmPrimeiro }

procedure TfrmPrimeiro.btnLimparClick(Sender: TObject);
begin
  txtCaixa.Text := '';
end;

procedure TfrmPrimeiro.btnPreencherClick(Sender: TObject);
begin
  txtCaixa.Text := 'A propriedade txtCaixa foi preenchida em tempo de execução.';
end;

end.

