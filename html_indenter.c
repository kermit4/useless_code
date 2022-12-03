#include <stdio.h>
#define PAGE_SIZE 4095
void indent(int n)
{
	if (n < 0)
		n = 0;
	if (n > 20)
		n = 20;
	fwrite("                                            ", 1, n * 2, stdout);
}
int main(int argc, char *argv[])
{
	int depth = 0, red;
	char buf[PAGE_SIZE];
	while ((red = fread(buf, 1, PAGE_SIZE, stdin)) > 0) {
		char *c = buf;
		while (c < buf + red) {
			if (*c == '<') {
				fputc('\n', stdout);
				if (c != buf + red - 1) { // BUG unhandled block boundary case
					if (*(c + 1) == '/')
						indent(--depth);
					else
						indent(depth++);
				}
			}
			if (*c != ' ')		// drop existing whitespace
				fputc(*c, stdout);
			if (*c == '\n')
				indent(depth);
			if (*c == '>') {
				fputc('\n', stdout);
				indent(depth);
			}
			c++;
		}
	}
}
