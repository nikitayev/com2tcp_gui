unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, JvExMask, JvSpin, JvExControls,
  JvComCtrls, ActnList, ExtActns;

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbPortNameClient: TComboBox;
    JvIPHostAddress: TJvIPAddress;
    Label2: TLabel;
    JvSEHostPort: TJvSpinEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    cbPortNameServer: TComboBox;
    JvSEListenPort: TJvSpinEdit;
    cbrfc2217mode_client: TCheckBox;
    cbkeepactive_client: TCheckBox;
    cbrfc2217mode_server: TCheckBox;
    cbkeepactive_server: TCheckBox;
    btRunClient: TButton;
    btRunServer: TButton;
    StatusBar1: TStatusBar;
    cbBaudRate_client: TComboBox;
    lbBaudRate_client: TLabel;
    cbData_client: TComboBox;
    Label5: TLabel;
    cbParity_client: TComboBox;
    Label7: TLabel;
    cbStop_client: TComboBox;
    Label8: TLabel;
    cbIgnoreDSR_client: TCheckBox;
    cbBaudRate_server: TComboBox;
    Label9: TLabel;
    cbParity_server: TComboBox;
    cbStop_server: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cbIgnoreDSR_server: TCheckBox;
    cbData_server: TComboBox;
    Label12: TLabel;
    MemoConsole: TMemo;
    ActionList: TActionList;
    FileRun: TFileRun;
    procedure btRunClientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btRunServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure EnumComPorts(Ports: TStrings);
var
  KeyHandle: HKEY;
  ErrCode, Index: integer;
  ValueName: string;
  Data: ansistring;
  ValueLen, DataLen, ValueType: DWORD;
  TmpPorts: TStringList;
begin
  ErrCode := RegOpenKeyEx(HKEY_LOCAL_MACHINE, 'HARDWARE\DEVICEMAP\SERIALCOMM', 0, KEY_READ, KeyHandle);
  if ErrCode <> ERROR_SUCCESS then
  begin
    // raise EComPort.Create(CEMess[15]);
    Ports.Clear;
    exit;
  end;
  TmpPorts := TStringList.Create;
  TmpPorts.BeginUpdate;
  try
    Index := 0;
    repeat
      ValueLen := 256;
      DataLen := 256;
      SetLength(ValueName, ValueLen);
      SetLength(Data, DataLen);
      ErrCode := RegEnumValue(KeyHandle, Index, pansichar(ValueName),
{$IFDEF VER120}
        cardinal(ValueLen),
{$ELSE}
        ValueLen,
{$ENDIF}
        nil, @ValueType, PByte(pansichar(Data)), @DataLen);
      if ErrCode = ERROR_SUCCESS then
      begin
        SetLength(Data, DataLen);
        TmpPorts.Add(StringReplace(string(Data), #0, '', [rfReplaceAll, rfIgnoreCase]));
        Inc(Index);
      end
      else
        if ErrCode <> ERROR_NO_MORE_ITEMS then
      begin
        // raise EComPort.Create(CEMess[15]);
        break;
      end;
    until (ErrCode <> ERROR_SUCCESS);
    TmpPorts.Sort;
    Ports.Assign(TmpPorts);
  finally
    RegCloseKey(KeyHandle);
    TmpPorts.EndUpdate;
    TmpPorts.Free;
  end;
end;

procedure TMainForm.btRunClientClick(Sender: TObject);
var
  zRFC2217: string;
  zKeepAlive: string;  
  zcmd: string;
  zbatname: string;
  zbat: TStringList;
begin
  zbatname := ExtractFilePath(ParamStr(0)) + 'setup_client.bat';

  if (cbrfc2217mode_client.Checked) then    
  zRFC2217 := ' --rfc2217-mode ' else
  zRFC2217 := '';
  
  if (cbkeepactive_client.Checked) then    
  zKeepAlive := ' --keep-active ' else
  zKeepAlive := '';

  zcmd := zcmd + ' --baud ' + cbBaudRate_client.Text;
  zcmd := zcmd + ' --data ' + cbData_client.Text;
  zcmd := zcmd + ' --parity ' + cbParity_client.Text;
  zcmd := zcmd + ' --stop ' + cbStop_client.Text;
  if (cbIgnoreDSR_client.Checked) then
    zcmd := zcmd + ' --ignore-dsr ' 
  else
    zcmd := zcmd + ' ';

  zcmd := ExtractFilePath(ParamStr(0)) + 'com2tcp.exe ' +
    zcmd +
    zRFC2217 + zKeepAlive +
    '\\.\' + cbPortNameClient.Text + ' ' + 
    JvIPHostAddress.Text + ' ' +
    JvSEHostPort.Text;
  MemoConsole.Lines.Add(zcmd);

  zbat := TStringList.Create;
  try
    zbat.Add(zcmd);
    zbat.Add('pause');
    zbat.SaveToFile(zbatname);
    FileRun.Directory := ExtractFilePath(ParamStr(0));
    FileRun.FileName := zbatname;
    FileRun.Execute;
  finally
    FreeAndNil(zbat);
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  EnumComPorts(cbPortNameClient.Items);
  cbPortNameServer.Items.Assign(cbPortNameClient.Items);
  if (cbPortNameClient.Items.Count > 0) then
  begin
    cbPortNameClient.ItemIndex := 0;
    cbPortNameServer.ItemIndex := 0;
  end;
end;

procedure TMainForm.btRunServerClick(Sender: TObject);
var
  zRFC2217: string;
  zKeepAlive: string;  
  zcmd: string;
  zbatname: string;
  zbat: TStringList;
begin
  zbatname := ExtractFilePath(ParamStr(0)) + 'setup_server.bat';

  if (cbrfc2217mode_server.Checked) then    
  zRFC2217 := ' --rfc2217-mode ' else
  zRFC2217 := '';
  
  if (cbkeepactive_server.Checked) then    
  zKeepAlive := ' --keep-active ' else
  zKeepAlive := '';

  zcmd := zcmd + ' --baud ' + cbBaudRate_server.Text;
  zcmd := zcmd + ' --data ' + cbData_server.Text;
  zcmd := zcmd + ' --parity ' + cbParity_server.Text;
  zcmd := zcmd + ' --stop ' + cbStop_server.Text;
  if (cbIgnoreDSR_server.Checked) then
    zcmd := zcmd + ' --ignore-dsr ' 
  else
    zcmd := zcmd + ' ';

  zcmd := ExtractFilePath(ParamStr(0)) + 'com2tcp.exe ' +
    zcmd +
    zRFC2217 + zKeepAlive +
    '\\.\' + cbPortNameServer.Text + ' ' + 
    JvSEListenPort.Text;

  MemoConsole.Lines.Add(zcmd);
  zbat := TStringList.Create;
  try
    zbat.Add(zcmd);
    zbat.Add('pause');
    zbat.SaveToFile(zbatname);
    FileRun.Directory := ExtractFilePath(ParamStr(0));
    FileRun.FileName := zbatname;
    FileRun.Execute;
  finally
    FreeAndNil(zbat);
  end;
end;

end.
