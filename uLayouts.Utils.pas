unit uLayouts.Utils;

interface

uses uLayouts, System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, RegularExpressions,
  FMX.ListBox, System.StrUtils, FMX.Objects, FMX.MultiResBitmap;

type
  TVertHelper = class helper for TVertScrollBox
     procedure ArrayCard(lbl :array of String); overload;
     procedure ClearAllObjects;
     procedure GoogleCard(txt1,txt2,txt3 :String); overload;
     procedure SkypeCard(txt1,txt2 :String; data :TDate; Qtd,Status :Integer); overload;
     procedure StringCard(str : string); overload;
  end;

type
  TListBoxHelper = class helper for TListBox
     procedure ArrayCard(lbl :array of String); overload;
     procedure GoogleCard(txt1,txt2,txt3 :String); overload;
     procedure SkypeCard(txt1,txt2 :String; data :TDate; Qtd,Status :Integer); overload;
     procedure StringCard(str : string); overload;
  end;

function Iniciais(str :String) :String;

implementation

uses uMain;

function Iniciais(str :String) :String;
var strArr :TArray<String>;
begin
   strArr := TRegEx.Split(str,' ');
   if TRegEx.Matches(str,' ').Count = 0 then
      Result := LeftStr(strArr[0],1)
   else if TRegEx.Matches(str,' ').Count > 0 then
      Result := LeftStr(strArr[0],1)+LeftStr(strArr[TRegEx.Matches(str,' ').Count ],1);

end;

{ TVertHelper }

procedure TVertHelper.ArrayCard(lbl: array of String);
var
   Loop: Integer;
   lab : TLabel;
begin

   fLayouts := TfLayouts.Create(Self);
   fLayouts.retAndroid.Align := TAlignLayout.Top;

   fLayouts.retAndroid.Height := 50;
   for Loop := Low(lbl) to High(lbl) do begin

      if Loop = 0 then begin
         lab := TLabel.Create(fLayouts.Layout4);
         lab.Align := TAlignLayout.Top;
         lab.StyledSettings := [];
         lab.Size.Height := 25;
         lab.Size.PlatformDefault := False;
         lab.TextSettings.Font.Size := 17;
         lab.Text := lbl[loop];
         lab.TabOrder := Loop;
         fLayouts.Layout4.AddObject(lab);
      end else begin
         lab := TLabel.Create(fLayouts.Layout4);

         lab.Align := TAlignLayout.Top;
         lab.StyledSettings := [TStyledSetting.Style];
         lab.Size.Height := 25;
         lab.Position.Y := 1000;
         lab.Size.Height := 17;

         if loop > 1 then fLayouts.retAndroid.Height := fLayouts.retAndroid.Height + lab.Size.Height;

         lab.Size.PlatformDefault := False;
         lab.TextSettings.Font.Size := 13;
         lab. TextSettings.FontColor := fLayouts.Label2.FontColor;
         lab.TextSettings.VertAlign := TTextAlign.Leading;
         lab.Text := lbl[loop];
         fLayouts.Layout4.AddObject(lab);
      end;
   end;

   Self.AddObject(fLayouts.retAndroid);

end;

procedure TVertHelper.ClearAllObjects;
var I :Integer;
begin
   for I := Self.ComponentCount -1 downto 1 do begin
      //Showmessage(self.Controls[I].ClassName) ;
      self.Components[I].DisposeOf;

   end;

end;

procedure TVertHelper.GoogleCard(txt1, txt2, txt3 :String);
begin

   fLayouts := TfLayouts.Create(Self);
   fLayouts.retGoogle.Align := TAlignLayout.Top;
   fLayouts.retGoogle.Position.Y := 10000;

   if txt1 <> '' then fLayouts.Label1.Text := txt1;
   if txt2 <> '' then fLayouts.Label2.Text := txt2;
   if txt3 <> '' then fLayouts.Label3.Text := txt3;
   Self.AddObject(fLayouts.retGoogle);


end;

procedure TVertHelper.SkypeCard(txt1,txt2 :String; data :TDate; Qtd,Status :Integer);
begin

   fLayouts := TfLayouts.Create(Self);
   fLayouts.retSkype.Align := TAlignLayout.Top;
   fLayouts.Label4.Text := txt1;
   fLayouts.Label5.Text := txt2;
   fLayouts.retSkype.Position.Y := 10000;


   if status > 0 then
      fLayouts.Circle2.Fill.Color := TAlphaColors.Red;
   fLayouts.Label8.Text := Inttostr(Qtd);
   fLayouts.Label6.Text := Iniciais(fLayouts.Label4.Text);
   //Self.Tag := Self.Tag + 1;
   Self.AddObject(fLayouts.retSkype);
end;

procedure TVertHelper.StringCard(str: string);
var
   Loop     : Integer;
   lbl      : TLabel;
   strArray : TArray<String>;
begin
   fLayouts := TfLayouts.Create(Self);
   fLayouts.retAndroid.Align := TAlignLayout.Top;

   fLayouts.retAndroid.Height := 50;

   strArray := TRegEx.Split(str,';');


   for Loop := 0 to TRegEx.Matches(str,';').Count  do begin

      if Loop = 0 then begin
         fLayouts.Label9.Text := Iniciais(strArray[loop]);
         lbl := TLabel.Create(fLayouts.Layout4);
         lbl.Align := TAlignLayout.Top;
         lbl.StyledSettings := [];
         lbl.Size.Height := 25;
         lbl.Size.PlatformDefault := False;
         lbl.TextSettings.Font.Size := 17;
         lbl.Text := strArray[loop];
         lbl.TabOrder := Loop;
         fLayouts.Layout4.AddObject(lbl);
      end else begin
         lbl := TLabel.Create(fLayouts.Layout4);

         lbl.Align := TAlignLayout.Top;
         lbl.StyledSettings := [TStyledSetting.Style];
         lbl.Size.Height := 25;
         lbl.Position.Y := 1000;
         lbl.Size.Height := 17;

         if loop > 1 then
           fLayouts.retAndroid.Height := fLayouts.retAndroid.Height + lbl.Size.Height;

         lbl.Size.PlatformDefault := False;
         lbl.TextSettings.Font.Size := 13;
         lbl. TextSettings.FontColor := fLayouts.Label2.FontColor;
         lbl.TextSettings.VertAlign := TTextAlign.Leading;
         lbl.Text := strArray[loop];
         fLayouts.Layout4.AddObject(lbl);
      end;
   end;

   Self.AddObject(fLayouts.retAndroid);



end;

{ TListBoxHelper }

procedure TListBoxHelper.ArrayCard(lbl: array of String);
var
   Loop: Integer;
   lab : TLabel;
   ListItem :TListBoxItem;
begin

   ListItem := TListBoxItem.Create(Self);

   ListItem.Size.PlatformDefault := False;
   ListItem.Text := '';

   fLayouts := TfLayouts.Create(Self);
   fLayouts.retAndroid.Align := TAlignLayout.Top;

   fLayouts.retAndroid.Height := 50;
   for Loop := Low(lbl) to High(lbl) do begin

      if Loop = 0 then begin
         lab := TLabel.Create(fLayouts.Layout4);
         lab.Align := TAlignLayout.Top;
         lab.StyledSettings := [];
         lab.Size.Height := 25;
         lab.Size.PlatformDefault := False;
         lab.TextSettings.Font.Size := 17;
         lab.Text := lbl[loop];
         lab.TabOrder := Loop;
         fLayouts.Layout4.AddObject(lab);
      end else begin
         lab := TLabel.Create(fLayouts.Layout4);

         lab.Align := TAlignLayout.Top;
         lab.StyledSettings := [TStyledSetting.Style];
         lab.Size.Height := 25;
         lab.Position.Y := 1000;
         lab.Size.Height := 17;

         if loop > 1 then fLayouts.retAndroid.Height := fLayouts.retAndroid.Height + lab.Size.Height;

         lab.Size.PlatformDefault := False;
         lab.TextSettings.Font.Size := 13;
         lab. TextSettings.FontColor := fLayouts.Label2.FontColor;
         lab.TextSettings.VertAlign := TTextAlign.Leading;
         lab.Text := lbl[loop];
         fLayouts.Layout4.AddObject(lab);
      end;
   end;

   ListItem.Size.Height := fLayouts.retAndroid.Height;
   ListItem.AddObject(fLayouts.retAndroid);
   Self.AddObject(ListItem);

end;

procedure TListBoxHelper.GoogleCard(txt1, txt2, txt3: String);
begin

end;

procedure TListBoxHelper.SkypeCard(txt1, txt2: String; data: TDate; Qtd,
  Status: Integer);
begin

end;

procedure TListBoxHelper.StringCard(str: string);
var
   Loop: Integer;
   lbl :TLabel;
   strArray : TArray<String>;
   ListItem :TListBoxItem;


begin

   ListItem := TListBoxItem.Create(Self);

   ListItem.Size.PlatformDefault := False;
   ListItem.Text := '';

   fLayouts := TfLayouts.Create(Self);
   fLayouts.retAndroid.Align := TAlignLayout.Top;

   fLayouts.retAndroid.Height := 50;

   strArray := TRegEx.Split(str,';');


   for Loop := 0 to TRegEx.Matches(str,';').Count  do begin

      if Loop = 0 then begin
         lbl := TLabel.Create(fLayouts.Layout4);
         lbl.Align := TAlignLayout.Top;
         lbl.StyledSettings := [];
         lbl.Size.Height := 25;
         lbl.Size.PlatformDefault := False;
         lbl.TextSettings.Font.Size := 17;
         lbl.Text := strArray[loop];
         lbl.TabOrder := Loop;
         fLayouts.Layout4.AddObject(lbl);
      end else begin
         lbl := TLabel.Create(fLayouts.Layout4);

         lbl.Align := TAlignLayout.Top;
         lbl.StyledSettings := [TStyledSetting.Style];
         lbl.Size.Height := 25;
         lbl.Position.Y := 1000;
         lbl.Size.Height := 17;

         if loop > 1 then fLayouts.retAndroid.Height := fLayouts.retAndroid.Height + lbl.Size.Height;

         lbl.Size.PlatformDefault := False;
         lbl.TextSettings.Font.Size := 13;
         lbl. TextSettings.FontColor := fLayouts.Label2.FontColor;
         lbl.TextSettings.VertAlign := TTextAlign.Leading;
         lbl.Text := strArray[loop];
         fLayouts.Layout4.AddObject(lbl);
      end;
   end;

   ListItem.Size.Height := fLayouts.retAndroid.Height;
   ListItem.AddObject(fLayouts.retAndroid);
   Self.AddObject(ListItem);



end;

end.
