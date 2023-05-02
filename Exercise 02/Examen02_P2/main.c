#include <msp430.h>


extern int asmavg(int, int) ; // Prototype

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer

//    exercise #2
    int n1 = 5, n2 = 2, avg = 0 ;
    avg = asmavg(n2, n1) ;



    return 0;
}
