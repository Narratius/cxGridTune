object GridTuneDialog: TGridTuneDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1074#1086#1081#1089#1090#1074
  ClientHeight = 257
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 332
    Top = 7
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 332
    Top = 38
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object btnExcel: TButton
    Left = 8
    Top = 226
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 2
    OnClick = itemSaveToExcelClick
  end
  object btnCSV: TButton
    Left = 89
    Top = 226
    Width = 75
    Height = 25
    Caption = 'CSV'
    TabOrder = 3
    OnClick = itemSaveToCSVClick
  end
  object btnHTML: TButton
    Left = 170
    Top = 226
    Width = 75
    Height = 25
    Caption = 'HTML'
    TabOrder = 4
    OnClick = itemSaveToHTMLClick
  end
  object btnXML: TButton
    Left = 251
    Top = 226
    Width = 75
    Height = 25
    Caption = 'XML'
    TabOrder = 5
    OnClick = itemSaveToXMLClick
  end
  object btnText: TButton
    Left = 332
    Top = 226
    Width = 75
    Height = 25
    Caption = #1058#1077#1082#1089#1090
    TabOrder = 6
    OnClick = itemSaveToTextClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 318
    Height = 129
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100
    TabOrder = 7
    object CheckFilterRow: TCheckBox
      Left = 12
      Top = 51
      Width = 257
      Height = 17
      Caption = #1057#1090#1088#1086#1082#1072' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
      TabOrder = 0
    end
    object CheckNewItemRow: TCheckBox
      Left = 12
      Top = 66
      Width = 241
      Height = 17
      Caption = #1057#1090#1088#1086#1082#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      TabOrder = 1
    end
    object checkInfoPanel: TCheckBox
      Left = 28
      Top = 100
      Width = 225
      Height = 17
      Caption = #1055#1072#1085#1077#1083#1100' '#1085#1072#1074#1080#1075#1072#1090#1086#1088#1072
      TabOrder = 2
    end
    object CheckNavigator: TCheckBox
      Left = 12
      Top = 84
      Width = 153
      Height = 17
      Caption = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      TabOrder = 3
      OnClick = CheckNavigatorClick
    end
    object checkFilterBox: TCheckBox
      Left = 12
      Top = 36
      Width = 209
      Height = 13
      Caption = #1055#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072
      TabOrder = 4
    end
    object checkFindPanel: TCheckBox
      Left = 12
      Top = 16
      Width = 97
      Height = 17
      Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 143
    Width = 318
    Height = 77
    Caption = #1056#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
    TabOrder = 8
    object radioInplace: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = #1042' '#1089#1090#1088#1086#1082#1077
      TabOrder = 0
      OnClick = radioInplaceClick
    end
    object radioInForm: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 13
      Caption = #1074' '#1089#1090#1088#1086#1082#1077' '#1074' '#1092#1086#1088#1084#1077
      TabOrder = 1
      OnClick = radioInplaceClick
    end
    object checkEditModeAdv: TCheckBox
      Left = 24
      Top = 56
      Width = 113
      Height = 17
      Caption = #1047#1072#1084#1077#1097#1072#1090#1100' '#1089#1090#1088#1086#1082#1091
      TabOrder = 2
    end
  end
  object GridPopupMenu: TPopupMenu
    Left = 336
    Top = 88
    object itemSaveToExcel: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1050#1085#1080#1075#1091' Excel...'
      OnClick = itemSaveToExcelClick
    end
    object itemSaveToText: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1090#1077#1082#1089#1090'...'
      OnClick = itemSaveToTextClick
    end
    object itemSaveToCSV: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' CSV...'
      OnClick = itemSaveToCSVClick
    end
    object itemSaveToXML: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1058#1072#1073#1083#1080#1094#1091' XML...'
      OnClick = itemSaveToXMLClick
    end
    object itemSaveToHTML: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1042#1077#1073' '#1089#1090#1088#1072#1085#1080#1094#1091'...'
      OnClick = itemSaveToHTMLClick
    end
    object itemDivider2: TMenuItem
      Caption = '-'
    end
    object itemPrint: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100'...'
    end
    object itemDivider: TMenuItem
      Caption = '-'
    end
    object itemStoreToRegistry: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1072#1089#1082#1083#1072#1076#1082#1091
      OnClick = itemStoreToRegistryClick
    end
    object itemRestoreFromRegistry: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1072#1089#1082#1083#1072#1076#1082#1091
      OnClick = itemRestoreFromRegistryClick
    end
  end
end
