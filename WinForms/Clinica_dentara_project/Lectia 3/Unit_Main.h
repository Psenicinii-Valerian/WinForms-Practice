//---------------------------------------------------------------------------

#ifndef Unit_MainH
#define Unit_MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Buttons.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TMain : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TPanel *Panel3;
	TPageControl *PageControl1;
	TTabSheet *Autentificare;
	TTabSheet *Client;
	TTabSheet *Medic;
	TTabSheet *Cartela;
	TImageList *ImageList1;
	TImage *Image1;
	TLabel *Label1;
	TLabel *Label2;
	TTimer *Timer1;
	TPanel *Panel4;
	TPanel *Panel5;
	TImage *Image2;
	TLabel *Label3;
	TEdit *Edit1;
	TEdit *Edit2;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TTabSheet *Filiala;
	TPanel *Panel6;
	TPanel *Panel7;
	TSpeedButton *SpeedButton3;
	TDBGrid *DBGrid1;
	TPanel *Panel8;
	TPanel *Panel9;
	TDBGrid *DBGrid2;
	TSpeedButton *SpeedButton4;
	TSpeedButton *SpeedButton5;
	TPanel *Panel10;
	TPanel *Panel11;
	TDBGrid *DBGrid3;
	TTabSheet *Main_C;
	TTabSheet *Ins_C;
	TTabSheet *Edit_C;
	TPageControl *PageControl2;
	TSpeedButton *SpeedButton6;
	TSpeedButton *SpeedButton7;
	TSpeedButton *SpeedButton8;
	TEdit *Edit3;
	TSpeedButton *SpeedButton9;
	TSpeedButton *SpeedButton10;
	TLabel *Label4;
	TEdit *Edit4;
	TLabel *Label5;
	TEdit *Edit5;
	TLabel *Label6;
	TLabel *Label8;
	TEdit *Edit7;
	TDateTimePicker *DateTimePicker1;
	TLabel *Label9;
	TEdit *Edit6;
	TLabel *Label10;
	TEdit *Edit8;
	TSpeedButton *SpeedButton11;
	TSpeedButton *SpeedButton12;
	TDateTimePicker *DateTimePicker2;
	TSpeedButton *SpeedButton13;
	TSpeedButton *SpeedButton14;
	TLabel *Label11;
	TEdit *Edit9;
	TLabel *Label12;
	TEdit *Edit10;
	TDateTimePicker *DateTimePicker3;
	TEdit *Edit11;
	TLabel *Label13;
	TLabel *Label14;
	TEdit *Edit12;
	TLabel *Label15;
	TEdit *Edit13;
	TLabel *Label16;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall SpeedButton2Click(TObject *Sender);
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall Panel7Resize(TObject *Sender);
	void __fastcall FilialaShow(TObject *Sender);
	void __fastcall Panel9Resize(TObject *Sender);
	void __fastcall MedicShow(TObject *Sender);
	void __fastcall Edit3Change(TObject *Sender);
	void __fastcall SpeedButton6Click(TObject *Sender);
	void __fastcall SpeedButton7Click(TObject *Sender);
	void __fastcall SpeedButton12Click(TObject *Sender);
	void __fastcall SpeedButton13Click(TObject *Sender);
	void __fastcall SpeedButton11Click(TObject *Sender);
	void __fastcall SpeedButton14Click(TObject *Sender);
	void __fastcall SpeedButton8Click(TObject *Sender);


private:	// User declarations
public:		// User declarations
	__fastcall TMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMain *Main;
//---------------------------------------------------------------------------
#endif
