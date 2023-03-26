//---------------------------------------------------------------------------

#ifndef UCHECKH
#define UCHECKH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Buttons.hpp>
//---------------------------------------------------------------------------
class TFCheck : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *Label2;
	TLabel *Label3;
	TDateTimePicker *DateTimePicker1;
	TDateTimePicker *DateTimePicker2;
	TPanel *Panel2;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TTabSheet *TabSheet2;
	TDBGrid *DBGrid1;
	TPanel *Panel3;
	TDBGrid *DBGrid2;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall DBGrid2DblClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall SpeedButton2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFCheck(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCheck *FCheck;
//---------------------------------------------------------------------------
#endif
