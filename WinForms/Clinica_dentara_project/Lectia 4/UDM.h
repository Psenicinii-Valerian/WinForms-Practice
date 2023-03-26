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
#include <FireDAC.Phys.ODBC.hpp>
#include <FireDAC.Phys.ODBCDef.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TFDQuery *Qfirma;
	TDataSource *DSQfirma;
	TFDConnection *Baza;
	TFDQuery *Qmedic;
	TDataSource *DSQmedic;
	TFDQuery *Qclient;
	TFDQuery *Qcartela;
	TDataSource *DSQclient;
	TDataSource *DScartela;
	TFDQuery *Client_ins;
	TFDQuery *Client_upd;
	TFDQuery *Client_del;
	TFDQuery *Cartela_ins;
	TFDQuery *Cartela_upd;
	TFDQuery *Cartela_del;
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
