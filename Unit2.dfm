object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1090#1072#1082#1090#1099
  ClientHeight = 392
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 12
    Width = 111
    Height = 16
    Caption = #1060#1080#1083#1100#1090#1088#1099' '#1087#1086' '#1087#1086#1083#1103#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid2: TDBGrid
    Left = 24
    Top = 64
    Width = 873
    Height = 257
    DataSource = DataSource2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #1060#1048#1054
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1052#1086#1073'.'#1090#1077#1083#1077#1092#1086#1085
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1056#1086#1073'.'#1090#1077#1083#1077#1092#1086#1085
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1044#1086#1084'.'#1090#1077#1083#1077#1092#1086#1085
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'E-mail'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1040#1076#1088#1077#1089
        Width = 127
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 296
    Top = 343
    Width = 240
    Height = 25
    DataSource = DataSource2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 40
    Top = 37
    Width = 154
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 200
    Top = 37
    Width = 105
    Height = 21
    TabOrder = 3
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 311
    Top = 37
    Width = 98
    Height = 21
    TabOrder = 4
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 415
    Top = 37
    Width = 98
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 519
    Top = 37
    Width = 98
    Height = 21
    TabOrder = 6
  end
  object Edit6: TEdit
    Left = 623
    Top = 37
    Width = 122
    Height = 21
    TabOrder = 7
  end
  object Edit7: TEdit
    Left = 751
    Top = 37
    Width = 122
    Height = 21
    TabOrder = 8
  end
  object Table2: TTable
    DatabaseName = 'Planner'
    OnFilterRecord = Table2FilterRecord
    TableName = 'Phones.db'
    Left = 864
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 824
    Top = 8
  end
end
