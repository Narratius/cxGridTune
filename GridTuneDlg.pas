unit GridTuneDlg;

{ TGridTuneDialog
  окно настроек параметров TcxGrid (пока только TcxGridTableView) }


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGrid, cxGridTableView,
  Vcl.StdCtrls, Vcl.Menus;

type
  TGridTuneDialog = class(TForm)
    Label1: TLabel;
    comboFilterBox: TComboBox;
    btnOK: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    comboFindPanel: TComboBox;
    CheckNavigator: TCheckBox;
    CheckNewItemRow: TCheckBox;
    CheckFilterRow: TCheckBox;
    ComboEditMode: TComboBox;
    Label3: TLabel;
    checkInfoPanel: TCheckBox;
    GridPopupMenu: TPopupMenu;
    itemSaveToHTML: TMenuItem;
    itemSaveToText: TMenuItem;
    itemSaveToExcel: TMenuItem;
    itemSaveToXML: TMenuItem;
    itemDivider: TMenuItem;
    itemStoreToRegistry: TMenuItem;
    itemRestoreFromRegistry: TMenuItem;
    itemPrint: TMenuItem;
    itemSaveToCSV: TMenuItem;
    itemDivider2: TMenuItem;
    procedure CheckNavigatorClick(Sender: TObject);
    procedure itemSaveToHTMLClick(Sender: TObject);
    procedure itemSaveToTextClick(Sender: TObject);
    procedure itemSaveToExcelClick(Sender: TObject);
    procedure itemSaveToXMLClick(Sender: TObject);
    procedure itemRestoreFromRegistryClick(Sender: TObject);
    procedure itemStoreToRegistryClick(Sender: TObject);
    procedure itemSaveToCSVClick(Sender: TObject);
  private
   f_Grid: TcxGrid;
   f_AppKey: String;
   f_GridKey: String;
   f_TableView: TcxGridTableView;
   procedure GetGridParameters;
   procedure SetGridParameters;
    procedure pm_SetGrid(const Value: TcxGrid);
    procedure LoadGridParameters;
    procedure SaveGridParameters;
    procedure MakeKey;
    procedure SetAppKey(const Value: String);
  public
   constructor Make(aOwner: TComponent; aGrid: TcxGrid; aAppKey: String);
   function Execute: Boolean;
   procedure SaveToExcel;
   procedure SaveToHTML;
   procedure SaveToText;
   procedure SaveToXML;
   procedure SaveToCSV;
   property Grid: TcxGrid
    read f_Grid write pm_SetGrid;
  end;

var
  GridTuneDialog: TGridTuneDialog;

function TuneGrid(aGrid: TcxGrid): Boolean;

function MakeGridDlg(aAppKey: String; aGrid: TcxGrid): TGridTuneDialog;

implementation

Uses
 Registry, StrUtils,
 cxGridCustomTableView, cxFindPanel, Cxgridinplaceeditform,
 cxGridExportLink;


{$R *.dfm}

function TuneGrid(aGrid: TcxGrid): Boolean;
begin
 with TGridTuneDialog.Create(Application) do
 try
   Result:= Execute;
 finally
   Free;
 end;
end;

function MakeGridDlg(aAppKey: String; aGrid: TcxGrid): TGridTuneDialog;
begin
 Result:= TGridTuneDialog.Make(Application, aGrid, aAppKey);
end;

{ TGridTuneDialog }

procedure TGridTuneDialog.CheckNavigatorClick(Sender: TObject);
begin
 if checkNavigator.Checked then
  checkInfoPanel.Checked:= True;
end;

procedure TGridTuneDialog.itemSaveToCSVClick(Sender: TObject);
begin
  SaveToCSV;
end;

procedure TGridTuneDialog.itemSaveToExcelClick(Sender: TObject);
begin
 SaveToExcel
end;

procedure TGridTuneDialog.itemSaveToHTMLClick(Sender: TObject);
begin
 SaveToHTML;
end;

procedure TGridTuneDialog.itemSaveToTextClick(Sender: TObject);
begin
 SaveToText;
end;

procedure TGridTuneDialog.itemSaveToXMLClick(Sender: TObject);
begin
  SaveToXML;
end;

function TGridTuneDialog.Execute: Boolean;
begin
 Result:= False;
 GetGridParameters;
 if IsPositiveResult(ShowModal) then
 begin
  SetGridParameters;
  SaveGridParameters;
  Result:= True;
 end;
end;

procedure TGridTuneDialog.GetGridParameters;
begin
  with f_TableView do
  begin
    comboFilterBox.ItemIndex:= ord(FilterBox.Visible);
    comboFindPanel.ItemIndex:= Ord(FindPanel.DisplayMode);
    checkFilterRow.Checked:= FilterRow.Visible;
    checkNavigator.Checked:= Navigator.Visible;
    checkInfoPanel.Checked:= Navigator.InfoPanel.Visible;
    checkNewItemRow.Checked:= NewItemRow.Visible;
    comboEditMode.ItemIndex:= Ord(OptionsBehavior.EditMode);
  end;
end;

procedure TGridTuneDialog.itemRestoreFromRegistryClick(Sender: TObject);
begin
 f_TableView.RestoreFromRegistry(f_AppKey);
end;

procedure TGridTuneDialog.SaveToCSV;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'CSV (разделитель - запятая)|*.csv', 'CSV (разделитель - запятая)|*.csv', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToCSV(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0);
end;

procedure TGridTuneDialog.SaveToExcel;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Книга Excel|*.xlsx|Книга Excel 97-2003|*.xls', 'Книга Excel|*.xlsx', 'Укажите имя файла для сохранения', '', True) then
 begin
  if SameText(ExtractFileExt(l_FileName), '.xlsx') then
   ExportGridToXLSX(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0)
  else
   ExportGridToExcel(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0);
 end;
end;

procedure TGridTuneDialog.SaveToHTML;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Веб страница|*.html', 'Веб страница|*.html', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToHTML(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0);
end;

procedure TGridTuneDialog.SaveToText;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Текст|*.txt', 'Текст|*.txt', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToText(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0);
end;

procedure TGridTuneDialog.SaveToXML;
var
 l_FileName: String;
begin
 if PromptForFileName(l_FileName, 'Таблица XML|*.xml', 'Таблица XML|*.xml', 'Укажите имя файла для сохранения', '', True) then
   ExportGridToXML(l_FileName, f_Grid, True, TcxGridTableController(f_tableView.Controller).SelectedRowCount = 0);
end;

procedure TGridTuneDialog.itemStoreToRegistryClick(Sender: TObject);
begin
  f_TableView.StoreToRegistry(f_AppKey + '\' + f_GridKey, False);
end;

procedure TGridTuneDialog.pm_SetGrid(const Value: TcxGrid);
var
 i: Integer;
begin
  f_Grid := Value;
  if f_Grid <> nil then
  begin
    with f_Grid do
    begin
      for I := 0 to ViewCount-1 do
        if Views[i] is TcxGridTableView then
        begin
          f_TableView:= TcxGridTableView(Views[i]);
          LoadGridParameters;
        end;
    end;
  end;
end;

procedure TGridTuneDialog.SetGridParameters;
var
 i: Integer;
begin
  with f_Grid do
  begin
    for I := 0 to ViewCount-1 do
      if Views[i] is TcxGridTableView then
      with TcxGridTableView(Views[i]) do
      begin
       FilterBox.Visible:= TcxGridFilterVisible(comboFilterBox.ItemIndex);
       FilterRow.Visible:= checkFilterRow.Checked;
       FindPanel.DisplayMode:= TcxFindPanelDisplayMode(comboFindPanel.ItemIndex);
       Navigator.Visible:= checkNavigator.Checked;
       Navigator.InfoPanel.Visible:= checkInfoPanel.Checked;
       NewItemRow.Visible:= checkNewItemRow.Checked;
       OptionsBehavior.EditMode:= TcxGridEditMode(comboEditMode.ItemIndex);
       OptionsCustomize.ColumnsQuickCustomization:= True;
      end;
  end;

end;

procedure TGridTuneDialog.LoadGridParameters;
var
 l_R: TRegistry;
begin
 if f_Grid <> nil then
 begin
  l_R:= TRegistry.Create;
  try
   l_R.RootKey:= HKEY_CURRENT_USER;
   MakeKey;
   if l_R.OpenKey(f_AppKey, False) then
   begin
     if l_R.OpenKey(f_GridKey, False) then
     with f_TableView as TcxGridTableView, l_R do
     begin
       if ValueExists('FilterBox') then
         FilterBox.Visible:= TcxGridFilterVisible(ReadInteger('FilterBox'));
       if ValueExists('FilterRow') then
         FilterRow.Visible:= ReadBool('FilterRow');
       if ValueExists('FindPanel') then
         FindPanel.DisplayMode:= TcxFindPanelDisplayMode(ReadInteger('FindPanel'));
       if ValueExists('Navigator') then
         Navigator.Visible:= ReadBool('Navigator');
       if ValueExists('InfoPanel') then
         Navigator.InfoPanel.Visible:= ReadBool('InfoPanel');
       if ValueExists('NewItemRow') then
         NewItemRow.Visible:= ReadBool('NewItemRow');
       if ValueExists('EditMode') then
         OptionsBehavior.EditMode:= TcxGridEditMode(ReadInteger('EditMode'));
       OptionsCustomize.ColumnsQuickCustomization:= True;
     end;
   end;
  finally
    FreeAndNil(l_R);
  end;
 end;
end;

constructor TGridTuneDialog.Make(aOwner: TComponent; aGrid: TcxGrid; aAppKey: String);
begin
 Create(aOwner);
 if aAppKey <> '' then
  f_AppKey:= aAppKey;
 Grid:= aGrid;
end;

procedure TGridTuneDialog.MakeKey;
var
 l_P: TControl;
begin
 f_GridKey:= f_Grid.Name;
 l_P:= f_Grid.Parent;
 while (l_P <> nil) and not (l_P is TForm) do
  l_P:= l_P.Parent;
 if l_P <> nil then
  f_GridKey:= l_P.Name + '.' + f_GridKey;

 if f_AppKey = '' then
  f_AppKey:= 'Software\' + IfThen(Application.Title <> '', Application.Title, Application.ExeName);
end;

procedure TGridTuneDialog.SaveGridParameters;
var
 l_R: TRegistry;
begin
 if f_Grid <> nil then
 begin
  l_R:= TRegistry.Create;
  try
   l_R.RootKey:= HKEY_CURRENT_USER;
   MakeKey;
   if l_R.OpenKey(f_AppKey, True) then
   begin
     if l_R.OpenKey(f_GridKey, True) then
       with f_TableView, l_R do
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
  finally
    FreeAndNil(l_R);
  end;
 end;
end;


procedure TGridTuneDialog.SetAppKey(const Value: String);
begin
  f_AppKey := Value;
end;


end.
