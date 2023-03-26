//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UMAIN.h"
#include "UDM.h"
#include "URECEPTIE.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFMAIN *FMAIN;
//---------------------------------------------------------------------------
__fastcall TFMAIN::TFMAIN(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TFMAIN::SpeedButton3Click(TObject *Sender)
{
	FRECEPTIE->ShowModal();
}
//---------------------------------------------------------------------------

