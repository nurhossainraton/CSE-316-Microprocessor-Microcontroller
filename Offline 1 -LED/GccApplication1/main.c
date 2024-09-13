/*
 * GccApplication1.c
 *
 * Created: 12-Dec-22 3:02:57 PM
 * Author : Asus
 */ 

#include <avr/io.h>
#define F_CPU 1000000 // Clock Frequency
#include <util/delay.h>



int main(void)
{
	DDRA = 0b00110000 ;
	PORTA = 0b00110000 ;
	int flag = 0 ;
    /* Replace with your application code */
    while (1) 
    {
		_delay_ms(1000);
		if(flag){
			PORTA = 0b00100000 ;	
		}
		else{
			PORTA= 0b00010000 ;
		}
		flag = 1 - flag ;
    }
}

