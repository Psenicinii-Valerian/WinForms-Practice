//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "URECEPTIE.h"
#include "UDM.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFRECEPTIE *FRECEPTIE;
int EMITENT_ID;
//---------------------------------------------------------------------------
__fastcall TFRECEPTIE::TFRECEPTIE(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFRECEPTIE::FormShow(TObject *Sender)
{
    FACTURA->TabVisible=true;
	UM->TabVisible=false;
	EMITENT->TabVisible=false;
	PRODUS->TabVisible=false;
}
//---------------------------------------------------------------------------


void __fastcall TFRECEPTIE::EMITENT_FKeyPress(TObject *Sender, System::WideChar &Key)

{
    Key=0;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton19Click(TObject *Sender)
{
	DM->QEmitent->Close();
	DM->QEmitent->Open();

	TabSheet1->TabVisible=true;   //main emitent
	 TabSheet2->TabVisible=false;  //inregistrare emitent
	  TabSheet3->TabVisible=false;  //editare emitent

	DM->QEmitent->Close();
	DM->QEmitent->Open();
	FACTURA->TabVisible=false;
	EMITENT->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton12Click(TObject *Sender)
{
	EMITENT_F->Text = DM->QEmitent->FieldByName("denumire")->AsString;
	EMITENT_ID = DM->QEmitent->FieldByName("EMITENT_ID")->AsInteger;
	FACTURA->TabVisible=true;
	EMITENT->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton15Click(TObject *Sender)
{
	FACTURA->TabVisible=false;
	EMITENT->TabVisible=true;
	EDIT_F->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::B_IDENTIFICAClick(TObject *Sender)
{
	if((NR_F->Text!="")&&(EMITENT_F->Text!=""))
	{
	  DM->QLiber->Close();
	  DM->QLiber->SQL->Clear();
	  DM->QLiber->SQL->Add(" SELECT FACTURA_REC_ID FROM FACTURA_REC WHERE EMITENT_ID=:ID ");
	  DM->QLiber->SQL->Add(" AND NR_FACTURA=:NR AND DATA_FACTURA=:DATAF ");
	  DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
	  DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
	  DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
	  DM->QLiber->Open();
	}
	else
	{
	  ShowMessage("Nu sunt introduse toate datele necesare!!!!");
	}
}
//---------------------------------------------------------------------------

