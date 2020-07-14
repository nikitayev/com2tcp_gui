object MainForm: TMainForm
  Left = 247
  Top = 113
  Width = 712
  Height = 468
  Caption = 'com2tcp GUI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    704
    437)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 690
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    Caption = 'TCP client mode'
    Constraints.MinWidth = 361
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 74
      Height = 13
      Caption = 'COM port name'
    end
    object Label2: TLabel
      Left = 112
      Top = 19
      Width = 62
      Height = 13
      Caption = 'Host address'
    end
    object Label3: TLabel
      Left = 271
      Top = 16
      Width = 41
      Height = 13
      Caption = 'host port'
    end
    object lbBaudRate_client: TLabel
      Left = 376
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Baud rate'
    end
    object Label5: TLabel
      Left = 536
      Top = 16
      Width = 21
      Height = 13
      Caption = 'data'
    end
    object Label7: TLabel
      Left = 376
      Top = 56
      Width = 25
      Height = 13
      Caption = 'parity'
    end
    object Label8: TLabel
      Left = 448
      Top = 56
      Width = 20
      Height = 13
      Caption = 'stop'
    end
    object cbPortNameClient: TComboBox
      Left = 7
      Top = 37
      Width = 98
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbPortNameClient'
    end
    object JvIPHostAddress: TJvIPAddress
      Left = 111
      Top = 37
      Width = 150
      Height = 21
      ParentColor = False
      TabOrder = 1
    end
    object JvSEHostPort: TJvSpinEdit
      Left = 270
      Top = 37
      Width = 73
      Height = 21
      MaxValue = 65535.000000000000000000
      Value = 1000.000000000000000000
      TabOrder = 2
    end
    object cbrfc2217mode_client: TCheckBox
      Left = 8
      Top = 64
      Width = 97
      Height = 17
      Hint = 
        'use RFC 2217 (c)lient or (s)erver mode (default is c for TCP cli' +
        'ent mode and s for TCP server mode)'
      Caption = 'rfc2217 mode'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object cbkeepactive_client: TCheckBox
      Left = 120
      Top = 64
      Width = 97
      Height = 17
      Hint = 
        'send NOP command every ^<s^> seconds to keep the connection acti' +
        've if data is not transferred.'
      Caption = 'keep active'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object btRunClient: TButton
      Left = 272
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 5
      OnClick = btRunClientClick
    end
    object cbBaudRate_client: TComboBox
      Left = 376
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 10
      TabOrder = 6
      Text = '9600'
      Items.Strings = (
        '75'
        '110'
        '150'
        '300'
        '600'
        '1200'
        '1800'
        '2400'
        '4800'
        '7200'
        '9600'
        '14400'
        '19200'
        '31250'
        '38400'
        '56000'
        '57600'
        '76800'
        '115200'
        '128000'
        '230400'
        '256000'
        '512000'
        '1024000'
        '2048000'
        '3000000'
        '4000000'
        '5000000')
    end
    object cbData_client: TComboBox
      Left = 536
      Top = 32
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = '8'
      Items.Strings = (
        '8'
        '7'
        '6'
        '5')
    end
    object cbParity_client: TComboBox
      Left = 376
      Top = 72
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = 'no'
      Items.Strings = (
        'no'
        'odd'
        'even'
        'mark'
        'space')
    end
    object cbStop_client: TComboBox
      Left = 448
      Top = 72
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = '1'
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object cbIgnoreDSR_client: TCheckBox
      Left = 528
      Top = 72
      Width = 97
      Height = 17
      Caption = 'ignore dsr'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 690
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    Caption = 'TCP server mode'
    Constraints.MinWidth = 361
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 19
      Width = 74
      Height = 13
      Caption = 'COM port name'
    end
    object Label6: TLabel
      Left = 111
      Top = 16
      Width = 45
      Height = 13
      Caption = 'listen port'
    end
    object Label9: TLabel
      Left = 376
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Baud rate'
    end
    object Label10: TLabel
      Left = 448
      Top = 56
      Width = 20
      Height = 13
      Caption = 'stop'
    end
    object Label11: TLabel
      Left = 376
      Top = 56
      Width = 25
      Height = 13
      Caption = 'parity'
    end
    object Label12: TLabel
      Left = 536
      Top = 16
      Width = 21
      Height = 13
      Caption = 'data'
    end
    object cbPortNameServer: TComboBox
      Left = 7
      Top = 37
      Width = 98
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbPortNameClient'
    end
    object JvSEListenPort: TJvSpinEdit
      Left = 111
      Top = 37
      Width = 73
      Height = 21
      Value = 1000.000000000000000000
      TabOrder = 1
    end
    object cbrfc2217mode_server: TCheckBox
      Left = 8
      Top = 64
      Width = 97
      Height = 17
      Hint = 
        'use RFC 2217 (c)lient or (s)erver mode (default is c for TCP cli' +
        'ent mode and s for TCP server mode)'
      Caption = 'rfc2217 mode'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object cbkeepactive_server: TCheckBox
      Left = 120
      Top = 64
      Width = 97
      Height = 17
      Hint = 
        'send NOP command every ^<s^> seconds to keep the connection acti' +
        've if data is not transferred.'
      Caption = 'keep active'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object btRunServer: TButton
      Left = 272
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 4
      OnClick = btRunServerClick
    end
    object cbBaudRate_server: TComboBox
      Left = 376
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 10
      TabOrder = 5
      Text = '9600'
      Items.Strings = (
        '75'
        '110'
        '150'
        '300'
        '600'
        '1200'
        '1800'
        '2400'
        '4800'
        '7200'
        '9600'
        '14400'
        '19200'
        '31250'
        '38400'
        '56000'
        '57600'
        '76800'
        '115200'
        '128000'
        '230400'
        '256000'
        '512000'
        '1024000'
        '2048000'
        '3000000'
        '4000000'
        '5000000')
    end
    object cbParity_server: TComboBox
      Left = 376
      Top = 72
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = 'no'
      Items.Strings = (
        'no'
        'odd'
        'even'
        'mark'
        'space')
    end
    object cbStop_server: TComboBox
      Left = 448
      Top = 72
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = '1'
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object cbIgnoreDSR_server: TCheckBox
      Left = 528
      Top = 72
      Width = 97
      Height = 17
      Caption = 'ignore dsr'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbData_server: TComboBox
      Left = 536
      Top = 32
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = '8'
      Items.Strings = (
        '8'
        '7'
        '6'
        '5')
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 418
    Width = 704
    Height = 19
    Panels = <>
  end
  object MemoConsole: TMemo
    Left = 0
    Top = 232
    Width = 697
    Height = 185
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 616
    Top = 40
    object FileRun: TFileRun
      Category = 'File'
      Browse = False
      BrowseDlg.Title = 'Run'
      Caption = '&Run...'
      Hint = 'Run|Runs an application'
      Operation = 'open'
      ShowCmd = scShowNormal
    end
  end
end
