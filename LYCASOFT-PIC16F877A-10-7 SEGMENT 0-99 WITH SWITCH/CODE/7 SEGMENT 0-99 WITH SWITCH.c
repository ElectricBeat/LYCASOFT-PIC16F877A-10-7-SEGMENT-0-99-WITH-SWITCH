#include<pic.h>
#include<htc.h>
#define _XTAL_FREQ 20e6
__CONFIG(0X3F3A);

char Data[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
//char Data[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

#define DIG1 RC0
#define DIG2 RC1
#define SW RC2

#define ON 1
#define OFF 0

int Count;

void Segment_Runner()
{
	char Disp1_Data,Disp2_Data;
	int Temp_Data;

	Disp1_Data = Count%10;
	Disp2_Data = Count/10;

	DIG1 = ON;
	PORTB = Data[Disp2_Data];
	__delay_ms(10);
	DIG1 = OFF;

	DIG2 = ON;
	PORTB = Data[Disp1_Data];
	__delay_ms(10);
	DIG2 = OFF;
}

void main()
{
	TRISB=0X00;
	PORTB=0X00;
	TRISC=0X04;
	PORTC=0X00;
	
	while(1)
	{
		while(SW==1)
		{
			Count++;
			if(Count>=100)
			{
				Count=0;
			}
			while(SW==1);
		}
		Segment_Runner();
	}
}