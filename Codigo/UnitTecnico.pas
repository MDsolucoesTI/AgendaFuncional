//////////////////////////////////////////////////////////////////////////
// Criacao...........: 04/2001
// Sistema...........: Agenda Funcional - Controle Servicos
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitTecnico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids,Unit_DmDados;

type
  TfrmTecnico = class(TForm)
    DBGrid1: TDBGrid;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTecnico: TfrmTecnico;

implementation

{$R *.DFM}

procedure TfrmTecnico.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
