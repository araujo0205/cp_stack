int pilha[ 10 ]; /* n is an array of 10 integers */
int last = 0;
int j;
int pop(int value)
{
	if(last < 9)
	{
		pilha[last] = value;
		return pilha[last++];
	}
	else
	{
		return -1;
	}
}

int push()
{
	return pilha[--last];
}

int * list()
{
	return pilha;
}
