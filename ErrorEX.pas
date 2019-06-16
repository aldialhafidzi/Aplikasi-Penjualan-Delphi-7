unit ErrorEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    img1: TImage;
    pnl2: TPanel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Home;

{$R *.dfm}

procedure TForm4.btn1Click(Sender: TObject);
begin
 Form4.Hide;
 Form1.Enabled := True;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Form4.Visible := False;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := True;
end;

end.
