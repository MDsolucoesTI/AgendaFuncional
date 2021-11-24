//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPesquisa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Buttons;

type
  TfrmPesquisa = class(TForm)
    GroupBox1: TGroupBox;
    dbtSaidaLoja: TDBText;
    GBoxCliente: TGroupBox;
    dbtCliente: TDBText;
    GBoxEndereco: TGroupBox;
    dbtEnder: TDBText;
    GroupBox2: TGroupBox;
    dbtComp: TDBText;
    GBoxbairro: TGroupBox;
    dbtBairro: TDBText;
    GBoxsaida: TGroupBox;
    dbtNumero: TDBText;
    GBoxsaidacli: TGroupBox;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    GroupBox3: TGroupBox;
    DBText2: TDBText;
    Gbtelefone: TGroupBox;
    DBTel: TDBText;
    GBoxData: TGroupBox;
    medtData: TMaskEdit;
    bntLocalizar: TBitBtn;
    GBoxTecnico: TGroupBox;
    cbTempo: TComboBox;
    procedure cbTecnicoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bntLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TfrmPesquisa.cbTecnicoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  medtData.Text:=DateToStr(Now);
end;

procedure TfrmPesquisa.BitBtn1Click(Sender: TObject);
begin
  dmDados.Tb_Pesquisa.Filtered:=False;
  Close;
end;

procedure TfrmPesquisa.bntLocalizarClick(Sender: TObject);
begin
  If (dmDados.Tb_Cadastro.Locate('Data',medtData.text,[])) Then
    Begin
      dmDados.Tb_Pesquisa.Filtered:=False;
      dmDados.Tb_Pesquisa.Filter:='(Data = '''+medtData.Text+''')';
      dmDados.Tb_Pesquisa.Filtered:=True;
    End
  Else
    MessageBox(frmPesquisa.Handle,'Informa��o n�o Localizada !!!','Resultado da Localiza��o',MB_ICONWARNING);

end;

end.
