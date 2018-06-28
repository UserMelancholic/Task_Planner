unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DBTables, DB, StdCtrls,DateUtils,
  ComCtrls, Menus, ShellApi, XPMan;
// ������ ShellApi ��� ������ �� ������� � ���� (����� ������ ������ TShellNotifyIcon)

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Table1: TTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Button6: TButton;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    PopupMenu1: TPopupMenu;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
  private
    { Private declarations }
//    DayOfWeek: TStringField;   // ���������� ������������ ����
    // ��������� ��� ������������ ����������� ���������� (��������� ��������� SYSCOMMAND),
    // ��� ����, ����� �������� ����������� �������� Windows  �� "���������� � ����"
    procedure ControlWindow(var Msg:TMessage); message WM_SYSCOMMAND;
    // ��������� ��� ��������� ������� ������ ���� �� ������ � ����
    procedure IconMouse(var Msg : TMessage); message WM_USER+1;
  public
    // ��������������� ��������� ��� ������ �� �������� (��������) � ����
    procedure Ic(n: integer; Icon: TIcon);

  end;

var
  Form1: TForm1;
  Present: TDateTime;       // �������
  StartOfNextWeek: TDateTime;
  d1, d2: TDateTime;
  strFilter1: string;   // ���������� ��� ���������� �������� ������� �� ���� "����"
  tmpDate: TDateTime;

implementation
uses
  Unit2, Unit3, Unit4, Unit5;
{$R *.dfm}

// ������ ������ "�� �������"
procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Label1.Caption := '������ �� �������';
  strFilter1 := '(���� = '''+FormatDateTime('dd/mm/yyyy',Now)+''')';
  Form1.Table1.Filter := strFilter1;
  Form1.Table1.Filtered := True;  // �������� �������
  // �������� ���������� ������� ��������� ���
   CheckBox1.Checked := False;
   DateTimePicker1.Visible := False;
   DateTimePicker2.Visible := False;
  RadioGroup1.ItemIndex := 0;  // ��� ��������� ������� �� ���� '����' �������
  // �� ���� "���������" �� ������ (������������� ����� � RadioGroup � 0-� ������� - ��� ������)
end;

// ������ ������ "�� ������"
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Label1.Caption := '������ �� ������';
  strFilter1 := '(���� = '''+FormatDateTime('dd/mm/yyyy',IncDay(Now,1))+''')';
  Form1.Table1.Filter := strFilter1;
  Form1.Table1.Filtered := True;  // �������� �������
  // �������� ���������� ������� ��������� ���
   CheckBox1.Checked := False;
   DateTimePicker1.Visible := False;
   DateTimePicker2.Visible := False;
  RadioGroup1.ItemIndex := 0;
end;

// ������ ������ "�� ���� ������"
procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.Label1.Caption := '������ �� ���� ������';
  Present:= Now; // Now - �������, ���������� ������� ���� � �����
  StartOfNextWeek := StartOfAWeek(YearOf(Present),WeekOf(Present)+1);

  strFilter1 := '(���� >= '''+ FormatDateTime('dd/mm/yyyy',Now)+''')' +  'and'+
         '(���� <  '''+ FormatDateTime('dd/mm/yyyy',StartOfNextWeek)+''')';
  Form1.Table1.Filter := strFilter1;
  Form1.Table1.Filtered := True;
  // �������� ���������� ������� ��������� ���
   CheckBox1.Checked := False;
   DateTimePicker1.Visible := False;
   DateTimePicker2.Visible := False;
  RadioGroup1.ItemIndex := 0;
end;

// ������ ������ "��� ������"
procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.Label1.Caption := '��� ������';
//  Form1.Table1.Filtered := False;
  strFilter1 := '';
  Form1.Table1.Filter := strFilter1;
  Form1.Table1.Filtered := True;
  // �������� ���������� ������� ��������� ���
   CheckBox1.Checked := False;
   DateTimePicker1.Visible := False;
   DateTimePicker2.Visible := False;
  RadioGroup1.ItemIndex := 0;
end;

// ������ ������ "�� ����. ������"
procedure TForm1.Button6Click(Sender: TObject);
begin
  Form1.Label1.Caption := '������ �� ��������� ������';
  Present:= Now; // Now - �������, ���������� ������� ���� � �����
  d1 := StartOfAWeek(YearOf(Present),WeekOf(Present)+1);
  d2 := StartOfAWeek(YearOf(Present),WeekOf(Present)+2);
  strFilter1 := '(���� >= '''+ FormatDateTime('dd/mm/yyyy',d1)+''')' +  'and'+
         '(���� <  '''+ FormatDateTime('dd/mm/yyyy',d2)+''')';
  Form1.Table1.Filter := strFilter1;
  Form1.Table1.Filtered := True;
  RadioGroup1.ItemIndex := 0;
  // �������� ���������� ������� ��������� ���
   CheckBox1.Checked := False;
   DateTimePicker1.Visible := False;
   DateTimePicker2.Visible := False;
end;

// �������������, ������������ ����� ��������� ��� ��� ������ ����� �� ������
procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then begin  // ������� CheckBox "�������� ���"
    // ���������� ���������� ������� ��������� ���
    DateTimePicker1.Date := Now;   // �������������� �������� - ������� ����
    DateTimePicker2.Date := DateTimePicker1.Date;   // �������������� �������� - ������� ����
    DateTimePicker1.Visible := True;
    DateTimePicker2.Visible := True;
    strFilter1 := '(���� = '''+FormatDateTime('dd/mm/yyyy',Now)+''')';
    Form1.Table1.Filter := strFilter1;
    Form1.Table1.Filtered := True;  // �������� �������
    RadioGroup1.ItemIndex := 0;  // ��� ��������� ������� �� ���� '����' �������
    Form1.Label1.Caption := '������ �� ������ � '+DateToStr(DateTimePicker1.Date)+' �� '+DateToStr(DateTimePicker2.Date);
  end
  else begin
    // �������� ���������� ������� ��������� ���
    DateTimePicker1.Visible := False;
    DateTimePicker2.Visible := False;
  end;
end;


// ����� ��������� ���� ���������
// ��������� ���������� ����� ��������� �������� � DateTimePicker1
procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin
  if DateTimePicker1.Date <> tmpDate then begin // �������� ���������� ���������� ���������� ����
    // ��� ��������� ���� ����� ��������� ��������� ���������� �� ����, � 2 ������ ���� ��������� !
    // (��� ���� ��� ����������� ������ ����� ����������).
    // ��� ���������� ���������� ���������� ���� � ���� ��������� ������� �������.
    // ���������� �������� ���� ��������� � ���������� ���������� tmpDate ��� ������ �������
    // � ��� ������ ������� ������� ��� �� �����������.
    tmpDate := DateTimePicker1.Date;   // ���������� �������� ���� � ���������� tmpDate ��� 1-� �������
    if DateTimePicker1.Date > DateTimePicker2.Date then begin
      ShowMessage('��������� ���� �� ����� ���� ������ ��������');
      DateTimePicker1.Date := DateTimePicker2.Date;  // ��������� ���� ������������� ������ ��������
      //    DateTimePicker1.Update;
    end;

    d1 := DateTimePicker1.Date;
    d2 := DateTimePicker2.Date;
    strFilter1 := '(���� >= '''+ FormatDateTime('dd/mm/yyyy',d1)+''')' +  'and'+
           '(���� <=  '''+ FormatDateTime('dd/mm/yyyy',d2)+''')';
    Form1.Table1.Filter := strFilter1;
    Form1.Table1.Filtered := True;
    RadioGroup1.ItemIndex := 0;
    Form1.Label1.Caption := '������ �� ������ � '+DateToStr(d1)+' �� '+DateToStr(d2)
  end;
end;

// ����������� ��� ������������ ��������� ����� ������ ��������� ���� � DateTimePicker1
procedure TForm1.DateTimePicker1CloseUp(Sender: TObject);
begin
  if DateTimePicker1.Date > DateTimePicker2.Date then begin
    DateTimePicker1.Date := DateTimePicker2.Date;  // ��������� ���� ������������� ������ ��������
  end;
end;

// ����� �������� ���� ���������
// ��������� ���������� ����� ��������� �������� � DateTimePicker2
procedure TForm1.DateTimePicker2Change(Sender: TObject);
begin
  if DateTimePicker2.Date <> tmpDate then begin // �������� ���������� ���������� ���������� ����
    // ��� ��������� ���� ����� ��������� ��������� ���������� �� ����, � 2 ������ ���� ��������� !
    // (��� ���� ��� ����������� ������ ����� ����������).
    // ��� ���������� ���������� ���������� ���� � ���� ��������� ������� �������.
    // ���������� �������� ���� ��������� � ���������� ���������� tmpDate ��� ������ �������
    // � ��� ������ ������� ������� ��� �� �����������.
    tmpDate := DateTimePicker2.Date;   // ���������� �������� ���� � ���������� tmpDate ��� 1-� �������

    if  DateTimePicker2.Date < DateTimePicker1.Date then begin
      ShowMessage('�������� ���� �� ����� ���� ������ ���������');
       DateTimePicker2.Date := DateTimePicker1.Date;
    end;
    d1 := DateTimePicker1.Date;
    d2 := DateTimePicker2.Date;
    strFilter1 := '(���� >= '''+ FormatDateTime('dd/mm/yyyy',d1)+''')' +  'and'+
           '(���� <=  '''+ FormatDateTime('dd/mm/yyyy',d2)+''')';
    Form1.Table1.Filter := strFilter1;
    Form1.Table1.Filtered := True;
    RadioGroup1.ItemIndex := 0;
    Form1.Label1.Caption := '������ �� ������ � '+DateToStr(d1)+' �� '+DateToStr(d2);
  end;
end;

// ����������� ��� ������������ ��������� ����� ������ �������� ���� � DateTimePicker2
procedure TForm1.DateTimePicker2CloseUp(Sender: TObject);
begin
  if  DateTimePicker2.Date < DateTimePicker1.Date then begin
    DateTimePicker2.Date := DateTimePicker1.Date;  // �������� ���� ������������� ������ ���������
  end;
end;


// ��������� ���������� ��� ����� �� ������ DBGrid-�
// � ���, ��� ����� �� ���������� ���� ����� ������ �������� �� ��������������
procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  if (Column.Field.DataType=ftBoolean) then begin  // ���������� ����
    Column.Grid.DataSource.DataSet.Edit;  // ��������� ������ ���� ������� � ����� �������������� (Edit)
                                          // ����� ����� ���� �������� �������� �� ���������������
    Column.Field.Value := not Column.Field.AsBoolean;  // ������ �������� �� ��������������� (True->False, False->True)
    Column.Grid.DataSource.DataSet.Post;  // ��������� ������ ����� �������� (����� Post)
  end;
end;

// ��������� ColEnter ���������� ����� ����������� ���� � ������ �������� ����(�������)
// ��� ����������� ���� �������� ���� �������� � ��� ����,
// �.�. �� ������ ��� ���� CheckBox � ����� �������� ���� ������ ����� ����
procedure TForm1.DBGrid1ColEnter(Sender: TObject);
begin
  with TDBGrid(Sender) do begin
    if (SelectedField.DataType = ftBoolean) then
      // Options - �������� DBGrid ���������� ������ ������ �������� ����
      Options := Options - [dgEditing]    // �������� �������������� ����������� ����
    else
      Options := Options + [dgEditing]    // �������� �������������� ��� ������ ������� ����
  end;
end;


// ���������� ��� ������ �� ������� (����)
procedure TForm1.DBGrid1ColExit(Sender: TObject);
var
  day: string;
begin
  with TDBGrid(Sender) do begin
    if (SelectedField.FieldName = '����') then begin
      // ��� ������ �� ���� '����' ���������� �������� ���� '����������' (�/�)
//     day := ShortDayNames[ DayOfWeek( SelectedField.AsDateTime ) ];
//      ShowMessage( IntToStr( DayOfWeek( SelectedField.AsDateTime )) );
      case DayOfTheWeek( SelectedField.AsDateTime ) of
        1: day := '��';
        2: day := '��';
        3: day := '��';
        4: day := '��';
        5: day := '��';
        6: day := '��';
        7: day := '��';
      end;
//      ShowMessage(day);
      Table1.FieldByName('����������').DataSet.Edit;  // ����������� ��������� ���� � ����� ��������������
      Table1.FieldByName('����������').Value := day;  // ������ ��������
//      Table1.FieldByName('����������').DataSet.Post; // �������� ��������
    end;
  end;
end;

// ��������� DrawColumnCell ���������� ����� DBGrid �������������� ������.
// ������� � ��� ��������� ��������� ����� � ����������� �� �������� ���� '���������':
//  - ���� ������ ���������, �� ������� ���� ������ �������,
//  - ���� ������ �� ���������, �� ������� ���� ������ �������.
// ����� � ���� ��������� ��� ����������� ���� ����� �������� CheckBox
procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Style: Integer;  // ����� ����������� CheckBox ��� ������� ������ ����������� ����
                    // (� �������� ��� ���)
begin
  // ������������ ������
//  with DBGrid1 do begin
  with TDBGrid(Sender) do begin
    if (Table1.FieldByName('��������a').AsBoolean <> True) then begin // �� ����������� ������
      // Canvas.Brush.Color:=clWhite;   // ��� ������ �� �����
      Canvas.Font.Color:=clRed;  // ������� �������� ����� ���� ������ ������� ������
    end else begin  // ����������� ������
      // Canvas.Brush.Color:=clWhite;   // ��� ������ �� �����
      Canvas.Font.Color:=clGreen; // ������� �������� ����� ������� ������
    end;
    // ���� ������ (������) ���� ��������, ��������� ����������� "������������" �����
    if  gdSelected in State then begin
      Canvas.Brush.Color:= clHighLight;
      Canvas.Font.Color := clHighLightText;
    end;
    // ������������ ������ �������� �����������
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;  // with

  // ��� ���������� ����� ������ CheckBox
  if (Column.Field.DataType = ftBoolean) then begin  // ���� ���� Boolean
    // �������������� ������, � ������� �� ����� ��������� TCheckBox

    TDBGrid(Sender).Canvas.FillRect(Rect);   // ������� �������� ����������� �������� � ������
                                            // (������� ������� True/False) ������� ������ ����
    // ���������� ����� CheckBox � ����������� �� �������� �������� ����
    if Column.Field.Value = True then { �������� ���� TRUE }
      Style := DFCS_CHECKED   // ������ ���������� ��������� CheckBox (� ��������)
		else
      Style := DFCS_BUTTONCHECK;  // ������ ����������� ��������� CheckBox (������ �������)
    // �������� ������� DrawFrameControl, ������� ������ �� ����� � ������������ ��������������
    // ����������� windows-control, ��� � ��������� �������� ������������
    // ������������� ����������� (� ����� ����� CheckBox � ��������� �����������)
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, Rect, DFC_BUTTON, Style);
	end;

end;

// ��������� KeyPress ���������� ����� ����������� ������� ������ � ������� ����
procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  with TDBGrid(Sender) do begin
    if (SelectedField.DataType = ftBoolean) then begin  // ���������� ����
      if (key = Chr(32)) then begin
        SelectedField.DataSet.Edit;  // ����������� ��������� ���� � ����� ��������������
        SelectedField.Value := not SelectedField.AsBoolean;  // �������� �������� �� ���������������
        SelectedField.DataSet.Post; // �������� ��������
      end;
    end;
  end;
end;

// ���������, ���������� ��� �������� ����� Form1
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
// var Result: Word; // ����������, � ������� �������� ��������� ������ ������������
begin
  if Application.MessageBox('����� �� ��������� ?', '��������', MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = idOk then
    Action := caFree   // The form is closed and all allocated memory for the form is freed.
  else
    Action := caNone;  // The form is not allowed to close, so nothing happens.
end;

// ���������, ���������� ��� �������� ����� Form1
// � ��� �� ��������� ������������� Table1 (������� Tasks) � ����������� � �������
// � ���� �� ��� - �� ������� ������� ����� ����� CreateTable ���������� Table1
// ����� ��� ������� DBGrid-a ��������� ���������� ������ ������ ��������
procedure TForm1.FormCreate(Sender: TObject);
var
  i: Word;                  // ������� �����
  tmpTime: TDateTime;       // ��� ������������ ������ �������
      // '00:00', '00:30', '01:00', '01:30', '02:00', ..., '23:30'
  fd: TextFile;  // �������� ���������� (����������) ��� ������ � ������
  text: string;  // ���������� ��� ��������� ��������� �� ���������� ����� ������
begin
  // ���������� ������ ������ (Table1) ��� Form1
  with Form1.Table1 do begin
    Active:=false; // ��������� ������� ����� ������
    DatabaseName:='Planner';// ��������� ��
    TableName:='Tasks.db';// ��� �������
    TableType:=ttParadox; //��� �������

    if not Table1.Exists then begin
      // ���� Table1(������� Tasks) �� ����������, ������� �� ��������� ����� CreateTable
      with FieldDefs do begin  // ���������� ���� �������
        Clear;// ������� ������ �����
        Add('��/�',ftAutoInc,0,true);
        Add('����������',ftString,2,false);
        Add('����',ftDate,0,true);
        Add('�����',ftTime,0,true);
        Add('������',ftString,50,true);
        Add('�����',ftString,25,false);
        Add('��������a',ftBoolean,0,false);
//        Add('Completed',ftBoolean,0,false);
      end;
      with IndexDefs do begin // ���������� ��� ������� �������
        Clear; // ������� ������ ��������
        Add('','��/�',[ixPrimary]); // ��������� ������ �� ���� �������������
                                    //(����� ������ �� �������/������������� ������)
        Add('indDateTime','����;�����',[ixCaseInsensitive]);
          // ������ ��� ���������� �� ���� � �������
      end;
      CreateTable; // ������� �������
    end; // if not Table1.Exists
//    Open;// ��������� ����� ������ (Table1)
  end;


  // ���������� ��������������� ������ ��� ������ ��������� �������� ��� ������� DBGrid-�
  // 1. ���������� ������ ��� �� ����� ������
  // � ���� '����' ����� �������� ���������� ������ �� ���������� ���
  Present:= Now; // Now - �������, ���������� ������� ����
//  DecodeDate(Present, Year, Month, Day);
  for i := 0 to 30 do
    Form1.DBGrid1.Columns[1].PickList.Add( FormatDateTime('dd/mm/yyyy', Present + i) );
  Form1.DBGrid1.Columns[1].DropDownRows := 15;  // ���������� ����� � ���������� ������

  // 2. ���������� ������ �������� ������� �� '00:00:00' �� '23:50:00' � ����� 10 �����
  // � ���� '�����' ����� �������� ���������� ������ � ����� ���������� ��� ������
  // ���� ������������ �������� � ����� � 10 ����� �� ����� ���������� - �� ������ ������ ����
  tmpTime := EncodeTime(0, 0, 0, 0);   // ��������� �������� ������� '00:00:00.000'
  for i := 0 to 143 do begin   // ������ ������ � ������� ����� � ���������� � 10 ����� (24�6=144 ��������)
    Form1.DBGrid1.Columns[2].PickList.Add( TimeToStr(tmpTime) );
    tmpTime := IncMinute(tmpTime, 10);
  end;
  Form1.DBGrid1.Columns[2].DropDownRows := 15;  // ���������� ����� � ���������� ������

  // 3. ���������� ������ ��� ������ �������� � ���� '������' (2-� �������, ��������� � 0)
  // ������ ����� ����������� ����� ������� � ��������� ���� � ������ TaskList.txt,
  // ������������� � ����������� Data\ � ���� ������ ������� � ������ ��������� ������ �������� ���� '������'
  if FileExists( ExtractFilePath(ParamStr(0))+'Data\TaskList.txt' ) then begin  // �������� ������������� �����
    // ���������� ����� � ������ - ���������� (����������) �������� ���������� (����������� �����)
    AssignFile(fd, ExtractFilePath(ParamStr(0))+'Data\TaskList.txt' );
    Reset(fd); // ��������� ��������� ���� ��� ������
    while not Eof(fd) do begin // ���� �� ��������� ����� �����
      ReadLn(fd, text); // ������ ���� ��������� � ���������� text
      Form1.DBGrid1.Columns[3].PickList.Add(text); // ��������� �������� � ������ ������ ���� '������'
    end;
    CloseFile(fd); // ��������� ����
  end;
  Form1.DBGrid1.Columns[3].DropDownRows := 15;  // ���������� ����� � ���������� ������

{
  // 4. ������ ��� ������ �������� � ���������� ���� '���������' (4-� �������, ��������� � 0)
  // �������� �������� True/False
  Form1.DBGrid1.Columns[5].PickList.Add('True');
  Form1.DBGrid1.Columns[5].PickList.Add('False');
  Form1.DBGrid1.Columns[5].DropDownRows := 2;  // ���������� ����� � ���������� ������
 }

  // ��� ������� ����� ���������� ��������� ��� ��� ������ ������ ����� �� ����������
  DateTimePicker1.Visible := False;
  DateTimePicker2.Visible := False;
end;

// ����� ���� "�����"
procedure TForm1.N10Click(Sender: TObject);
begin
  if Application.MessageBox('����� �� ��������� ?', '����������� �����', MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = idOk then
     Application.Terminate;
end;

// �������� �� ����� ���� ����������� \ ��������
procedure TForm1.N11Click(Sender: TObject);
begin
  Form2.Visible := True;  // ���������� Form2
  // ������������� ������ (����������) �� ���
  Form2.Table2.IndexName := 'indFamily';
  Form2.Table2.Open;
end;

// �������� �� ����� ���� ����������� \ ���������
procedure TForm1.N12Click(Sender: TObject);
begin
  Form3.Visible:= True;
end;

// �������� �� ����� ���� ����������� \ �������� �����
procedure TForm1.N13Click(Sender: TObject);
begin
  Form5.Visible := True;
end;

// ����� PopumMenu1 ������ � ���� "����������� �����"
procedure TForm1.N14Click(Sender: TObject);
begin
  Ic(2, Application.Icon); // ������� ������ �� ����
  ShowWindow(Handle, SW_SHOWNORMAL); // ��������������� ���� ��������� (Form1)
  ShowWindow(Application.Handle, SW_SHOW);  // ��������������� ������ ��������� � TaskBar
end;

// ����� PopumMenu1 ������ � ���� "��������"
procedure TForm1.N15Click(Sender: TObject);
begin
  Form2.Visible := True;  // ���������� Form2
  // ������������� ������ (����������) �� ���
  Form2.Table2.IndexName := 'indFamily';
  Form2.Table2.Open;
end;

// ����� PopumMenu1 ������ � ���� "�����"
procedure TForm1.N17Click(Sender: TObject);
begin
//  Ic(2, Application.Icon); // ������� ������ �� ����
  N10Click(nil);
end;

// �������� �� ����� ���� "� ���������"
procedure TForm1.N3Click(Sender: TObject);
begin
  Form4.Visible := True;
end;

// �������� �� ����� ���� ����������� ����� \ �� �������
procedure TForm1.N4Click(Sender: TObject);
begin
  Button1Click(nil);
end;

// �������� �� ����� ���� ����������� ����� \ �� ������
procedure TForm1.N5Click(Sender: TObject);
begin
  Button2Click(nil);
end;

// �������� �� ����� ���� ����������� ����� \ �� ���� ������
procedure TForm1.N6Click(Sender: TObject);
begin
  Button3Click(nil);
end;

// �������� �� ����� ���� ����������� ����� \ �� ����. ������
procedure TForm1.N7Click(Sender: TObject);
begin
  Button6Click(nil);
end;

// �������� �� ����� ���� ����������� ����� \ ��� ������
procedure TForm1.N8Click(Sender: TObject);
begin
  Button4Click(nil);
end;

// ����� ����� �������� � RadioGroup ������������ ������
// �������������� ������� ������� �� ���� '���������'
// (� ���������� � ������� �� ���� '����')
procedure TForm1.RadioGroup1Click(Sender: TObject);
var
  strFilter2: String;  // ��������� ��� ���������� ������� �� ���� '���������'
begin
  case RadioGroup1.ItemIndex of  // ������ �������� ������ � RadioGroup
    // 0 - ����� ���� �����
    0:  strFilter2 := '';    // ��� ������� �� ���� '���������'
    // 1 - ����� ����������� �����
    1:  if length(strFilter1) > 0 then // ��� ����� ������ �� ���� '����'
          // ��������� �������������� ������� �� ���� '���������' ����� ����� �������� and
          strFilter2 := 'and (��������a = True)'  // ����������� ������
        else  // ������ �� ���� '����' �� �����, �������
          // ������� �� ���� '���������' ����� ��� ��������� "and" �������
          strFilter2 := '(��������a = True)';  // ����������� ������
    // 2 - ����� �� ���������� �����
    2:  if length(strFilter1) > 0 then    // ��� ����� ������ �� ���� '����'
          strFilter2 := 'and (��������a <> True)'
                // �������� ���� '���������' �� True (��� ����� ��� False)
        else
          strFilter2 := '(��������a <> True)'
  end;
  // �������� ������� ������� - ��� ����� ������� � ���������� strFilter1 (�� ���� '����')
  // � ������� � ���������� strFilter2 (�� ���� '���������')
  Form1.Table1.Filter := strFilter1 + strFilter2;
  Form1.Table1.Filtered := True;  // �������� ������
end;


//**********************************************
//                    ����                     *
//**********************************************
{ ��� �������� � �������� ���� ������������ ������ ���� ������� Windows - Shell_NotifyIconData,
  ����������� ������� "������" ��������� �������:
  function Shell_NotifyIcon (dwMessage: DWORD; lpData: PNotifyIconData): BOOL; stdcall;
  � � �������� ���������� ������� ������������:
  dwMessage - ������������� ���������, ������� ���������� ������ � ����.
    ����� ��������� �������� NIM_ADD, NIM_DELETE,N IM_MODIFY;
  lpData - ��������� �� ��������� TNotifyIconData, � ������� �������� ���������� � ���������� ������;
  ������������ �������� - ��������� true ��� �������� ���������� �������� ��� false � ��������� ������.
  ��� ������� ������ �������� ��������� ������ � ����������� �� �������� ��������� dwMessage -
  � ��� ������, ��� ��� ������ ��� ���������� ��������� � ��������� TNotifyIconData.
}

// ��� ��������� ������ � ���� ������������ ����� TShellNotifyIcon ������ ShellApi
// Ic() - ��������������� ��������� ��� ������ � ��������
// ��������� � ��� �����:
// n - ����� �������� ( 1 - ��������, 2 - �������, 3 - ��������)
// � Icon - ���� ������ � ������� ����� ����������� ��� ��������
Procedure TForm1.Ic(n:Integer; Icon:TIcon);
  var Nim: TNotifyIconData;  // ��������� TNotifyIconData, � ������� ���������� ���������� � ���������� ������;
begin
  With Nim do
  begin
    cbSize:=SizeOf(Nim);  // ������ ������ ��������� TnotifyIconData
    Wnd:=Form1.Handle;    // ������������� ����, ������� ����� ����������� �� ��������� ����� ������
    uID:=1;               // �������������, �� �������� Wnd ���������� ���� ������;
    uFlags:=NIF_ICON or NIF_MESSAGE or NIF_TIP;  // �����, ������� ����� ��������� �������� NIF_ICON, NIF_MESSAGE, NIF_TIP;
    hIcon:=Icon.Handle;    // ������������� ������, ������� ����� ��������� � ����;
    uCallbackMessage:=WM_USER+1;  // ��� ���������, ������� ����� ��������� �� ������ � ����
                                  // � ������� �� ����� ������������ � ��������� IconMouse()
    szTip:='����������� �����';   // ������ ����������� ��������� ��� ��������� �� ������ ��������� ����
  end;
  Case n OF
    1: Shell_NotifyIcon(Nim_Add,@Nim);
    2: Shell_NotifyIcon(Nim_Delete,@Nim);
    3: Shell_NotifyIcon(Nim_Modify,@Nim);
  end;
end;

// ��������� ��� ������������ ����������� ���������� (��������� ��������� SYSCOMMAND),
// ��� ����, ����� �������� ����������� �������� Windows  �� "���������� � ����"
procedure TForm1.ControlWindow(var Msg:TMessage);
begin
  if Msg.WParam=SC_MINIMIZE then begin
    Ic(1, Application.Icon); // ��������� ������ � ����
    ShowWindow(Handle, SW_HIDE); // �������� ���� ��������� (���� Form1)
    ShowWindow(Application.Handle, SW_HIDE); // �������� ������ ��������� �� TaskBar
  end
  else inherited;  // ��������� ������ ������ ����������� �� �������� ������ (�.�. �� ��������)
end;

// ��������� ��� ��������� ������� ������ ���� �� ������ � ����
procedure TForm1.IconMouse(var Msg:TMessage);
var p:tpoint;  // ��������� ��� �������� �������� ��������� ������� ����
begin
  GetCursorPos(p); // ���������� ���������� ������� ����
  case Msg.LParam of // ��������� ����� ������ ���� ������
    WM_LBUTTONUP:  {��������, ����������� �� ���������� ������ ������ ���� }
      begin
        // ������ �� ������
      end;
    WM_LBUTTONDBLCLK: {��������, ����������� �� �������� ������ ����� ������ ���� �� ������.
                    � ����� ������ ��� ������ ��������� ����������}
      begin
        Ic(2, Application.Icon); // ������� ������ �� ����
        ShowWindow(Handle, SW_SHOWNORMAL); // ��������������� ���� ��������� (���� Form1)
        ShowWindow(Application.Handle, SW_SHOW);  // ��������������� ������ ��������� � TaskBar
      end;
    WM_RBUTTONUP: {��������, ����������� �� ���������� ������ ������ ������ ����}
      begin
        SetForegroundWindow(Handle); // ��������������� ��������� � �������� ��������� ����
        PopupMenu1.Popup(p.X, p.Y); // �������� PopupMenu ��� ������ � ����
        PostMessage(Handle,WM_NULL,0,0) // �������� ��������� ��� ��������� ����
      end;
  end;
end;


end.
