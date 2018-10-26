unit MmainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons,
  Data.FMTBcd, Data.DBXMsSQL, Data.SqlExpr, Datasnap.DBClient,
  GridTuneDlg, Vcl.StdCtrls, dxmdaset, dxCore, dxCoreClasses, dxGDIPlusAPI,
  dxGDIPlusClasses, dxRichEdit.Types, dxRichEdit.Options, dxRichEdit.Control,
  dxHttpIndyRequest, dxBarBuiltInMenu, dxRichEdit.Platform.Win.Control,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TtestForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnTuneGrid: TButton;
    dxMemData1: TdxMemData;
    DataSource1: TDataSource;
    dxMemData1Title: TStringField;
    dxMemData1Value: TIntegerField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Title: TcxGridDBColumn;
    cxGrid1DBTableView1Value: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnTuneGridClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnHTMLClick(Sender: TObject);
  private
    { Private declarations }
    f_GridDlg: TGridTuneDialog;
  public
    { Public declarations }
  end;

var
  testForm: TtestForm;


implementation

{$R *.dfm}

procedure TtestForm.btnExcelClick(Sender: TObject);
begin
 f_GridDlg.SaveToExcel;
end;

procedure TtestForm.btnHTMLClick(Sender: TObject);
begin
 f_GridDlg.SaveToHTML;
end;

procedure TtestForm.btnTuneGridClick(Sender: TObject);
begin
 f_GridDlg.Execute
end;

procedure TtestForm.FormCreate(Sender: TObject);
begin
  f_GridDlg:= MakeGridDlg('', cxGrid1);
  btnTuneGrid.PopupMenu:= f_GridDlg.GridPopupMenu;
end;

end.
