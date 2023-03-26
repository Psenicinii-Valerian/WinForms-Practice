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
int CLIENT_ID, MEDIC_ID;


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

//---------------------------------------------------------------------------


void __fastcall TMain::Edit14KeyPress(TObject *Sender, System::WideChar &Key)
{
    Key=0;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton9Click(TObject *Sender)
{
	DM->Qcartela->Close();
	DM->Qcartela->ParamByName("CLIENT_ID")->AsInteger=DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;
	DM->Qcartela->Open();

	Edit14->Text=DM->Qclient->FieldByName("CLIENT")->AsString.UpperCase();
	TabSheet1->TabVisible=true;  // main
	 TabSheet2->TabVisible=false;   // inregistare
	  TabSheet3->TabVisible=false;  // editare
	Client->TabVisible=false;
	Cartela->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton15Click(TObject *Sender)
{
	 TabSheet2->TabVisible=true;
	  TabSheet1->TabVisible=false;
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton23Click(TObject *Sender)
{
	 TabSheet2->TabVisible=false;
	  TabSheet1->TabVisible=true;
	   TabSheet3->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton24Click(TObject *Sender)
{
	TabSheet1->TabVisible=true;
	  TabSheet3->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton16Click(TObject *Sender)
{
	TabSheet1->TabVisible=false;  // main
	  TabSheet3->TabVisible=true;  // editare
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton18Click(TObject *Sender)
{
	DM->Qmedic->Close();
	DM->Qmedic->Open();
	Medic->TabVisible=true;
	Cartela->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton4Click(TObject *Sender)
{
	Edit15->Text=DM->Qmedic->FieldByName("MEDIC")->AsString;
	MEDIC_ID = DM->Qmedic->FieldByName("MEDIC_FILIALA_ID")->AsInteger;
	Medic->TabVisible=false;
	Cartela->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton5Click(TObject *Sender)
{
	Medic->TabVisible=false;
	Cartela->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton21Click(TObject *Sender)
{
	TabSheet1->TabVisible=true;  // main
	TabSheet2->TabVisible=false; // inregistrare
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton20Click(TObject *Sender)
{
	if( (Edit15->Text!="") &&  (Edit19->Text!="") &&
		(Memo1->Text!="") && (Memo2->Text!="")  ) {

			DM->Cartela_ins->Close();
			DM->Cartela_ins->ParamByName("MEDIC_FILIALA_ID")->AsInteger=MEDIC_ID;
			DM->Cartela_ins->ParamByName("CLIENT_ID")->AsInteger=DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;
			DM->Cartela_ins->ParamByName("DIAGNOZA")->AsString=Memo1->Text;
			DM->Cartela_ins->ParamByName("PRESCRIPTII")->AsString=Memo2->Text;
			DM->Cartela_ins->ParamByName("COST")->AsFloat=Edit19->Text.ToDouble();
			DM->Cartela_ins->ExecSQL();

			Edit15->Clear();
			Edit19->Clear();
			Memo1->Clear();
			Memo2->Clear();

			DM->Qcartela->Close();
			DM->Qcartela->ParamByName("CLIENT_ID")->AsInteger=DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;
			DM->Qcartela->Open();

		}
		else
        ShowMessage("Nu sunt introduse toate campurile!!!");
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton25Click(TObject *Sender)
{
	Client->TabVisible=true;
    Cartela->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton17Click(TObject *Sender)
{
	if (!DM->Qcartela->IsEmpty()) {
			if (MessageDlg("Dvs. intr-adevar doriti sa eliminati informatia?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo,0) == mrYes) {
				DM->Cartela_del->Close();
				DM->Cartela_del->ParamByName("CARTELA_ID")->AsInteger=DM->Qcartela->FieldByName("CARTELA_ID")->AsInteger;
				DM->Cartela_del->ExecSQL();

				DM->Qcartela->Close();
				DM->Qcartela->ParamByName("CLIENT_ID")->AsInteger=DM->Qclient->FieldByName("CLIENT_ID")->AsInteger;
				DM->Qcartela->Open();
			} 
			
		}
		else {
				MessageDlg("Nu sunt date de eliminat!", mtError, TMsgDlgButtons() << mbYes,0);
			}
	

	
}
//---------------------------------------------------------------------------

void __fastcall TMain::SpeedButton22Click(TObject *Sender)
{
	DM->Qmedic->Close();
	DM->Qmedic->Open();
	Medic->TabVisible=true;
	Cartela->TabVisible=false;
}
//---------------------------------------------------------------------------


