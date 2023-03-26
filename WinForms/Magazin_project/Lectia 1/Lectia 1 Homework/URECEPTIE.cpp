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

void __fastcall TFRECEPTIE::SpeedButton16Click(TObject *Sender)
{
	TabSheet1->TabVisible=false;
	TabSheet2->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton25Click(TObject *Sender)
{

	Edit1->Clear();
	 Edit2->Clear();
	  Edit3->Clear();

	TabSheet1->TabVisible=true;
	TabSheet2->TabVisible=false;
}
//---------------------------------------------------------------------------


void __fastcall TFRECEPTIE::SpeedButton27Click(TObject *Sender)
{
	Edit4->Clear();
	 Edit5->Clear();
	  Edit6->Clear();

	TabSheet1->TabVisible=true;
	TabSheet3->TabVisible=false;
}
//---------------------------------------------------------------------------


void __fastcall TFRECEPTIE::SpeedButton17Click(TObject *Sender)
{
	TabSheet1->TabVisible=false;
	TabSheet3->TabVisible=true;

	Edit4->Text=DM->QEmitent->FieldByName("DENUMIRE")->AsString;
	Edit5->Text=DM->QEmitent->FieldByName("IDNO")->AsString;
	Edit6->Text=DM->QEmitent->FieldByName("ADRESA")->AsString;
	EMITENT_ID = DM->QEmitent->FieldByName("EMITENT_ID")->AsInteger;

}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton24Click(TObject *Sender)
{
	if (Edit1->Text!="" && Edit2->Text!="" && Edit3->Text!="" ) {

	  DM->QLiber->Close();
	  DM->QLiber->SQL->Clear();

	  DM->QLiber->SQL->Add("INSERT INTO EMITENT(DENUMIRE, IDNO, ADRESA)");
	  DM->QLiber->SQL->Add("VALUES(:DENUMIRE, :IDNO, :ADRESA)");

	  DM->QLiber->ParamByName("DENUMIRE")->AsString=Edit1->Text;
	  DM->QLiber->ParamByName("IDNO")->AsString=Edit2->Text;
	  DM->QLiber->ParamByName("ADRESA")->AsString=Edit3->Text;

	  DM->QLiber->ExecSQL();
	  SpeedButton25->Click();

	  DM->QEmitent->Close();
	  DM->QEmitent->Open();
	}
	else
	{
	  ShowMessage("Nu sunt introduse toate datele necesare!!!!");
	}
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton18Click(TObject *Sender)
{
	EMITENT_ID = DM->QEmitent->FieldByName("EMITENT_ID")->AsInteger;

	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();

	DM->QLiber->SQL->Add("DELETE EMITENT WHERE EMITENT_ID=:EMITENT_ID");
	DM->QLiber->ParamByName("EMITENT_ID")->AsInteger=EMITENT_ID;

	DM->QLiber->ExecSQL();

	DM->QEmitent->Close();
	DM->QEmitent->Open();

}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton26Click(TObject *Sender)
{

	if (Edit4->Text!="" && Edit5->Text!="" && Edit6->Text!="" ) {

	  DM->QLiber->Close();
	  DM->QLiber->SQL->Clear();

	  DM->QLiber->SQL->Add("UPDATE EMITENT SET ");
	  DM->QLiber->SQL->Add("DENUMIRE=:DENUMIRE, IDNO=:IDNO, ADRESA=:ADRESA");
	  DM->QLiber->SQL->Add("WHERE EMITENT_ID=:EMITENT_ID ");

	  DM->QLiber->ParamByName("DENUMIRE")->AsString=Edit4->Text;
	  DM->QLiber->ParamByName("IDNO")->AsString=Edit5->Text;
	  DM->QLiber->ParamByName("ADRESA")->AsString=Edit6->Text;
	  DM->QLiber->ParamByName("EMITENT_ID")->AsInteger=EMITENT_ID;

	  DM->QLiber->ExecSQL();
	  SpeedButton27->Click();

	  DM->QEmitent->Close();
	  DM->QEmitent->Open();
	}
	else
	{
	  ShowMessage("Nu sunt introduse toate datele necesare!!!!");
	}
}
//---------------------------------------------------------------------------

