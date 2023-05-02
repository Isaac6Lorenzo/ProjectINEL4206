#include <msp430.h>

unsigned int chrep(char *, char, char); // function prototype
extern int chrepa(char *, char, char);

/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer

	volatile unsigned int x = 432, y = 234;
	volatile unsigned long p = 0;

	p = ((long)x) * ((long) y) ;

	char s[] = "This is My MaxiMuM Mex" ;
	x = chrep(s, 'M', 'm' ) ;
    char s2[] = "This is My MaxiMuM Mex" ;
	y = chrepa(s2, 'M', 'm' ) ;

	return 0;
}

unsigned int chrep(char *s, char inc, char outc) {

    int i = 0, j = 0 ;

    while (s[i] != '\0') {
        if (s[i] == inc) {
            s[i] = outc ;
            j++ ;
        }
        i++ ;
    }
    return j ;
}
