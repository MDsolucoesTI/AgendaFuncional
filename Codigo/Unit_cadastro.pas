
//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_cadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TForm_Cadastro = class(TForm)
    GBoxData: TGroupBox;
    DBEdata: TDBEdit;
    GBoxTecnico: TGroupBox;
    GBoxSaidaloja: TGroupBox;
    DBESaidaloja: TDBEdit;
    GBoxCliente: TGroupBox;
    DBECliente: TDBEdit;
    GBoxEndereco: TGroupBox;
    DBEEndereco: TDBEdit;
    GBoxnumero: TGroupBox;
    DBEnumero: TDBEdit;
    GBoxcompl: TGroupBox;
    DBEcompl: TDBEdit;
    GBoxbairro: TGroupBox;
    DBEBairro: TDBEdit;
    DBNavigator1: TDBNavigator;
    dblkTecnico: TDBLookupComboBox;
    Gbtelefone: TGroupBox;
    DBETel: TDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cadastro: TForm_Cadastro;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TForm_Cadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_Cadastro.FormShow(Sender: TObject);
begin
  dmDados.Tb_Cadastro.Append;
  dmDados.Tb_cadastroData.Value:=Now;
  dmDados.Tb_CadastroAbert.Value:='A';
end;

procedure TForm_Cadastro.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  If Button in [nbPost] Then
    Close;
  If Button in [nbCancel] Then
    Close;
end;

end.
