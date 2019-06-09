program LayoutsPersonalizados;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {fMain},
  uLayouts in 'uLayouts.pas' {fLayouts},
  uLayouts.Utils in 'uLayouts.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfLayouts, fLayouts);
  Application.Run;
end.
