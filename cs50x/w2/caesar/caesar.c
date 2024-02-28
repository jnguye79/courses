#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int only_digits(string);
char rotate(char, int);

int key;

int main(int argc, string argv[])
{
    if (argc == 1 || argc > 2) // Handling both no
    {
        printf("Usage: ./caesar key\n");
        return (1);
    }
    else
    {
        int check = only_digits(argv[1]);

        if (check == 0)
        {
            printf("Usage: ./caesar key\n");
            return (1);
        }
    }

    key = atoi(argv[1]);
    string prompt = get_string("plaintext: ");
    printf("ciphertext: ");

    for (int i = 0; i < strlen(prompt); i++)
    {
        char cipher = rotate(prompt[i], key);
        printf("%c", cipher);
    }

    printf("\n");
}

int only_digits(string argument)
{
    for (int i = 0; i < strlen(argument); i++)
    {
        if (isdigit(argument[i]))
        {}
        else
        {
            return 0; // Any letter will return FALSE input and end the function
        }
    }

    return 1; // If there are no letters within the string, return TRUE
}

char rotate(char plain, int change)
{
    if (isalpha(plain))
    {
        if (isupper(plain))
        {
            char cipher = ((plain - 65) + change) % 26;
            cipher += 65;
            return cipher;
        }
        else if (islower(plain))
        {
            char cipher = ((plain - 97) + change) % 26;
            cipher += 97;
            return cipher;
        }
    }

    return plain;
}