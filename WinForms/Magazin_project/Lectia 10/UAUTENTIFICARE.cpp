//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UAUTENTIFICARE.h"
#include "UDM.h"
#include "UMAIN.h"
#include "URECEPTIE.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFAUTENTIFICARE *FAUTENTIFICARE;
//---------------------------------------------------------------------------
__fastcall TFAUTENTIFICARE::TFAUTENTIFICARE(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFAUTENTIFICARE::FormShow(TObject *Sender)
{
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add("SELECT * FROM FIRMA");
	DM->QLiber->Open();
	ComboBox1->Clear();

	while(!DM->QLiber->Eof)
	{
		ComboBox1->Items->Add(DM->QLiber->FieldByName("NUME")->AsString);
		DM->QLiber->Next();

	}
}
//---------------------------------------------------------------------------
void __fastcall TFAUTENTIFICARE::SpeedButton2Click(TObject *Sender)
{
	Application->Terminate();
}
//---------------------------------------------------------------------------
void __fastcall TFAUTENTIFICARE::ComboBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
    Key=0;
}
//---------------------------------------------------------------------------
void __fastcall TFAUTENTIFICARE::SpeedButton1Click(TObject *Sender)
{
	if( (ComboBox1->ItemIndex > -1) && (Edit1->Text != "") && (Edit2->Text.Length()>0 ) ) {

	  DM->QAutentificare->Close();
	  DM->QAutentificare->ParamByName("USERNAME")->AsString = Edit1->Text;
	  DM->QAutentificare->ParamByName("PASS")->AsString = Edit2->Text;
	  DM->QAutentificare->ParamByName("FIRMA")->AsString = ComboBox1->Text;
	  DM->QAutentificare->Open();

	  if(!DM->QAutentificare->IsEmpty() ) {

		FMAIN->OPERATOR_ID = DM->QAutentificare->FieldByName("FIRMA_OPERATOR_ID")->AsInteger;
		FMAIN->Label2->Caption = DM->QAutentificare->FieldByName("FUNCTIA")->AsString;
		FMAIN->Label3->Caption = DM->QAutentificare->FieldByName("OPERATOR")->AsString;
		FMAIN->Label19->Caption = DM->QAutentificare->FieldByName("NUME")->AsString;


		switch(DM->QAutentificare->FieldByName("TIP_ACCES")->AsInteger ) {

			case 1 : // admin
			{
			  FMAIN->AlphaBlend = false;
			  Close(); // echivalent cu FAUTENTIFICARE->Close();
			  break;
			}

			case 2 : // operator vanzare
			{
			  FMAIN->AlphaBlend = false;
			  FMAIN->SpeedButton3->Enabled = false;
			  Close();
			  break;
			}

			case 3 : // operator receptie
			{
			  FMAIN->AlphaBlend = false;
			  Close();
			  FRECEPTIE->ShowModal();
			  break;
			}

			default:
			{
			  Application->Terminate();
			}

		}


	  } else {
		  ShowMessage(" Autentificare esuata!");
		  Edit2->Clear();
	  }

	} else {
        ShowMessage(" Nu sunt introduse toate campurile!");
    }
}
//---------------------------------------------------------------------------

