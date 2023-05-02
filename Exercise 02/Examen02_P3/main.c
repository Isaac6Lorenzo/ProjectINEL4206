#include <msp430.h>

\
extern int myfun(int *, int) ; // Prototype

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
    //exercise #3
    int myarray[] = {13,-15,87,39,42,-12,9,123} ;
    int arlen = 8 ;
    int x = 0;
    x = myfun(myarray, arlen) ;

    return 0;
}
