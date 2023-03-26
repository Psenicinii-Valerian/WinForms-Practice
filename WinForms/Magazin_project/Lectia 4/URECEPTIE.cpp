//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "URECEPTIE.h"
#include "UDM.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFRECEPTIE *FRECEPTIE;
int EMITENT_ID, FACTURA_ID, PRODUS_ID, UM_ID, STOCK1, STOCK_ID, STOCK_CANTITATE;
//---------------------------------------------------------------------------
__fastcall TFRECEPTIE::TFRECEPTIE(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFRECEPTIE::FormShow(TObject *Sender)
{
	DATA_F->Date=Now();
//  DATA_F->Date.CurrentDate();

	FACTURA->TabVisible=true;
	UM->TabVisible=false;
	EMITENT->TabVisible=false;
	PRODUS->TabVisible=false;

	Panel7->Enabled=true;
	Panel8->Enabled=false;
    PageControl4->ActivePageIndex=3;
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

    EMITENT_ID = DM->QEmitent->FieldByName("EMITENT_ID")->AsInteger;
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
	  // verificam daca exista factura cu datele introduse
	  DM->QLiber->Close();
	  DM->QLiber->SQL->Clear();
	  DM->QLiber->SQL->Add(" SELECT FACTURA_REC_ID FROM FACTURA_REC WHERE EMITENT_ID=:ID ");
	  DM->QLiber->SQL->Add(" AND NR_FACTURA=:NR AND DATA_FACTURA=:DATAF ");
	  DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
	  DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
	  DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
	  DM->QLiber->Open();

	  if (DM->QLiber->IsEmpty()) {

		// cream factura
		DM->QLiber->Close();
		DM->QLiber->SQL->Clear();
		DM->QLiber->SQL->Add(" INSERT INTO FACTURA_REC(NR_FACTURA, DATA_FACTURA, EMITENT_ID) ");
		DM->QLiber->SQL->Add(" VALUES(:NR, :DATAF, :ID) ");
		DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
		DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
		DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
		DM->QLiber->ExecSQL();
		PageControl4->ActivePageIndex=1;

	  } else {
		PageControl4->ActivePageIndex=0;
	  }

	  // utilizam query pentru a afla ID-ul facturii
	  DM->QLiber->Close();
	  DM->QLiber->SQL->Clear();
	  DM->QLiber->SQL->Add(" SELECT FACTURA_REC_ID FROM FACTURA_REC WHERE EMITENT_ID=:ID ");
	  DM->QLiber->SQL->Add(" AND NR_FACTURA=:NR AND DATA_FACTURA=:DATAF ");
	  DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
	  DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
	  DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
	  DM->QLiber->Open();

	  // atribuim variabilei ID-ul facturii
	  FACTURA_ID = DM->QLiber->FieldByName("FACTURA_REC_ID")->AsInteger;

	  // deschidem tabela cu receptie
	  DM->QReceptie->Close();
	  DM->QReceptie->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
	  DM->QReceptie->Open();

	  Panel7->Enabled=false;
	  Panel8->Enabled=true;

	} else {
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

void __fastcall TFRECEPTIE::stoc(int valoare_stoc){

// 1. verificam daca exista produsul in tabela stoc
	// daca exista, atunci modificam, in caz contrar adaugam

	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" SELECT * FROM STOCK WHERE PRODUSE_ID = :PRODUSE_ID");
	DM->QLiber->ParamByName("PRODUSE_ID")->AsInteger = PRODUS_ID;
	DM->QLiber->Open();

	int STOCK_ID = 0;

	if(!DM->QLiber->IsEmpty())
		STOCK_ID = DM->QLiber->FieldByName("STOCK_ID")->AsInteger;

	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();


	if ( STOCK_ID == 0 ) {
		DM->QLiber->SQL->Add(" INSERT INTO STOCK(PRODUSE_ID, STOCK) VALUES(:P_ID, :ST)");
		DM->QLiber->ParamByName("P_ID")->AsInteger = PRODUS_ID;
		DM->QLiber->ParamByName("ST")->AsInteger = valoare_stoc;

	} else {
		DM->QLiber->SQL->Add(" UPDATE STOCK SET STOCK = STOCK + :ST WHERE STOCK_ID = :ID");
		DM->QLiber->ParamByName("ID")->AsInteger = STOCK_ID;
		DM->QLiber->ParamByName("ST")->AsInteger = valoare_stoc;
	}

	DM->QLiber->ExecSQL();

}

//-----------------------------------------------------------------------------------

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

void __fastcall TFRECEPTIE::SpeedButton10Click(TObject *Sender)
{
	PRODUS->TabVisible=true;
	FACTURA->TabVisible=false;

	MAIN_P->TabVisible=true;
	INS_P->TabVisible=false;
	EDIT_P->TabVisible=false;

	DM->QProdus->Close();
	DM->QProdus->SQL->Clear();
	DM->QProdus->SQL->Add("SELECT * FROM PRODUSE");
	DM->QProdus->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton11Click(TObject *Sender)
{
	DM->QUm->Close();
    DM->QUm->Open();

	UM->TabVisible=true;
	FACTURA->TabVisible=false;

	MAIN_UM->TabVisible=true;
	INS_UM->TabVisible=false;
	EDIT_UM->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton1Click(TObject *Sender)
{
	PRODUS_ID = DM->QProdus->FieldByName("PRODUSE_ID")->AsInteger;
	PRODUS_F->Text = DM->QProdus->FieldByName("DENUMIRE")->AsString;
	PRODUS_FF->Text = DM->QProdus->FieldByName("DENUMIRE")->AsString;

	PRODUS->TabVisible=false;
	FACTURA->TabVisible=true;

}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton2Click(TObject *Sender)
{
	PRODUS->TabVisible=true;
	FACTURA->TabVisible=false;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::BSELECTEAZA_UMClick(TObject *Sender)
{
	UM_ID = DM->QUm->FieldByName("UNIT_MASURA_ID")->AsInteger;
	UM_F->Text = DM->QUm->FieldByName("ABREVIERE")->AsString;
	UM_FF->Text = DM->QUm->FieldByName("ABREVIERE")->AsString;

	UM->TabVisible=false;
	FACTURA->TabVisible=true;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::RB1Click(TObject *Sender)
{
	EPROD->Clear();
	EPROD->TextHint="DENUMIRE";
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::RB2Click(TObject *Sender)
{
	EPROD->Clear();
	EPROD->TextHint="COD";
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::EPRODChange(TObject *Sender)
{
	if (EPROD->Text.Length() > 0) {

	  DM->QProdus->Close();
	  DM->QProdus->SQL->Clear();
	  if (RB1->Checked) // cauta dupa denumire
		DM->QProdus->SQL->Add("SELECT * FROM PRODUSE WHERE DENUMIRE LIKE '"+EPROD->Text+"%'");

	  else  // cauta dupa cod
		DM->QProdus->SQL->Add("SELECT * FROM PRODUSE WHERE COD_PRODUS LIKE '"+EPROD->Text+"%'");

	  DM->QProdus->Open();

	} else {
		DM->QProdus->Close();
		DM->QProdus->SQL->Clear();
		DM->QProdus->SQL->Add("SELECT * FROM PRODUSE");
		DM->QProdus->Open();
	}
}
//---------------------------------------------------------------------------


void __fastcall TFRECEPTIE::SpeedButton20Click(TObject *Sender)
{
	if (PRODUS_F->Text!="" && UM_F->Text!="" && COST_F->Text!="" && TVA_F->Text!="") {

	   DM->QLiber->Close();
	   DM->QLiber->SQL->Clear();
	   DM->QLiber->SQL->Add("INSERT INTO RECEPTIE(PRODUSE_ID, UNIT_MASURA_ID, FACTURA_REC_ID, ");
	   DM->QLiber->SQL->Add(" FIRMA_OPERATOR_ID, STOCK1, STOCK2, PRET_INTRARE, PRET_VANZ, TVA)");

	   DM->QLiber->SQL->Add(" VALUES(:PRODUSE_ID, :UNIT_MASURA_ID, :FACTURA_REC_ID, ");
	   DM->QLiber->SQL->Add(" :FIRMA_OPERATOR_ID, :STOCK1, :STOCK1, :PRET_INTRARE, :PRET_VANZ, :TVA)");

	   DM->QLiber->ParamByName("PRODUSE_ID")->AsInteger = PRODUS_ID;
	   DM->QLiber->ParamByName("UNIT_MASURA_ID")->AsInteger = UM_ID;
	   DM->QLiber->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
	   DM->QLiber->ParamByName("FIRMA_OPERATOR_ID")->AsInteger = 1;
	   DM->QLiber->ParamByName("STOCK1")->AsInteger = CANTITATE_F->Text.ToInt();
	   DM->QLiber->ParamByName("PRET_INTRARE")->AsFloat = COST_F->Text.ToDouble();
	   DM->QLiber->ParamByName("PRET_VANZ")->AsFloat = PRET_F->Text.ToDouble();
	   DM->QLiber->ParamByName("TVA")->AsInteger = TVA_F->Text.ToInt();

	   DM->QLiber->ExecSQL();

	   // STOCK INREGISTRARE
	   STOCK_CANTITATE = CANTITATE_F->Text.ToInt();
	   stoc(STOCK_CANTITATE);

	   PRODUS_F->Clear();
	   UM_F->Clear();
	   COST_F->Clear();
	   TVA_F->Clear();
	   PRET_F->Clear();
	   CANTITATE_F->Clear();

	   // deschidem tabela cu receptie
	   DM->QReceptie->Close();
	   DM->QReceptie->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
	   DM->QReceptie->Open();

	} else {
		ShowMessage("Nu sunt introduse toate campurile!");
	}
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton28Click(TObject *Sender)
{
	PageControl4->ActivePageIndex=2;
		PRODUS_ID = DM->QReceptie->FieldByName("COD_PRODUS")->AsInteger;

	PRODUS_FF->Text=DM->QReceptie->FieldByName("DENUMIRE")->AsString;
	UM_FF->Text=DM->QReceptie->FieldByName("ABREVIERE")->AsString;
	COST_FF->Text=DM->QReceptie->FieldByName("PRET_INTRARE")->AsFloat;
	TVA_FF->Text=DM->QReceptie->FieldByName("TVA")->AsInteger;
	CANTITATE_FF->Text=DM->QReceptie->FieldByName("STOCK1")->AsInteger;
	PRET_FF->Text=DM->QReceptie->FieldByName("PRET_VANZ")->AsFloat;

}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton23Click(TObject *Sender)
{
	PRODUS_FF->Clear();
	UM_FF->Clear();
	COST_FF->Clear();
	TVA_FF->Clear();
	CANTITATE_FF->Clear();
	PRET_FF->Clear();

	PageControl4->ActivePageIndex=1;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton22Click(TObject *Sender)
{
	 if (PRODUS_FF->Text!="" && UM_FF->Text!="" && COST_FF->Text!="" && TVA_FF->Text!="") {

	   DM->QLiber->Close();
	   DM->QLiber->SQL->Clear();

	   DM->QLiber->SQL->Add(" UPDATE RECEPTIE SET ");
	   DM->QLiber->SQL->Add(" PRODUSE_ID=:PRODUSE_ID, UNIT_MASURA_ID=:UNIT_MASURA_ID,");
	   DM->QLiber->SQL->Add(" FIRMA_OPERATOR_ID=:FIRMA_OPERATOR_ID, ");
	   DM->QLiber->SQL->Add(" STOCK1=:STOCK1, STOCK2=:STOCK1, PRET_INTRARE=:PRET_INTRARE, ");
	   DM->QLiber->SQL->Add(" PRET_VANZ=:PRET_VANZ, TVA=:TVA ");
	   DM->QLiber->SQL->Add(" WHERE FACTURA_REC_ID = :FACTURA_REC_ID AND PRODUSE_ID = :PRODUSE_ID ");

	   DM->QLiber->ParamByName("PRODUSE_ID")->AsInteger = PRODUS_ID;
	   DM->QLiber->ParamByName("UNIT_MASURA_ID")->AsInteger = UM_ID;
	   DM->QLiber->ParamByName("FIRMA_OPERATOR_ID")->AsInteger = 1;
	   DM->QLiber->ParamByName("STOCK1")->AsInteger = CANTITATE_FF->Text.ToInt();
	   DM->QLiber->ParamByName("PRET_INTRARE")->AsFloat = COST_FF->Text.ToDouble();
	   DM->QLiber->ParamByName("PRET_VANZ")->AsFloat = PRET_FF->Text.ToDouble();
	   DM->QLiber->ParamByName("TVA")->AsInteger = TVA_FF->Text.ToInt();
	   DM->QLiber->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;

	   DM->QLiber->ExecSQL();

	   // STOCK EDITARE
	   DM->QLiber->Close();
	   DM->QLiber->SQL->Clear();
	   DM->QLiber->SQL->Add(" SELECT * FROM STOCK WHERE PRODUSE_ID = :PRODUSE_ID");
	   DM->QLiber->ParamByName("PRODUSE_ID")->AsInteger = PRODUS_ID;
	   DM->QLiber->Open();

	   STOCK_CANTITATE = DM->QLiber->FieldByName("STOCK")->AsInteger;

	   stoc(CANTITATE_FF->Text.ToInt()-STOCK_CANTITATE);
	   ShowMessage(CANTITATE_FF->Text.ToInt()-STOCK_CANTITATE);

	   PRODUS_FF->Clear();
	   UM_FF->Clear();
	   COST_FF->Clear();
	   TVA_FF->Clear();
	   PRET_FF->Clear();
	   CANTITATE_FF->Clear();

	   // deschidem tabela cu receptie
	   DM->QReceptie->Close();
	   DM->QReceptie->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
	   DM->QReceptie->Open();

	   SpeedButton23->Click();

	} else {
		ShowMessage("Nu sunt introduse toate campurile!");
	}
}
//---------------------------------------------------------------------------



void __fastcall TFRECEPTIE::BINREG_FClick(TObject *Sender)
{
	PageControl4->ActivePageIndex=1;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton14Click(TObject *Sender)
{
	PageControl4->ActivePageIndex=2;
	PRODUS_ID = DM->QReceptie->FieldByName("COD_PRODUS")->AsInteger;
}
//---------------------------------------------------------------------------



void __fastcall TFRECEPTIE::BANULEAZA_FClick(TObject *Sender)
{
	if (!DM->QReceptie->IsEmpty()) {

		stoc(-1*DM->QReceptie->FieldByName("STOCK1")->AsInteger);

		DM->QLiber->Close();
		DM->QLiber->SQL->Clear();

		DM->QLiber->SQL->Add(" DELETE RECEPTIE WHERE RECEPTIE_ID = :RECEPTIE_ID ");
		DM->QLiber->ParamByName("RECEPTIE_ID")->AsInteger = DM->QReceptie->FieldByName("RECEPTIE_ID")->AsInteger;

		DM->QLiber->ExecSQL();

		DM->QReceptie->Close();
		DM->QReceptie->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
		DM->QReceptie->Open();

	} else {
		ShowMessage("Nu sunt date de eliminat!");
	}


}

//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton21Click(TObject *Sender)
{
	PageControl4->ActivePageIndex=0;
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::BURM_FClick(TObject *Sender)
{
	PageControl4->ActivePageIndex=3;

	DM->QReceptie->Close();

	NR_F->Clear();
	EMITENT_F->Clear();

	Panel7->Enabled=true;
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::FormClose(TObject *Sender, TCloseAction &Action)
{
	Application->Terminate();
}
//---------------------------------------------------------------------------

void __fastcall TFRECEPTIE::SpeedButton29Click(TObject *Sender)
{
    // stergerea STOCK-ului ???

	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" DELETE RECEPTIE WHERE FACTURA_REC_ID = :FACTURA_REC_ID ");
	DM->QLiber->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;

	DM->QLiber->ExecSQL();

	DM->QLiber->Close();

	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" INSERT INTO FACTURA_REC(NR_FACTURA, DATA_FACTURA, EMITENT_ID) ");
	DM->QLiber->SQL->Add(" VALUES(:NR, :DATAF, :ID) ");
	DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
	DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
	DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
	DM->QLiber->ExecSQL();
	PageControl4->ActivePageIndex=1;

	// utilizam query pentru a afla ID-ul facturii
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" SELECT FACTURA_REC_ID FROM FACTURA_REC WHERE EMITENT_ID=:ID ");
	DM->QLiber->SQL->Add(" AND NR_FACTURA=:NR AND DATA_FACTURA=:DATAF ");
	DM->QLiber->ParamByName("ID")->AsInteger=EMITENT_ID;
	DM->QLiber->ParamByName("NR")->AsString=NR_F->Text;
	DM->QLiber->ParamByName("DATAF")->AsDate=DATA_F->Date;
	DM->QLiber->Open();

	// atribuim variabilei ID-ul facturii
	FACTURA_ID = DM->QLiber->FieldByName("FACTURA_REC_ID")->AsInteger;
	ShowMessage(FACTURA_ID);

	// deschidem tabela cu receptie
	DM->QReceptie->Close();
	DM->QReceptie->ParamByName("FACTURA_REC_ID")->AsInteger = FACTURA_ID;
	DM->QReceptie->Open();

}
//---------------------------------------------------------------------------

