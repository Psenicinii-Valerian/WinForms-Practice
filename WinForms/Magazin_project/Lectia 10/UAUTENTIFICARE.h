//---------------------------------------------------------------------------

#ifndef UAUTENTIFICAREH
#define UAUTENTIFICAREH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.Buttons.hpp>
//---------------------------------------------------------------------------
class TFAUTENTIFICARE : public TForm
{
__published:	// IDE-managed Components
	TImage *Image1;
	TLabel *Label1;
	TComboBox *ComboBox1;
	TLabel *Label2;
	TLabel *Label3;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TEdit *Edit1;
	TEdit *Edit2;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall SpeedButton2Click(TObject *Sender);
	void __fastcall ComboBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall SpeedButton1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFAUTENTIFICARE(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFAUTENTIFICARE *FAUTENTIFICARE;
//---------------------------------------------------------------------------
#endif
