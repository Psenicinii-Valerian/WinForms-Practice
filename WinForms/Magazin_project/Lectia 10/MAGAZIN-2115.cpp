//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("UDM.cpp", DM); /* TDataModule: File Type */
USEFORM("UMAIN.cpp", FMAIN);
USEFORM("URECEPTIE.cpp", FRECEPTIE);
USEFORM("UCHECK.cpp", FCheck);
USEFORM("UAUTENTIFICARE.cpp", FAUTENTIFICARE);
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
		Application->CreateForm(__classid(TFAUTENTIFICARE), &FAUTENTIFICARE);
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
