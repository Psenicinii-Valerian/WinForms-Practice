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
int CLIENT_ID;

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
			Autentificare->TabVisible = false;

			DM->Qclient->Close();
			DM->Qclient->Open();

			Main_C->TabVisible = true;
			Ins_C->TabVisible = false;
			Edit_C->TabVisible = false;

			Client->TabVisible = true;
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



void __fastcall TMain::Edit3Change(TObject *Sender)
{
    TLocateOptions flags;
  if (!Edit3->Text.IsEmpty())
  {
	   //flags << loPartialKey << loCaseInsensitive;
	DM->Qclient->Locate("nume", Edit3->Text, flags);
  }
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton6Click(TObject *Sender)
{
	Main_C->TabVisible = false;
	Ins_C->TabVisible = true;
	Edit_C->TabVisible = false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton7Click(TObject *Sender)
{
	Edit13->Text=DM->Qclient->FieldByName("NUME")->AsString;
	Edit12->Text=DM->Qclient->FieldByName("PRENUME")->AsString;
	DateTimePicker3->Date=DM->Qclient->FieldByName("DATA_NASTERII")->AsString;
	Edit11->Text=DM->Qclient->FieldByName("IDNP")->AsString;
	Edit10->Text=DM->Qclient->FieldByName("TELEFON")->AsString;
	Edit9->Text=DM->Qclient->FieldByName("ADRESA")->AsString;

	CLIENT_ID=DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;

	Main_C->TabVisible = false;
	Ins_C->TabVisible = false;
	Edit_C->TabVisible = true;
}
//---------------------------------------------------------------------------


void __fastcall TMain::SpeedButton12Click(TObject *Sender)
{
	Edit4->Clear();
	Edit5->Clear();
	Edit6->Clear();
	Edit7->Clear();
	Edit8->Clear();

	Main_C->TabVisible = true;
	Ins_C->TabVisible = false;
	Edit_C->TabVisible = false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton13Click(TObject *Sender)
{
	Edit9->Clear();
	Edit10->Clear();
	Edit11->Clear();
	Edit12->Clear();
	Edit13->Clear();

	Main_C->TabVisible = true;
	Ins_C->TabVisible = false;
	Edit_C->TabVisible = false;
}
//---------------------------------------------------------------------------


void __fastcall TMain::SpeedButton11Click(TObject *Sender)
{
	if( (Edit4->Text!="") && (Edit5->Text!="") &&
		(Edit6->Text!="") && (Edit7->Text!="") &&
		(Edit8->Text!="") )
	{
		DM->Client_ins->Close();
		DM->Client_ins->ParamByName("NUME")->AsString=Edit4->Text;
		DM->Client_ins->ParamByName("PRENUME")->AsString=Edit5->Text;
		DM->Client_ins->ParamByName("DATA_NASTERII")->AsDate=DateTimePicker1->Date;
		DM->Client_ins->ParamByName("IDNP")->AsString=Edit7->Text;
		DM->Client_ins->ParamByName("TELEFON")->AsString=Edit6->Text;
		DM->Client_ins->ParamByName("ADRESA")->AsString=Edit8->Text;
		DM->Client_ins->ExecSQL();

		DM->Qclient->Close();
		DM->Qclient->Open();

		// ShowMessage("Inregistrare cu succes!");

        SpeedButton12->Click();
	}

	else ShowMessage("Nu este introdusa toata informatia");
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton14Click(TObject *Sender)
{
	if( (Edit9->Text!="") && (Edit10->Text!="") &&
		(Edit11->Text!="") && (Edit12->Text!="") &&
		(Edit13->Text!="") )
	{
		DM->Client_upd->Close();
		DM->Client_upd->ParamByName("NUME")->AsString=Edit13->Text;
		DM->Client_upd->ParamByName("PRENUME")->AsString=Edit12->Text;
		DM->Client_upd->ParamByName("DATA_NASTERII")->AsDate=DateTimePicker3->Date;
		DM->Client_upd->ParamByName("IDNP")->AsString=Edit11->Text;
		DM->Client_upd->ParamByName("TELEFON")->AsString=Edit10->Text;
		DM->Client_upd->ParamByName("ADRESA")->AsString=Edit9->Text;
		DM->Client_upd->ParamByName("CLIENT_ID")->AsInteger=CLIENT_ID;
		DM->Client_upd->ExecSQL();

		DM->Qclient->Close();
		DM->Qclient->Open();

		// ShowMessage("Inregistrare cu succes!");

        SpeedButton13->Click();
	}

	else ShowMessage("Nu este introdusa toata informatia");
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton8Click(TObject *Sender)
{
	if (!DM->Qclient->IsEmpty()) {

		DM->Client_del->Close();
		DM->Client_del->ParamByName("CLIENT_ID")->AsInteger =
			DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;
		DM->Client_del->ExecSQL();

		DM->Qclient->Close();
		DM->Qclient->Open();
	}

	else ShowMessage("Nu sunt date de eliminat!");

}
//---------------------------------------------------------------------------

