
#include <math.h>
#include <stdio.h>

void drawBoard(char moves[])
{
    char spot;
    int count = 0; // used to index board at playable spots
    for(int i = 1; i < 8; i++)
        {
        for(int j = 1; j < 8; j++)
	    {
	        if(i%2 == 0) // determines when to print a '_'
	        {
	            spot = '_';
	        }
	        else if(j%2 == 0) // determines when to print a '|'
	        {
	            spot = '|';
	        }
	        else
	        {
	            count++;
	            if(moves[count] == 'x') // if moves array has a player move in spot
		        {
		            spot = 'x';
		        }
	            else if (moves[count] == 'o') // if moves array has cpu move in spot
		        {
		            spot = 'o';
		        }
	            else // if no move in spot
		        {
		            spot = ' ';
		        }
	        }
	        printf("%c",spot); // current spot on board
	    }
      printf("\n"); // new line
    }
}

