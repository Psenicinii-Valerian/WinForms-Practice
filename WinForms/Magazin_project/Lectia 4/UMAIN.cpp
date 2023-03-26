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
int CLIENT_ID=1, CHECK_ID;
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

				ShowMessage(CHECK_ID);
			}
		}
		else //client
		{
			LClient->Caption=DM->QIdentificare->FieldByName("client")->AsString+"-"+DM->QIdentificare->FieldByName("valoarea")->AsString+"%";
		}

	}

	else
	{
		LProdus->Caption="NESPECIFICAT";
	}

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

	DM->QVanzare->Close();
	EProdus->Clear();

}
//---------------------------------------------------------------------------

