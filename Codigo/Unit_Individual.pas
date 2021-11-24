//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_Individual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TForm_Individual = class(TForm)
    GBoxData: TGroupBox;
    medtData: TMaskEdit;
    GBoxTecnico: TGroupBox;
    cbTecnico: TComboBox;
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
    bntLocalizar: TBitBtn;
    rbVisual: TRadioGroup;
    BitBtn1: TBitBtn;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    gbTec2: TGroupBox;
    DBText2: TDBText;
    Gbtelefone: TGroupBox;
    DBTel: TDBText;
    rgFaixa: TRadioGroup;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rbVisualClick(Sender: TObject);
    procedure bntLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Individual: TForm_Individual;

implementation

uses Unit_dmdados;

{$R *.DFM}

procedure TForm_Individual.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TForm_Individual.FormShow(Sender: TObject);
begin
  cbTecnico.items.clear;
  dmDados.tb_Tecnico.First;
  While Not dmDados.tb_Tecnico.Eof Do
    Begin
      cbTecnico.Items.Add(dmDados.tb_TecnicoTecnico.Value);
      dmDados.tb_Tecnico.Next;
    End;
  medtData.Text:=DateToStr(Now);
  medtData.SetFocus;
end;

procedure TForm_Individual.rbVisualClick(Sender: TObject);
begin
  If rbVisual.ItemIndex = 0 Then
    Begin
      GBoxTecnico.Visible:=True;
      gbTec2.Visible:=False;
      cbTecnico.Enabled:=True;
      GBoxTecnico.SetFocus;
    End
  Else
    Begin
      GBoxTecnico.Visible:=False;
      CbTecnico.Enabled:=False;
      gbTec2.Visible:=True;
    End;

end;

procedure TForm_Individual.bntLocalizarClick(Sender: TObject);
Var
  Faixa : String;
begin
  Faixa:='A';
  dmDados.Tb_Cadastro.Filtered:=False;
  If (dmDados.Tb_Cadastro.Locate('Data',medtData.text,[])) Then
    Begin
      If rbVisual.ItemIndex = 0 Then
        If rgFaixa.ItemIndex = 1 Then
          Begin
            dmDados.Tb_Cadastro.Filtered:=False;
            dmDados.Tb_Cadastro.Filter:='((Data = '''+medtData.Text+''') And '+
                                        '(Tecnico = '''+cbTecnico.Text+''') And'+
                                        '(Abert = '''+Faixa+'''))';
            dmDados.Tb_Cadastro.Filtered:=True;
            dmDados.Tb_Cadastro.IndexName:='SaidaLoja';
          End
        Else
          Begin
            dmDados.Tb_Cadastro.Filtered:=False;
            dmDados.Tb_Cadastro.Filter:='((Data = '''+medtData.Text+''') And '+
                                        '(Tecnico = '''+cbTecnico.Text+'''))';
            dmDados.Tb_Cadastro.Filtered:=True;
            dmDados.Tb_Cadastro.IndexName:='SaidaLoja';
          End
      Else
        If rgFaixa.ItemIndex = 1 Then
          Begin
            dmDados.Tb_Cadastro.Filtered:=False;
            dmDados.Tb_Cadastro.Filter:='((Data = '''+medtData.Text+''') And '+
                                        '(Abert = '''+Faixa+'''))';
            dmDados.Tb_Cadastro.Filtered:=True;
            dmDados.Tb_Cadastro.IndexName:='horatec'
          End
        Else
          Begin
            dmDados.Tb_Cadastro.Filtered:=False;
            dmDados.Tb_Cadastro.Filter:='(Data = '''+medtData.Text+''')';
            dmDados.Tb_Cadastro.Filtered:=True;
            dmDados.Tb_Cadastro.IndexName:='horatec'
          End;
    End
  Else
    Begin
      MessageBox(Form_Individual.Handle,'Informa��o n�o Localizada !!!','Resultado da Localiza��o',MB_ICONWARNING);
      GBoxData.SetFocus;
    End;
end;

procedure TForm_Individual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.Tb_Cadastro.Filtered:=False;
  GBoxTecnico.Visible:=False;
  CbTecnico.Enabled:=False;
  gbTec2.Visible:=True;
  rbVisual.ItemIndex := -1;
  rgFaixa.ItemIndex := -1;
end;

procedure TForm_Individual.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
