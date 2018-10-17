unit GridTuneDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGrid, Vcl.StdCtrls;

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
    procedure CheckNavigatorClick(Sender: TObject);
  private
   f_Grid: TcxGrid;
   procedure SetGrid(const Value: TcxGrid);
   procedure GetGridParameters;
   procedure SetGridParameters;
  public
   function Execute(aGrid: TcxGrid): Boolean;
  end;

var
  GridTuneDialog: TGridTuneDialog;

function TuneGrid(aGrid: TcxGrid): Boolean;

implementation

Uses
 cxGridCustomTableView, cxGridTableView, cxFindPanel, Cxgridinplaceeditform;


{$R *.dfm}

function TuneGrid(aGrid: TcxGrid): Boolean;
begin
 with TGridTuneDialog.Create(Application) do
 try
   Result:= Execute(aGrid);
 finally
   Free;
 end;
end;

{ TGridTuneDialog }

procedure TGridTuneDialog.CheckNavigatorClick(Sender: TObject);
begin
 if checkNavigator.Checked then
  checkInfoPanel.Checked:= True;
end;

function TGridTuneDialog.Execute(aGrid: TcxGrid): Boolean;
begin
 SetGrid(aGrid);
 Result:= False;
 if IsPositiveResult(ShowModal) then
 begin
  SetGridParameters;
  Result:= True;
 end;
end;

procedure TGridTuneDialog.GetGridParameters;
begin

end;

procedure TGridTuneDialog.SetGrid(const Value: TcxGrid);
var
 i: Integer;
begin
  f_Grid := Value;
  if f_Grid <> nil then
    with f_Grid do
    begin
      for I := 0 to ViewCount-1 do
        if Views[i] is TcxGridTableView then
          with TcxGridTableView(Views[i]) do
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

end.
