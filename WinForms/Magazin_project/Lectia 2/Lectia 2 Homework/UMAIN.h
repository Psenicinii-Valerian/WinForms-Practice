//---------------------------------------------------------------------------

#ifndef UMAINH
#define UMAINH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Buttons.hpp>
#include <Data.DB.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Imaging.pngimage.hpp>
//---------------------------------------------------------------------------
class TFMAIN : public TForm
{
__published:	// IDE-managed Components
	TSpeedButton *SpeedButton1;
	void __fastcall SpeedButton1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFMAIN(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFMAIN *FMAIN;
//---------------------------------------------------------------------------
#endif
