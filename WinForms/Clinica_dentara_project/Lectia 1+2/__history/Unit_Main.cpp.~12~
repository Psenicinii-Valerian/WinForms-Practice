//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit_Main.h"
#include "UDM.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMain *Main;
TDateTime DT;

//---------------------------------------------------------------------------
__fastcall TMain::TMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMain::FormShow(TObject *Sender)
{
	Label2->Caption=DT.CurrentDate();
	Client->TabVisible = false;
	  Medic->TabVisible = false;
		Cartela->TabVisible = false;
		  Filiala->TabVisible = false;

}
//---------------------------------------------------------------------------
void __fastcall TMain::Timer1Timer(TObject *Sender)
{
    Label1->Caption=DT.CurrentTime();
}
//---------------------------------------------------------------------------



void __fastcall TMain::SpeedButton2Click(TObject *Sender)
{
    Application->Terminate();
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton1Click(TObject *Sender)
{
	if ( (Edit1->Text!="") && (Edit2->Text!="") ) {

		if ( (Edit1->Text=="1") && (Edit2->Text=="1") ) {
			Medic->TabVisible = true;
			Autentificare->TabVisible = false;
		}

		else {
			ShowMessage("Autentificare esuata");
		}

	}

	else {
		ShowMessage("Nu sunt introduse toate campurile de autentificare");
	}
}
//---------------------------------------------------------------------------


void __fastcall TMain::Panel7Resize(TObject *Sender)
{
	DBGrid1->Columns->Items[4]->Width =  Panel7->Width
	- DBGrid1->Columns->Items[0]->Width - DBGrid1->Columns->Items[1]->Width
	- DBGrid1->Columns->Items[2]->Width - DBGrid1->Columns->Items[3]->Width
	- 55;
}
//---------------------------------------------------------------------------


void __fastcall TMain::FilialaShow(TObject *Sender)
{
	DM->Qfirma->Close();
	DM->Qfirma->Open();
}
//---------------------------------------------------------------------------

void __fastcall TMain::Panel9Resize(TObject *Sender)
{
	DBGrid2->Columns->Items[3]->Width = Panel9->Width
	- DBGrid2->Columns->Items[0]->Width - DBGrid2->Columns->Items[1]->Width
	- DBGrid2->Columns->Items[2]->Width - 55;
}
//---------------------------------------------------------------------------

void __fastcall TMain::MedicShow(TObject *Sender)
{
	DM->Qmedic->Close();
	DM->Qmedic->Open();
}
//---------------------------------------------------------------------------

