object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1047#1072#1076#1072#1095#1080
  ClientHeight = 464
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 48
    Height = 18
    Caption = #1047#1072#1076#1072#1095#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 32
    Top = 365
    Width = 81
    Height = 40
    Caption = #1053#1072' '#1089#1077#1075#1086#1076#1085#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 365
    Width = 81
    Height = 40
    Caption = #1053#1072' '#1079#1072#1074#1090#1088#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 239
    Top = 365
    Width = 122
    Height = 40
    Caption = #1053#1072' '#1101#1090#1086#1081' '#1085#1077#1076#1077#1083#1077
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 509
    Top = 365
    Width = 100
    Height = 40
    Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
    TabOrder = 3
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 40
    Width = 745
    Height = 281
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = #1044#1077#1085#1100#1053#1077#1076#1077#1083#1080
        ReadOnly = True
        Title.Caption = #1076'/'#1085
        Width = 22
        Visible = True
      end
      item
        DropDownRows = 10
        Expanded = False
        FieldName = #1044#1072#1090#1072
        Width = 81
        Visible = True
      end
      item
        DropDownRows = 20
        Expanded = False
        FieldName = #1042#1088#1077#1084#1103
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1047#1072#1076#1072#1095#1072
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1052#1077#1089#1090#1086
        Width = 159
        Visible = True
      end
      item
        DropDownRows = 2
        Expanded = False
        FieldName = #1042#1099#1087#1086#1083#1085#1077#1085'a'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 239
    Top = 334
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 5
  end
  object Button6: TButton
    Left = 380
    Top = 365
    Width = 111
    Height = 40
    Caption = #1053#1072' '#1089#1083#1077#1076'. '#1085#1077#1076#1077#1083#1077
    TabOrder = 6
    OnClick = Button6Click
  end
  object RadioGroup1: TRadioGroup
    Left = 632
    Top = 327
    Width = 121
    Height = 78
    Items.Strings = (
      #1042#1089#1077
      #1042#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077
      #1053#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077)
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object CheckBox1: TCheckBox
    Left = 136
    Top = 424
    Width = 121
    Height = 22
    Caption = #1047#1072#1076#1072#1095#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
    TabOrder = 8
    OnClick = CheckBox1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 272
    Top = 425
    Width = 89
    Height = 21
    Date = 42114.962548715280000000
    Time = 42114.962548715280000000
    TabOrder = 9
    OnCloseUp = DateTimePicker1CloseUp
    OnChange = DateTimePicker1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 388
    Top = 425
    Width = 91
    Height = 21
    Date = 42114.962581956020000000
    Time = 42114.962581956020000000
    TabOrder = 10
    OnCloseUp = DateTimePicker2CloseUp
    OnChange = DateTimePicker2Change
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 664
  end
  object Table1: TTable
    DatabaseName = 'Planner'
    TableName = 'Tasks.db'
    Left = 704
  end
  object MainMenu1: TMainMenu
    Left = 256
    object N1: TMenuItem
      Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082' '#1079#1072#1076#1072#1095
      object N4: TMenuItem
        Caption = #1053#1072' '#1089#1077#1075#1086#1076#1085#1103
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1053#1072' '#1079#1072#1074#1090#1088#1072
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1053#1072' '#1101#1090#1086#1081' '#1085#1077#1076#1077#1083#1077
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1053#1072' '#1089#1083#1077#1076'. '#1085#1077#1076#1077#1083#1077
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N10Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N11: TMenuItem
        Caption = #1050#1086#1085#1090#1072#1082#1090#1099
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1103' '#1079#1072#1076#1072#1095
        OnClick = N13Click
      end
    end
    object N3: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N3Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 632
    Top = 424
    object N14: TMenuItem
      Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082' '#1079#1072#1076#1072#1095
      Default = True
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      OnClick = N15Click
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N17Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 384
  end
end
