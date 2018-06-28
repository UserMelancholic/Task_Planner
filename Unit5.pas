unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
uses Unit1;

{$R *.dfm}

// ��������� ���� � Memo1
procedure TForm5.Button1Click(Sender: TObject);
begin
//  if OpenTextFileDialog1.Execute then memo1.Lines.LoadFromFile(OpenTextFileDialog1.FileName)
  if FileExists( ExtractFilePath(ParamStr(0))+'Data\TaskList.txt' ) then begin  // �������� ������������� �����
    Memo1.Lines.LoadFromFile( ExtractFilePath(ParamStr(0))+'Data\TaskList.txt' )
  end;
end;

// ��������� ���������� Memo1 � ����
procedure TForm5.Button2Click(Sender: TObject);
begin
//if SaveTextFileDialog1.Execute then
//    Memo1.Lines.SaveToFile( SaveTextFileDialog1.FileName );
  if Application.MessageBox('�� �������, ��� ������ �������� � ���� ���� ������ ����� ?', '��������', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=idYes then
    Memo1.Lines.SaveToFile( ExtractFilePath(ParamStr(0))+'Data\TaskList.txt' );
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  // ����� ������� �� ������������� ������� ������
// MessageBox(handle, PChar('�����'),PChar('���������'), MB_ICONSTOP+MB_YESNOCANCEL+MB_DEFBUTTON2);
  if Application.MessageBox('�� �������, ��� ������ �������� ������ ?', '��������', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=idYes then
    Memo1.Clear;
end;

// ���������� ������ ��� ������������ �� �������� ����������� Memo1
procedure TForm5.Button4Click(Sender: TObject);
begin
  // ����������� ������ ��� ������ �������� � ���� '������' (2-� �������, ��������� � 0)
  Form1.DBGrid1.Columns[3].PickList := Memo1.Lines;
  ShowMessage('������ �������� ����� ��� ������������ ��� ���������');
end;


end.
