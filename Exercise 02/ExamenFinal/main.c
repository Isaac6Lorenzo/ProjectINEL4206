//int x[] = {20, 40, 12, 15, -2, 0};
//int count = 6;
//int max = 0;
//int min =0;


#include <msp430.h>

extern int q4(int) ;
extern int q5(int *, int) ;

/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer

	// tests are examples; should work with other numbers too

	// test q4
	int x = 5;
	int y = 0 ;

	y = q4(x) ; // y should be 3*5 - 10 = 5

	x = -23, y = 0;
    y = q4(x) ; // y should be 3*(-23) - 10 = -79

    // test q5
    int mya[] = {5,-25, 345, 378, -201};
    y = 0 ;     // reusing y
    y = q5(mya, 5) ;    // y should be -201

    int mya2[] = {-23, 34, 219, -45, 32, 456, 64, -56, 9, -67, 222} ;
    y = q5(mya2, 11) ;    // y should be -67

	return 0;
}
