#ifndef _TXT_SCROLL_H_
#define _TXT_SCROLL_H_

void scroll(char * texte, unsigned int l, unsigned int step);

void killVBL();
void restoreVBL();
void rupture(unsigned char nbCharLigne);

#endif
