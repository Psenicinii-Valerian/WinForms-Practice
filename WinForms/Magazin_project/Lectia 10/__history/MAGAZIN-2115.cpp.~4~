//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("UMAIN.cpp", FMAIN);
USEFORM("URECEPTIE.cpp", FRECEPTIE);
USEFORM("UDM.cpp", DM); /* TDataModule: File Type */
USEFORM("UCHECK.cpp", FCheck);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFMAIN), &FMAIN);
		Application->CreateForm(__classid(TFRECEPTIE), &FRECEPTIE);
		Application->CreateForm(__classid(TDM), &DM);
		Application->CreateForm(__classid(TFCheck), &FCheck);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
