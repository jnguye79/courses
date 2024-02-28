#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;

// Initializing global variables
int BLOCK_SIZE = 512;
unsigned char buffer[512];
int count = 0;


int main(int argc, char *argv[])
{
    // Checking argument exception.
    if (argc != 2)
    {
        printf("The program only accepts one argument. (ie. ./recover [argument]))");
        return 1;
    }

    // Opening file and checking pointer.
    FILE *fp = fopen(argv[1], "r");
    if (fp == NULL)
    {
        printf("Error in opening file");
        return 1;
    }

    // Initializing img file pointer and filename.
    FILE* img = NULL;
    char* filename = malloc(8);

    // Continuously read the file into the buffer.
    while (fread(buffer, 1, BLOCK_SIZE, fp) == BLOCK_SIZE)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (count > 0)
            {
                fclose(img);
            }

            sprintf(filename, "%03i.jpg", count);
            img = fopen(filename, "w");
            count++;
        }
        else
        {
            fwrite(buffer, 1, BLOCK_SIZE, img);
        }

    }

    free(filename);
    fclose(img);
    fclose(fp);

    return 0;
}