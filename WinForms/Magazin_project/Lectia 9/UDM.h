//---------------------------------------------------------------------------

#ifndef UDMH
#define UDMH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <FireDAC.Phys.MSSQL.hpp>
#include <FireDAC.Phys.MSSQLDef.hpp>
#include "frxClass.hpp"
#include "frxDBSet.hpp"
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TFDConnection *Baza;
	TFDQuery *QEmitent;
	TFDQuery *QUm;
	TFDQuery *QProdus;
	TFDQuery *QReceptie;
	TFDQuery *QLiber;
	TDataSource *DSEmitent;
	TDataSource *DSUm;
	TDataSource *DSProdus;
	TDataSource *DSReceptie;
	TFDQuery *QIdentificare;
	TFDQuery *QVanzare;
	TDataSource *DSVanzare;
	TFDStoredProc *PCheck;
	TFDQuery *QCheck;
	TDataSource *DSCheck;
	TfrxReport *frxReport1;
	TfrxDBDataset *frxDBDataset1;
	TfrxReport *frxReport2;
	TfrxDBDataset *frxDBDataset2;
	TfrxReport *frxCheck;
	TfrxDBDataset *DBCheck;
	void __fastcall frxCheckGetValue(const UnicodeString VarName, Variant &Value);
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
