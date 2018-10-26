object testForm: TtestForm
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' TcxGrid '
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 619
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Title: TcxGridDBColumn
        DataBinding.FieldName = 'Title'
        Width = 240
      end
      object cxGrid1DBTableView1Value: TcxGridDBColumn
        DataBinding.FieldName = 'Value'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object btnTuneGrid: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
    TabOrder = 1
    OnClick = btnTuneGridClick
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0200000064000000010006005469746C6500040000
      000300060056616C7565000108000000CAF0EEEAEEE4E8EB010F000000010900
      0000C0EBEBE8E3E0F2EEF0010A0000000106000000CAE0E9ECE0ED0104000000
      0107000000C1E5E3E5ECEEF20101000000}
    SortOptions = []
    Left = 528
    Top = 8
    object dxMemData1Title: TStringField
      FieldName = 'Title'
      Size = 100
    end
    object dxMemData1Value: TIntegerField
      FieldName = 'Value'
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 576
    Top = 8
  end
end
