/*
 * Dot Matrix.c
 *
 * Created: 19-Dec-22 2:54:43 PM
 * Author : Asus
 */ 

#include <avr/io.h>
#define F_CPU 1000000 // Clock Frequency
#include <util/delay.h>

int mat[9][8] = {
	0,0,1,1,0,0,0,0,
	0,0,1,0,1,0,0,0,
	0,0,1,0,1,0,0,0,
	0,0,1,1,0,0,0,0,
	0,0,1,0,1,0,0,0,
	0,0,1,0,1,0,0,0,
	0,0,1,1,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0
};

void display(){
	int row = 1 ;
	for(int i = 0 ; i < 8 ; i ++ ){
		PORTD = ~row ;
		int col = 0 ;
		for(int j = 0 ; j < 8 ; j ++ ){
		//int k = 7 - j ;
			if(mat[i][j]){
				col += 1 << j ;
			}
		}
		PORTA = col ;
		_delay_ms(2);
		
		row = row << 1 ;
	}
	
}



void display_shift_down()
{
	
	for(int i = 8; i>0; i--){
		for(int j = 0; j<8; j++) mat[i][j] = mat[i-1][j];
	}
	
	for(int i = 8; i>=0; i--){
		mat[0][i] = mat[8][i];
	}
	
	
	
}


int main(void)
{
	
	DDRA = 0b11111111; // A for columns
	DDRD = 0b11111111; // D for rows
	int cnt = 0 ;
	/* Replace with your application code */
	while (1)
	{
		for(int i = 0 ; i < 200 ; i ++ ){
			display() ;
		}
		_delay_ms(100);
		display_shift_down() ;
	}
	
	
}