// SPDX-License-Identifier: BSD-3-Clause
int puts(const char *s);

static void hi(void)
{
	puts("Hi!");
}

static void bye(void)
{
	puts("Bye!");
}

int main(void)
{
	hi();
	bye();
}
