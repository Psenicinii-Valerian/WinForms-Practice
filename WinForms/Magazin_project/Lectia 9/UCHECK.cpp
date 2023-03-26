//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UCHECK.h"
#include "UDM.h"
#include "UMAIN.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCheck *FCheck;
//---------------------------------------------------------------------------
__fastcall TFCheck::TFCheck(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFCheck::SpeedButton1Click(TObject *Sender)
{
	DM->QCheck->Close();
	DM->QCheck->ParamByName("D1")->AsDate = DateTimePicker1->Date;
	DM->QCheck->ParamByName("D2")->AsDate = DateTimePicker2->Date;
	DM->QCheck->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFCheck::DBGrid2DblClick(TObject *Sender)
{
	DM->QVanzare->Close();
	DM->QVanzare->ParamByName("CEC_ID")->AsInteger = DM->QCheck->FieldByName("CEC_ID")->AsInteger;
	DM->QVanzare->Open();
	PageControl1->ActivePageIndex=1;
}
//---------------------------------------------------------------------------
void __fastcall TFCheck::FormClose(TObject *Sender, TCloseAction &Action)
{
    DM->QVanzare->Close();
}
//---------------------------------------------------------------------------
void __fastcall TFCheck::SpeedButton2Click(TObject *Sender)
{
	if (PageControl1->ActivePageIndex == 0) {

		if(!DM->QCheck->IsEmpty()){

		DM->frxReport1->ShowReport(true);

		} else {
			ShowMessage("Nu aveti date de raportat!");
		}

	} else {  // TabSheet2

		if(!DM->QVanzare->IsEmpty()){

		DM->frxReport2->ShowReport(true);

		} else {
			ShowMessage("Nu aveti date de raportat!");
		}
    }


}
//---------------------------------------------------------------------------

