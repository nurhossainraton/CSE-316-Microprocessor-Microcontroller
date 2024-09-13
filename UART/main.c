#define F_CPU 1000000
#include <avr/io.h>
#include <util/delay.h>

#include <avr/interrupt.h>

void uart_init()
{
	UCSRA = 0b00000010;
	UCSRB = 0b00011000;
	UCSRC = 0b10000110;
	UBRRH = 0;
	UBRRL = 12;
}
void uart_send(unsigned char data){
	while ((UCSRA & (1<<UDRE)) == 0x00);
	UDR = data;
}
unsigned char uart_receive(void){
	while ((UCSRA & (1<<RXC)) == 0x00);
	return UDR;
}

ISR(INT2_vect)//STEP2
{
	uart_send('a');
}


int main(void)
{
	uart_init();
	
	
	//DDRB = 0xFF;
	//PORTB = 0b01010101;
	DDRD = 0b01000000;
	DDRB = 0b00000000;

	//interrupt
	GICR = (1 << INT2); //STEP3
	MCUCSR = 0x00;
	sei();//STEP5
	//interrupt_end

	while(1)
	{
	}
}