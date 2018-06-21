/*****************************************************
This program was produced by the
CodeWizardAVR V2.03.4 Standard
Automatic Program Generator
© Copyright 1998-2008 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 2009-10-21
Author  : 
Company : 
Comments: 


Chip type           : ATmega16
Program type        : Application
Clock frequency     : 4.000000 MHz
Memory model        : Small
External RAM size   : 0
Data Stack size     : 256
*****************************************************/

#include <mega16.h>
int state=1;

flash unsigned char led_7[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F}; 
flash unsigned char position[6]={0xfe,0xfd,0xfb,0xf7,0xef,0xdf};

unsigned char    time[3],time1[3];           //  ±°¢∑÷°¢√Îº∆ ˝µ•‘™
unsigned char    dis_buff[6];       // œ‘ æª∫≥Â«¯£¨¥Ê∑≈“™œ‘ æµƒ6∏ˆ◊÷∑˚µƒ∂Œ¬Î÷µ
int    time_counter;                // ÷–∂œ¥Œ ˝º∆ ˝µ•‘™
unsigned char    posit;
bit    point_on, time_1s_ok;
interrupt [EXT_INT0] void INT_0 (void)
{
 state=1;
}
interrupt [EXT_INT1] void INT_1 (void)
{
 state=2;
} 

void display(void)                // 6ŒªLED ˝¬Îπ‹∂ØÃ¨…®√Ë∫Ø ˝
{    
    PORTA = led_7[dis_buff[posit]]; 
    if (point_on && (posit==2||posit==4)) PORTA |= 0x80;
    PORTB = position[posit]; 
    if (++posit >=6 ) posit = 0;
}
void display1(void)                // 6ŒªLED ˝¬Îπ‹∂ØÃ¨…®√Ë∫Ø ˝
{    
    PORTA = led_7[dis_buff[posit]]; 
    if (point_on && (posit==2||posit==4)) PORTA |= 0x80;
    PORTB = position[posit]; 
    if (++posit >1 ) posit = 0;
}

// Timer 0 ±»Ωœ∆•≈‰÷–∂œ∑˛ŒÒ
interrupt [TIM0_COMP] void timer0_comp_isr(void)
{
    TCNT0=0x83;
    switch(state)
    { case 1:

    {
    display();                  // µ˜”√LED…®√Ëœ‘ æ
    if (++time_counter>=500)
    {
        time_counter = 0;
        time_1s_ok = 1;
    }
    break;
    }
    case 2: 
    {
      display1();                  // µ˜”√LED…®√Ëœ‘ æ
    if (++time_counter>=500)
    {
        time_counter = 0;
        time_1s_ok = 1;
    }
    break;   
    }
    }
}

void time_to_disbuffer(void)    //  ±÷” ±º‰ÀÕœ‘ æª∫≥Â«¯∫Ø ˝
{
    unsigned char i,j=0;
    for (i=0;i<=2;i++)
    {
        dis_buff[j++] = time[i] % 10;
           dis_buff[j++] = time[i] / 10;
    }
}
void time_to_disbuffer1(void)    //  ±÷” ±º‰ÀÕœ‘ æª∫≥Â«¯∫Ø ˝
{
    unsigned char i,j=0;
    for (i=0;i<=2;i++)
    {
        dis_buff[j++] = time1[i] % 10;
           dis_buff[j++] = time1[i] / 10;
    }
}

// Declare your global variables here

void main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out 
// State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=0 
PORTA=0x00;
DDRA=0xFF;

// Port B initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTB=0x3F;
DDRB=0x3F;

// Port C initialization
// Func7=In Func6=In Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out 
// State7=T State6=T State5=1 State4=1 State3=1 State2=1 State1=1 State0=1 
PORTC=0x3F;
DDRC=0x3F;

// Port D initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTD=0x00;
DDRD=0x00;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: 62.500 kHz
// Mode: CTC top=OCR0  ctcƒ£ Ω
// OC0 output: Disconnected

TCCR0=0x03; 
 TCNT0=0x83; 
  OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer 1 Stopped
// Mode: Normal top=FFFFh
// OC1A output: Discon.
// OC1B output: Discon.
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer 1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=0x00;
TCCR1B=0x00;
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer 2 Stopped
// Mode: Normal top=FFh
// OC2 output: Disconnected
ASSR=0x00;
TCCR2=0x00;
TCNT2=0x00;
OCR2=0x00;

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
// INT2: Off
MCUCR=0x00;
MCUCSR=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=0x02;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
ACSR=0x80;
SFIOR=0x00;
GICR|=0xC0;
MCUCR=0x00;
MCUCSR=0x00;
GIFR=0xC0;

time[2] = 23; time[1] = 58; time[0] = 55;
time1[0]=60;        // …Ë ±º‰≥ı÷µ23:58:55 
posit = 0;
time_to_disbuffer();

// Global enable interrupts
#asm("sei")

while (1)
      {
      // Place your code here
        if (time_1s_ok)        // 1√ÎµΩ
        {
             time_1s_ok = 0;
            point_on = ~point_on;
            if (++time[0] >= 60)    // “‘œ¬ ±º‰µ˜’˚
            {
                time[0] = 0;
                if (++time[1] >= 60)
                {
                    time[1] = 0;
                    if (++time[2] >= 24) time[2] = 0;
                }
            }
           
             if (--time1[0] <= 0)    // “‘œ¬ ±º‰µ˜’˚
            {
                time1[0] = 60;
               
            }    
            switch(state)
            { 
            case 1:
            { time_to_disbuffer();    // –¬µ˜’˚∫√µƒ ±º‰ÀÕœ‘ æª∫≥Â«¯ 
            break;
            }
            case 2:
            {

            
            time_to_disbuffer1();    // –¬µ˜’˚∫√µƒ ±º‰ÀÕœ‘ æª∫≥Â«¯ 
            break;
            } 
            }
            
        }
        
      
      };
}
