unit uLayouts;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfLayouts = class(TForm)
    retSkype: TRectangle;
    Circle1: TCircle;
    Layout1: TLayout;
    Circle2: TCircle;
    retGoogle: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Circle3: TCircle;
    Label8: TLabel;
    Layout3: TLayout;
    Label7: TLabel;
    retAndroid: TRectangle;
    Circle4: TCircle;
    Label9: TLabel;
    Layout4: TLayout;
    procedure retSkypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLayouts: TfLayouts;

implementation

{$R *.fmx}

procedure TfLayouts.retSkypeClick(Sender: TObject);
begin
  Sender.Free;
end;

end.
