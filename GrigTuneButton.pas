unit GrigTuneButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Buttons,
  Registry,
  cxGrid, cxGridCustomView;

type
  TGridTuneButton = class(TSpeedButton)
  private
    f_Grid: TcxGrid;
    f_Key: String;
    f_AppKey: String;
  private
    procedure pm_SetGrid(const Value: TcxGrid);
    procedure LoadGridParameters;
    procedure SaveGridParameters;
    procedure SaveTableViewParam(aRegistry: TRegistry; aView: TcxCustomGridView);
    procedure LoadTableViewParam(aRegistry: TRegistry; aView: TcxCustomGridView);
    procedure MakeKey;
    procedure CreatePopupMenu;
    procedure SetAppKey(const Value: String);
  protected
    procedure ButtonClick(Sender: TObject);
  public
    constructor Create(aOwner: TComponent); override;
  published
    property AppKey: String
      read f_AppKey write SetAppKey;
    property Grid: TcxGrid
     read f_Grid write pm_SetGrid;
  end;

procedure Register;

implementation

Uses
 Windows, Forms, StrUtils,
 cxGridCustomTableView, cxGridTableView, cxFindPanel, Cxgridinplaceeditform,
 GridTuneDlg;

procedure Register;
begin
  RegisterComponents('GridTune', [TGridTuneButton]);
end;

{ TGridTuneButton }

procedure TGridTuneButton.ButtonClick(Sender: TObject);
begin
 if TuneGrid(f_Grid) then
  SaveGridParameters;
end;

constructor TGridTuneButton.Create(aOwner: TComponent);
begin
  inherited;
  CreatePopupMenu;
  AppKey:= 'Software\' + IfThen(Application.Title <> '', Application.Title, Application.ExeName);
  OnClick:= ButtonClick;
end;

procedure TGridTuneButton.CreatePopupMenu;
begin
 // Создать меню для стандартных команд
end;

procedure TGridTuneButton.LoadGridParameters;
var
 i: Integer;
 l_R: TRegistry;
begin
 if f_Grid <> nil then
 begin
  l_R:= TRegistry.Create;
  try
   l_R.RootKey:= HKEY_CURRENT_USER;
   if l_R.OpenKey(f_AppKey, True) then
   begin
     MakeKey;
     if l_R.OpenKey(f_Key, True) then
       with f_Grid do
       begin
        for I := 0 to ViewCount-1 do
          if Views[i] is TcxCustomGridTableView then
            LoadTableViewParam(l_R, Views[i]);
       end;
   end;
  finally
    FreeAndNil(l_R);
  end;
 end;
end;

procedure TGridTuneButton.MakeKey;
var
 l_P: TControl;
begin
  // FormName.GridName
  f_Key:= f_Grid.Name;
  l_P:= Parent;
  while (l_P <> nil) and not (l_P is TForm) do
   l_P:= l_P.Parent;
  if l_P <> nil then
   f_Key:= l_P.Name + f_Key;
end;

procedure TGridTuneButton.pm_SetGrid(const Value: TcxGrid);
begin
 f_Grid := Value;
 LoadGridParameters;
end;

procedure TGridTuneButton.SaveGridParameters;
var
 i: Integer;
 l_R: TRegistry;
begin
 if f_Grid <> nil then
 begin
  l_R:= TRegistry.Create;
  try
   l_R.RootKey:= HKEY_CURRENT_USER;
   if l_R.OpenKey(f_AppKey, True) then
   begin
     MakeKey;
     if l_R.OpenKey(f_Key, True) then
       with f_Grid do
       begin
        for I := 0 to ViewCount-1 do
          if Views[i] is TcxCustomGridTableView then
            SaveTableViewParam(l_R, Views[i]);
       end;
   end;
  finally
    FreeAndNil(l_R);
  end;
 end;
end;

procedure TGridTuneButton.SaveTableViewParam(aRegistry: TRegistry; aView: TcxCustomGridView);
begin
 with aView as TcxGridTableView, aRegistry do
 begin
  WriteInteger('FilterBox', ord(FilterBox.Visible));
  WriteInteger('FindPanel', Ord(FindPanel.DisplayMode));
  WriteBool('FilterRow', FilterRow.Visible);
  WriteBool('Navigator', Navigator.Visible);
  WriteBool('InfoPanel', Navigator.InfoPanel.Visible);
  WriteBool('NewItemRow', NewItemRow.Visible);
  WriteInteger('EditMode', Ord(OptionsBehavior.EditMode));
 end;
end;

procedure TGridTuneButton.LoadTableViewParam(aRegistry: TRegistry; aView: TcxCustomGridView);
begin
 with aView as TcxGridTableView, aRegistry do
 begin
   try
     FilterBox.Visible:= TcxGridFilterVisible(ReadInteger('FilterBox'));
   except

   end;
   try
     FilterRow.Visible:= ReadBool('FilterRow');
   except

   end;
   try
     FindPanel.DisplayMode:= TcxFindPanelDisplayMode(ReadInteger('FindPanel'));
   except

   end;
   try
     Navigator.Visible:= ReadBool('Navigator');
   except

   end;
   try
     Navigator.InfoPanel.Visible:= ReadBool('InfoPanel');
   except

   end;
   try
     NewItemRow.Visible:= ReadBool('NewItemRow');
   except

   end;
   try
     OptionsBehavior.EditMode:= TcxGridEditMode(ReadInteger('EditMode'));
   except

   end;
   OptionsCustomize.ColumnsQuickCustomization:= True;
 end;
end;

procedure TGridTuneButton.SetAppKey(const Value: String);
begin
  f_AppKey := Value;
end;

end.
