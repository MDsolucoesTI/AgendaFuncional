//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_fechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TForm_fechamento = class(TForm)
    GBoxData: TGroupBox;
    GBoxTecnico: TGroupBox;
    GroupBox1: TGroupBox;
    GBoxCliente: TGroupBox;
    GBoxEndereco: TGroupBox;
    GroupBox2: TGroupBox;
    GBoxbairro: TGroupBox;
    GBoxsaida: TGroupBox;
    GBoxsaidacli: TGroupBox;
    DBESai_cliente: TDBEdit;
    dbtSaidaLoja: TDBText;
    dbtCliente: TDBText;
    dbtEnder: TDBText;
    dbtComp: TDBText;
    dbtBairro: TDBText;
    dbtNumero: TDBText;
    medtData: TMaskEdit;
    cbTecnico: TComboBox;
    bntLocalizar: TBitBtn;
    btnCancel: TBitBtn;
    btnGravar: TBitBtn;
    Gbtelefone: TGroupBox;
    DBTel: TDBText;
    BitBtn1: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bntLocalizarClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_fechamento: TForm_fechamento;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TForm_fechamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_fechamento.FormShow(Sender: TObject);
begin
  cbTecnico.items.clear;
  dmDados.tb_Tecnico.First;
  While Not dmDados.tb_Tecnico.Eof Do
    Begin
      cbTecnico.Items.Add(dmDados.tb_TecnicoTecnico.Value);
      dmDados.tb_Tecnico.Next;
    End;
  medtData.Text:=DateToStr(Now);
  GBoxData.SetFocus;
end;

procedure TForm_fechamento.bntLocalizarClick(Sender: TObject);
begin
  If (dmDados.Tb_Cadastro.Locate('Data;Tecnico;Abert',
      VarArrayOf([medtData.text,cbTecnico.Text,'A']),[])) Then
    Begin
      dmDados.tb_Cadastro.Edit;
      btnCancel.Enabled:=True;
      btnGravar.Enabled:=True;
      GBoxSaidaCli.SetFocus;
    End
  Else
    Begin
      MessageBox(form_fechamento.Handle,'Informa��o n�o Localizada !!!','Resultado da Localiza��o',MB_ICONWARNING);
      GBoxData.SetFocus;
    End;
end;

procedure TForm_fechamento.btnCancelClick(Sender: TObject);
begin
  dmDados.Tb_cadastro.Cancel;
  btnCancel.Enabled:=False;
  btnGravar.Enabled:=False;
end;

procedure TForm_fechamento.btnGravarClick(Sender: TObject);
begin
  dmDados.Tb_CadastroAbert.Value:='F';
  dmDados.Tb_Cadastro.Post;
  btnCancel.Enabled:=False;
  btnGravar.Enabled:=False;
end;

procedure TForm_fechamento.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
