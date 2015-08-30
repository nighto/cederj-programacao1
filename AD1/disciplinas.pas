unit disciplinas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmDisciplinas }

  TfrmDisciplinas = class(TForm)
    btnLimparDisciplinas: TButton;
    Button1: TButton;
    txtMat1: TEdit;
    txtMat2: TEdit;
    txtMat3: TEdit;
    lblSubtitulo: TLabel;
    lblCPF: TLabel;
    txtCPF: TEdit;
    lblTitulo: TLabel;
    lblNome: TLabel;
    txtNome: TEdit;
    procedure btnLimparDisciplinasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmDisciplinas: TfrmDisciplinas;

implementation

uses principal;

{$R *.lfm}

{ TfrmDisciplinas }

procedure TfrmDisciplinas.FormCreate(Sender: TObject);
begin
  txtNome.Text := nome;
  txtCPF.Text  := cpf;
end;

procedure TfrmDisciplinas.btnLimparDisciplinasClick(Sender: TObject);
begin
  txtMat1.Text := '';
  txtMat2.Text := '';
  txtMat3.Text := '';
end;

function verificarDisciplinaPorPeriodo(codigoDisciplina:string; periodo:integer):boolean;
var
  strNumDisciplina: string;
  numDisciplina: integer;
begin
  strNumDisciplina := Copy(codigoDisciplina, 3, 3);
  if TryStrToInt(strNumDisciplina, numDisciplina) then
  begin
    // periodo+1*100 = 500 para 4º periodo por exemplo
    if ( numDisciplina < ( (periodo+1)*100 ) ) then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
    end;
  end
  else
  begin
    ShowMessage('Código de disciplina inválido.');
    Result := false;
  end;
end;

procedure TfrmDisciplinas.Button1Click(Sender: TObject);
begin
  if ( (txtMat1.Text = '') and (txtMat2.Text = '') and (txtMat3.Text = '') )then
  begin
    ShowMessage('Entre pelo menos um código de disciplina.');
  end
  else if (
            ( (txtMat1.Text <> '') and ( length(txtMat1.Text) < 5 ) ) or
            ( (txtMat2.Text <> '') and ( length(txtMat2.Text) < 5 ) ) or
            ( (txtMat3.Text <> '') and ( length(txtMat3.Text) < 5 ) )
          )
  then
  begin
    ShowMessage('Os códigos de disciplina devem ter 5 algarismos.');
  end
  else if (
            ( (txtMat1.Text <> '') and ( Copy(txtMat1.Text, 1, 2) <> 'SI' ) ) or
            ( (txtMat2.Text <> '') and ( Copy(txtMat2.Text, 1, 2) <> 'SI' ) ) or
            ( (txtMat3.Text <> '') and ( Copy(txtMat3.Text, 1, 2) <> 'SI' ) )
          )
  then
  begin
    ShowMessage('Os códigos de disciplina devem começar com "SI" e ter mais 3 algarismos.');
  end
  else
  begin
    // finalmente, verificamos se os códigos são válidos, se preenchidos.
    if (
         ( (txtMat1.Text = '') or verificarDisciplinaPorPeriodo(txtMat1.Text, periodo) ) and
         ( (txtMat2.Text = '') or verificarDisciplinaPorPeriodo(txtMat2.Text, periodo) ) and
         ( (txtMat3.Text = '') or verificarDisciplinaPorPeriodo(txtMat3.Text, periodo) )
       )
    then
    begin
      // pelo menos um não válido.
      frmPrincipal.txtSituacao.Text := 'Matrícula Autorizada';
      frmDisciplinas.Close();
    end
    else
    begin
      // todos válidos
      frmPrincipal.txtSituacao.Text := 'Matrícula Não Autorizada';
      frmDisciplinas.Close();
    end;
  end;
end;

end.

