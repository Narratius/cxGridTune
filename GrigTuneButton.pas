unit GrigTuneButton;

{ TGridTuneButton
  кнопка для вызова настроек параметров TcxGrid (пока только TcxGridTableView)
  и сохранения содержимого грида в файлы.
  Настройки параметров сохраняются в реестр. }

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Buttons,
  Registry,
  cxGrid, cxGridCustomView;

type
  TGridTuneButton = class(TSpeedButton)
  private
    f_Grid: TcxGrid;
    f_TableView: TcxCustomGridView;
    f_Key: String;
    f_AppKey: String;
  private
    procedure pm_SetGrid(const Value: TcxGrid);
    procedure LoadGridParameters;
    procedure SaveGridParameters;
    procedure SaveTableViewParam(aRegistry: TRegistry);
    procedure LoadTableViewParam(aRegistry: TRegistry);
    procedure MakeKey;
    procedure CreatePopupMenu;
    procedure SetAppKey(const Value: String);
    procedure SaveToHTML(Sender: TObject);
    procedure SaveToTXT(Sender: TObject);
    procedure SaveToExcel(Sender: TObject);
    procedure SaveToXML(Sender: TObject);
    procedure StoreToRegistry(Sender: TObject);
    procedure RestoreFromRegistry(Sender: TObject);
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
 Windows, Forms, StrUtils, Menus, Dialogs,
 cxGridCustomTableView, cxGridTableView, cxFindPanel, Cxgridinplaceeditform,
 cxGridExportLink,
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
var
 l_Item: TMenuItem;
 index: Integer;
begin
 Popupmenu:= TPopupMenu.Create(Owner);
 PopupMenu.AutoPopup:= True;

 l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'SaveToHTML';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Сохранить в файл HTML...';
 l_Item.Tag := index;
 l_Item.OnClick := SaveToHTML;

 l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'SaveToText';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Сохранить в текстовый файл...';
 l_Item.Tag := index;
 l_Item.OnClick := SaveToTXT;

l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'SaveToExcel';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Сохранить в таблицу Excel...';
 l_Item.Tag := index;
 l_Item.OnClick := SaveToExcel;

l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'SaveToXML';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Сохранить в файл XML...';
 l_Item.Tag := index;
 l_Item.OnClick := SaveToXML;

 l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'Div1';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := '-';
 l_Item.Tag := index;

 l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'SaveToRegistry';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Сохранить раскладку';
 l_Item.Tag := index;
 l_Item.OnClick := StoreToRegistry;

 l_Item := TMenuItem.Create(Owner);
 l_Item.Name:= 'RestoreFromRegistry';
 index := PopupMenu.Items.Count;
 PopupMenu.Items.Add(l_Item);
 l_Item.Caption := 'Восстановить раскладку';
 l_Item.Tag := index;
 l_Item.OnClick := RestoreFromRegistry;
end;

procedure TGridTuneButton.LoadGridParameters;
var
 l_R: TRegistry;
begin
 if f_Grid <> nil then
 begin
  l_R:= TRegistry.Create;
  try
   l_R.RootKey:= HKEY_CURRENT_USER;
   if l_R.OpenKey(f_AppKey, False) then
   begin
     MakeKey;
     if l_R.OpenKey(f_Key, False) then
      LoadTableViewParam(l_R);
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
var
 i: Integer;
begin
 f_Grid := Value;
 if f_Grid <> nil then
 begin
  with f_Grid do
   for I := 0 to ViewCount-1 do
    if Views[i] is TcxCustomGridTableView then
    begin
     f_TableView:= Views[i];
     break
    end;
  LoadGridParameters;
 end;
end;

procedure TGridTuneButton.RestoreFromRegistry(Sender: TObject);
begin
 f_TableView.RestoreFromRegistry(f_AppKey);
end;

procedure TGridTuneButton.SaveGridParameters;
var
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
      SaveTableViewParam(l_R);
   end;
  finally
    FreeAndNil(l_R);
  end;
 end;
end;

procedure TGridTuneButton.SaveTableViewParam(aRegistry: TRegistry);
begin
 with f_TableView as TcxGridTableView, aRegistry do
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

procedure TGridTuneButton.SaveToExcel(Sender: TObject);
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Таблицы Excel|*.xls', 'Таблицы Excel|*.xls', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToExcel(l_FileName, f_Grid, True, TcxCustomGridTableController(f_tableView.Controller).SelectedRecordCount > 1);
end;

procedure TGridTuneButton.SaveToHTML;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Файлы HTML|*.html', 'Файлы HTML|*.html', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToHTML(l_FileName, f_Grid, True, TcxCustomGridTableController(f_tableView.Controller).SelectedRecordCount > 1);
end;

procedure TGridTuneButton.StoreToRegistry(Sender: TObject);
begin
 f_TableView.StoreToRegistry(f_AppKey);
end;

procedure TGridTuneButton.SaveToTXT(Sender: TObject);
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Текстовые файлы|*.txt', 'Текстовые файлы|*.txt', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToText(l_FileName, f_Grid, True, TcxCustomGridTableController(f_tableView.Controller).SelectedRecordCount > 1);
end;

procedure TGridTuneButton.SaveToXML(Sender: TObject);
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Файлы XML|*.xml', 'Файлы XML|*.xml', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToXML(l_FileName, f_Grid, True, TcxCustomGridTableController(f_tableView.Controller).SelectedRecordCount > 1);
end;

procedure TGridTuneButton.LoadTableViewParam(aRegistry: TRegistry);
begin
 with f_TableView as TcxGridTableView, aRegistry do
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
