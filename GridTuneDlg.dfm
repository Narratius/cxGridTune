object GridTuneDialog: TGridTuneDialog
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1074#1086#1081#1089#1090#1074
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 140
    Height = 13
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1087#1072#1085#1077#1083#1080' '#1092#1080#1083#1100#1090#1088#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 131
    Height = 13
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1087#1072#1085#1077#1083#1080' '#1087#1086#1080#1089#1082#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 63
    Width = 120
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
  end
  object comboFilterBox: TComboBox
    Left = 154
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      #1053#1080#1082#1086#1075#1076#1072
      #1045#1089#1083#1080' '#1085#1077' '#1087#1091#1089#1090#1086#1081
      #1042#1089#1077#1075#1076#1072)
  end
  object btnOK: TButton
    Left = 528
    Top = 16
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 6
  end
  object btnCancel: TButton
    Left = 528
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object comboFindPanel: TComboBox
    Left = 154
    Top = 35
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      #1053#1080#1082#1086#1075#1076#1072
      #1042#1088#1091#1095#1085#1091#1102
      #1042#1089#1077#1075#1076#1072)
  end
  object CheckNavigator: TCheckBox
    Left = 8
    Top = 89
    Width = 153
    Height = 17
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1085#1072#1074#1080#1075#1072#1090#1086#1088#1072
    TabOrder = 3
    OnClick = CheckNavigatorClick
  end
  object CheckNewItemRow: TCheckBox
    Left = 8
    Top = 129
    Width = 241
    Height = 17
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1089#1090#1088#1086#1082#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
    TabOrder = 4
  end
  object CheckFilterRow: TCheckBox
    Left = 8
    Top = 153
    Width = 257
    Height = 17
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1089#1090#1088#1086#1082#1080' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
    TabOrder = 5
  end
  object ComboEditMode: TComboBox
    Left = 154
    Top = 62
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      #1042' '#1089#1090#1088#1086#1082#1077
      #1042' '#1089#1090#1088#1086#1082#1077' '#1074' '#1092#1086#1088#1084#1077
      #1042' '#1089#1090#1088#1086#1082#1077' '#1074' '#1092#1086#1088#1084#1077' '#1074#1084#1077#1089#1090#1086' '#1089#1090#1088#1086#1082#1080)
  end
  object checkInfoPanel: TCheckBox
    Left = 24
    Top = 106
    Width = 225
    Height = 17
    Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1087#1072#1085#1077#1083#1080' '#1085#1072#1074#1080#1075#1072#1090#1086#1088#1072
    TabOrder = 8
  end
end
