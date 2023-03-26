//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UMAIN.h"
#include "UDM.h"
#include "URECEPTIE.h"
#include "UCHECK.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFMAIN *FMAIN;
int CLIENT_ID=1, CHECK_ID, VANZARE_ID, COD_ID=0;
float PROCENT=0;
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


void __fastcall TFMAIN::SpeedButton5Click(TObject *Sender)
{
	if(EProdus->Text!="")
	{
	DM->QIdentificare->Close();
	DM->QIdentificare->SQL->Clear();

	if(!CBClient->Checked)
	{
		DM->QIdentificare->SQL->Add("select * from receptie r inner join produse p on ");
		DM->QIdentificare->SQL->Add("r.produse_id=p.produse_id inner join unit_masura um ");
		DM->QIdentificare->SQL->Add("on um.unit_masura_id=r.unit_masura_id ");
		DM->QIdentificare->SQL->Add(" where p.cod_produs=:cod ");
	}
	else //identificarea client
	{
		DM->QIdentificare->SQL->Add("select c.nume+' '+prenume as client, cast(valoarea/100.0 as decimal(4,2)) as procent,");
		DM->QIdentificare->SQL->Add("* from client c inner join discount d on c.DISCOUNT_ID=d.DISCOUNT_ID where c.cod_client=:cod");
	}

		DM->QIdentificare->ParamByName("cod")->AsString=EProdus->Text;
		DM->QIdentificare->Open();
		EProdus->Clear();
		EProdus->SetFocus();

	if(!DM->QIdentificare->IsEmpty()) //verificam daca primim ceva rezultate sau nu
	{
		if(!CBClient->Checked)//daca e produs
		{
			LProdus->Caption=DM->QIdentificare->FieldByName("denumire")->AsString+"-"+DM->QIdentificare->FieldByName("pret_vanz")->AsString+" lei/"+DM->QIdentificare->FieldByName("abreviere")->AsString;
			// verificam daca checkul a fost creat prin aceea daca avem info in tabela cu vanzari
			// daca nu este informatie => checkul nu a fost creat
			// in caz contrar, checkul este deja creat

			if (DM->QVanzare->IsEmpty()) {  // nu este vanzare, formam checkul

				DM->PCheck->Close();
				DM->PCheck->ParamByName("@OPER")->AsInteger = OPERATOR_ID;
				DM->PCheck->ParamByName("@CLIENT")->AsInteger = CLIENT_ID;
				DM->PCheck->ExecProc();

				CHECK_ID = DM->PCheck->ParamByName("@RETURN_VALUE")->AsInteger;

				// ShowMessage(CHECK_ID);
			}

			// 1. verificam daca produsul identificat este in lista de vanzare
			// 2. daca nu este, facem insert
			// 3. daca este, facem update

			// produsul depistat il introducem in vanzare
			float s, sd, st; // suma, suma discount, suma total

			DM->QLiber->Close();
			DM->QLiber->SQL->Clear();
			DM->QLiber->SQL->Add("SELECT VANZARE_ID FROM VANZARE V INNER JOIN RECEPTIE R ON R.RECEPTIE_ID=V.RECEPTIE_ID WHERE R.PRODUSE_ID = :PRODUSE_ID AND V.CEC_ID = :CHECK_ID");
			DM->QLiber->ParamByName("PRODUSE_ID")->AsInteger = DM->QIdentificare->FieldByName("PRODUSE_ID")->AsInteger;
			DM->QLiber->ParamByName("CHECK_ID")->AsInteger = CHECK_ID;
			DM->QLiber->Open();

			if ( DM->QLiber->IsEmpty() ) {
				s =  DM->QIdentificare->FieldByName("Pret_vanz")->AsFloat;
				sd = s*PROCENT;
				st = s-sd;

				DM->QLiber->Close();
				DM->QLiber->SQL->Clear();
				DM->QLiber->SQL->Add("INSERT INTO VANZARE (CEC_ID, RECEPTIE_ID, CANTITATEA, SUMA,SUMA_DISC, SUMA_TOTAL)");
				DM->QLiber->SQL->Add("VALUES(:CEC_ID, :RECEPTIE_ID, :CANTITATEA, :SUMA, :SUMA_DISC, :SUMA_TOTAL)");
				DM->QLiber->ParamByName("CEC_ID")->AsInteger=CHECK_ID;
				DM->QLiber->ParamByName("RECEPTIE_ID")->AsInteger=DM->QIdentificare->FieldByName("RECEPTIE_ID")->AsInteger;
				DM->QLiber->ParamByName("CANTITATEA")->AsInteger=1;
				DM->QLiber->ParamByName("SUMA")->AsFloat=s;
				DM->QLiber->ParamByName("SUMA_DISC")->AsFloat=sd;
				DM->QLiber->ParamByName("SUMA_TOTAL")->AsFloat=st;

				DM->QLiber->ExecSQL();
				DM->QVanzare->Close();
				DM->QVanzare->Open();
		   }

		   else {
					COD_ID = DM->QLiber->FieldByName("VANZARE_ID")->AsInteger;
					DM->QLiber->Close();
					DM->QLiber->SQL->Clear();
					DM->QLiber->SQL->Add(" UPDATE VANZARE SET CANTITATEA=CANTITATEA + 1, SUMA=(CANTITATEA + 1) * :PRET_V, SUMA_DISC=(CANTITATEA + 1) * :PRET_V * SUMA * :PROCENT, SUMA_TOTAL= (CANTITATEA + 1) * :PRET_V - ((CANTITATEA + 1)* :PRET_V * :PROCENT) WHERE VANZARE_ID=:VANZARE_ID");
					DM->QLiber->ParamByName("VANZARE_ID")->AsInteger = COD_ID;
					DM->QLiber->ParamByName("PRET_V")->AsFloat = DM->QVanzare->FieldByName("PRET_VANZ")->AsFloat;
					DM->QLiber->ParamByName("PROCENT")->AsFloat=PROCENT;

					DM->QLiber->ExecSQL();
				}


		}

		else //client
		{
			LClient->Caption=DM->QIdentificare->FieldByName("client")->AsString+"-"+DM->QIdentificare->FieldByName("valoarea")->AsString+"%";
			PROCENT = DM->QIdentificare->FieldByName("PROCENT")->AsFloat;
			CLIENT_ID = DM->QIdentificare->FieldByName("CLIENT_ID")->AsInteger;

			// in situatia in care clientul este identificat dupa introducerea produselor
			// este nevoie de recalculat produsele inserate pana la identificarea clientului

			DM->QLiber->Close();
			DM->QLiber->SQL->Clear();
			DM->QLiber->SQL->Add(" UPDATE VANZARE SET SUMA_DISC=SUMA * :PROCENT, SUMA_TOTAL= SUMA - (SUMA * :PROCENT) WHERE CEC_ID=:CEC_ID ");
			DM->QLiber->ParamByName("CEC_ID")->AsInteger = CHECK_ID;
			DM->QLiber->ParamByName("PROCENT")->AsFloat=PROCENT;
			DM->QLiber->ExecSQL();

			// daca cecul a fost deja creat trebuie de facut modificare a clientului in cec
			DM->QLiber->Close();
			DM->QLiber->SQL->Clear();
			DM->QLiber->SQL->Add(" UPDATE CEC SET CLIENT_ID=:CLIENT_ID WHERE CEC_ID=:CEC_ID ");
			DM->QLiber->ParamByName("CEC_ID")->AsInteger = CHECK_ID;
			DM->QLiber->ParamByName("CLIENT_ID")->AsInteger=CLIENT_ID;
			DM->QLiber->ExecSQL();
		}

		DM->QVanzare->Close();
		DM->QVanzare->ParamByName("CEC_ID")->AsInteger=CHECK_ID;
		DM->QVanzare->Open();

		// afisam suma totala a produselor
		DM->QLiber->Close();
		DM->QLiber->SQL->Clear();
		DM->QLiber->SQL->Add(" SELECT SUM(SUMA_TOTAL) AS ST FROM VANZARE WHERE CEC_ID = :CEC_ID");
		DM->QLiber->ParamByName("CEC_ID")->AsInteger = CHECK_ID;
		DM->QLiber->Open();
		Label10->Caption = DM->QLiber->FieldByName("ST")->AsFloat;

	}

	else
	{
		LProdus->Caption="NESPECIFICAT";
	}

		CBClient->Checked=false;
	}
	else
	{
	  LProdus->Caption="NESPECIFICAT";
	}
}
//---------------------------------------------------------------------------

void __fastcall TFMAIN::FormShow(TObject *Sender)
{
	OPERATOR_ID = 1; // temporar (de sters)
}
//---------------------------------------------------------------------------


void __fastcall TFMAIN::SpeedButton6Click(TObject *Sender)
{
	LProdus->Caption="NESPECIFICAT";
	LClient->Caption="NESPECIFICAT";
	CLIENT_ID=1;
	PROCENT=0;
	Label10->Caption="0.00";

	DM->QVanzare->Close();
	EProdus->Clear();

}
//---------------------------------------------------------------------------


void __fastcall TFMAIN::SpeedButton7Click(TObject *Sender)
{
	if (!DM->QVanzare->IsEmpty()){
	   Panel6->Visible=true;
	   PageControl1->ActivePageIndex=0;
	   Label25->Caption=DM->QVanzare->FieldByName("DENUMIRE")->AsString;
	}

}
//---------------------------------------------------------------------------


void __fastcall TFMAIN::SpeedButton13Click(TObject *Sender)
{
	Panel6->Visible=false;
    Edit2->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TFMAIN::SpeedButton12Click(TObject *Sender)
{
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" UPDATE VANZARE SET CANTITATEA=:CANT, SUMA=:CANT * :PRET_V, SUMA_DISC=:CANT * :PRET_V * SUMA * :PROCENT, SUMA_TOTAL= :CANT * :PRET_V - (:CANT * :PRET_V * :PROCENT) WHERE VANZARE_ID=:VANZARE_ID ");
	DM->QLiber->ParamByName("VANZARE_ID")->AsInteger = DM->QVanzare->FieldByName("VANZARE_ID")->AsInteger;
	DM->QLiber->ParamByName("CANT")->AsInteger = Edit2->Text.ToInt();
	DM->QLiber->ParamByName("PRET_V")->AsFloat = DM->QVanzare->FieldByName("PRET_VANZ")->AsFloat;
	DM->QLiber->ParamByName("PROCENT")->AsFloat=PROCENT;
	DM->QLiber->ExecSQL();

	DM->QVanzare->Close();
	DM->QVanzare->ParamByName("CEC_ID")->AsInteger=CHECK_ID;
	DM->QVanzare->Open();

	// afisam suma totala a produselor
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" SELECT SUM(SUMA_TOTAL) AS ST FROM VANZARE WHERE CEC_ID = :CEC_ID");
	DM->QLiber->ParamByName("CEC_ID")->AsInteger = CHECK_ID;
	DM->QLiber->Open();
	Label10->Caption = DM->QLiber->FieldByName("ST")->AsFloat;

	Panel6->Visible=false;
	Edit2->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TFMAIN::SpeedButton9Click(TObject *Sender)
{
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" DELETE VANZARE WHERE VANZARE_ID=:VANZARE_ID ");
	DM->QLiber->ParamByName("VANZARE_ID")->AsInteger = DM->QVanzare->FieldByName("VANZARE_ID")->AsInteger;
	DM->QLiber->ExecSQL();

	DM->QVanzare->Close();
	DM->QVanzare->ParamByName("CEC_ID")->AsInteger=CHECK_ID;
	DM->QVanzare->Open();

	// afisam suma totala a produselor
	DM->QLiber->Close();
	DM->QLiber->SQL->Clear();
	DM->QLiber->SQL->Add(" SELECT SUM(SUMA_TOTAL) AS ST FROM VANZARE WHERE CEC_ID = :CEC_ID");
	DM->QLiber->ParamByName("CEC_ID")->AsInteger = CHECK_ID;
	DM->QLiber->Open();
	Label10->Caption = DM->QLiber->FieldByName("ST")->AsFloat;

	Panel6->Visible=false;
	Edit2->Clear();
}
//---------------------------------------------------------------------------


void __fastcall TFMAIN::SpeedButton8Click(TObject *Sender)
{
	   if (!DM->QVanzare->IsEmpty()){
	   Panel6->Visible=true;
	   PageControl1->ActivePageIndex=1;
	   Label6->Caption=DM->QVanzare->FieldByName("DENUMIRE")->AsString;
	}

}
//---------------------------------------------------------------------------

void __fastcall TFMAIN::SpeedButton10Click(TObject *Sender)
{
    Panel6->Visible=false;
}
//---------------------------------------------------------------------------

void __fastcall TFMAIN::SpeedButton4Click(TObject *Sender)
{
	FCheck->DateTimePicker1->Date = Now();
	FCheck->DateTimePicker2->Date.CurrentDate();
	FCheck->SpeedButton1->Click();
	FCheck->ShowModal();
}
//---------------------------------------------------------------------------

