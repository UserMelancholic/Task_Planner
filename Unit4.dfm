object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 370
  ClientWidth = 518
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 169
    Top = 191
    Width = 256
    Height = 114
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1050#1080#1077#1074#1089#1082#1072#1103' '#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1072#1082#1072#1076#1077#1084#1080#1103
      #1074#1086#1076#1085#1086#1075#1086' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1080#1084'. '#1075#1077#1090#1100#1084#1072#1085#1072
      #1055#1077#1090#1088#1072' '#1050#1086#1085#1072#1096#1077#1074#1080#1095#1072'-'#1057#1072#1075#1072#1081#1076#1072#1095#1085#1086#1075#1086
      #1092#1072#1082#1091#1083#1100#1090#1077#1090' '#1101#1082#1086#1085#1086#1084#1080#1082#1080' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      #1075#1088#1091#1087#1087#1072' '#1055#1048'-1419'
      #1041#1077#1083#1086#1073#1088#1086#1074#1080#1082' '#1057#1077#1088#1075#1077#1081' ')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 64
    Top = 24
    Width = 377
    Height = 57
    BevelInner = bvRaised
    BevelKind = bkSoft
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 16
      Width = 282
      Height = 19
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' "'#1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082' '#1079#1072#1076#1072#1095'" v1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Memo2: TMemo
    Left = 169
    Top = 103
    Width = 256
    Height = 66
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1088#1077#1072#1083#1080#1079#1091#1077#1090' '#1092#1091#1085#1082#1094#1080#1080' '
      #1087#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082#1072' '#1079#1072#1076#1072#1095' '#1080' '#1087#1086#1079#1074#1086#1083#1103#1077#1090
      #1074#1077#1089#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074'.')
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 352
    Top = 328
    Width = 73
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = Button1Click
  end
end
