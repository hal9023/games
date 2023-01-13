#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

// if it keeps raw mode enabled, press control C and type "reset" to go back to a normal terminal

struct termios orig_termios;

void disableRawMode() {
  tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
}
void enableRawMode() {
  tcgetattr(STDIN_FILENO, &orig_termios);
  atexit(disableRawMode);

  struct termios raw = orig_termios;
  raw.c_lflag &= ~(ECHO | ICANON);

  tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);

}

int main() {
  enableRawMode();
  
  char c;  //input key
  while (read(STDIN_FILENO, &c, 1) == 1 && c != 'l') {
    if (iscntrl(c)) {
      printf("%d\n", c);
    } else {
      printf("%d ('%c')\n", c, c);
      if(c == 'a') {
        printf("left");
      }
    }
  }
  


  return 0;
}