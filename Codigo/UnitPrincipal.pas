//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    btnSair: TBitBtn;
    btnAbrir: TBitBtn;
    btnFecha: TBitBtn;
    btnTecnico: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btnTecnicoClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnFechaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UnitTecnico, Unit_cadastro, Unit_fechamento, Unit_Individual,
  UnitPesquisa;

{$R *.DFM}

procedure TfrmPrincipal.btnTecnicoClick(Sender: TObject);
begin
  frmTecnico.ShowModal;
end;

procedure TfrmPrincipal.btnAbrirClick(Sender: TObject);
begin
  Form_Cadastro.ShowModal;
end;

procedure TfrmPrincipal.btnFechaClick(Sender: TObject);
begin
  Form_Fechamento.ShowModal;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  Form_Individual.ShowModal;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  frmPesquisa.ShowModal;
end;

end.
