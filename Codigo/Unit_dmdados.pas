//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unit_dmdados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,UnitPesquisa;

type
  TDMdados = class(TDataModule)
    Tb_cadastro: TTable;
    DScadastro: TDataSource;
    Tb_cadastroCodigo: TAutoIncField;
    Tb_cadastroData: TDateField;
    Tb_cadastroTecnico: TStringField;
    Tb_cadastroSaida_Loja: TTimeField;
    Tb_cadastroCliente: TStringField;
    Tb_cadastroEndereco: TStringField;
    Tb_cadastroNumero: TFloatField;
    Tb_cadastroComplemento: TStringField;
    Tb_cadastroBairro: TStringField;
    Tb_cadastroSaida_cli: TTimeField;
    Tb_Tecnico: TTable;
    dsTecnico: TDataSource;
    Tb_TecnicoCodigo: TAutoIncField;
    Tb_TecnicoTecnico: TStringField;
    Tb_cadastroAbert: TStringField;
    Tb_cadastroTelefone: TStringField;
    tb_Pesquisa: TTable;
    dsPesquisa: TDataSource;
    tb_PesquisaCodigo: TAutoIncField;
    tb_PesquisaData: TDateField;
    tb_PesquisaTecnico: TStringField;
    tb_PesquisaSaida_Loja: TTimeField;
    tb_PesquisaCliente: TStringField;
    tb_PesquisaEndereco: TStringField;
    tb_PesquisaNumero: TFloatField;
    tb_PesquisaComplemento: TStringField;
    tb_PesquisaBairro: TStringField;
    tb_PesquisaSaida_cli: TTimeField;
    tb_PesquisaAbert: TStringField;
    tb_PesquisaTelefone: TStringField;
    procedure tb_PesquisaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMdados: TDMdados;

implementation

{$R *.DFM}

procedure TDMdados.tb_PesquisaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
Var
  Tempo,Agora:TDateTime;
begin
  Agora:=Time;
  If frmPesquisa.cbTempo.Text = '1:00' Then
    Tempo:=(3600*(1/24/60/60));
  If frmPesquisa.cbTempo.Text = '1:30' Then
    Tempo:=(5400*(1/24/60/60));
  If frmPesquisa.cbTempo.Text = '2:00' Then
    Tempo:=(7200*(1/24/60/60));
  If frmPesquisa.cbTempo.Text = '2:30' Then
    Tempo:=(9000*(1/24/60/60));
  If frmPesquisa.cbTempo.Text = '3:00' Then
    Tempo:=(10800*(1/24/60/60));
  {If (tb_PesquisaData.Value = StrToDate(frmPesquisa.medtData.Text)) And (Tempo > Now) Then}
  Agora:=Agora-tb_PesquisaSaida_Loja.Value;
  If (Agora>=Tempo) and (tb_PesquisaAbert.Value = 'A') Then
    Accept:=True
  Else
    Accept:=False;
end;

end.
