// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// TODO: Choose number of buckets in hash table
// Changed from 26 to 676 (26 x 26) to account for double digits
const unsigned int N = 676;

// Hash table
node *table[N];

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO

    // Hashing word to obtain the hash value.
    int h = hash(word);

    // Making memory space for node and assigning index of hash table to node.
    node *cursor = malloc(sizeof(node));
    cursor = table[h];

    // Traversing linked list, searching for word. Return true if found.
    while (cursor != NULL)
    {
        if (strcasecmp(cursor->word, word) == 0)
        {
            return true;
        }

        cursor = cursor->next;
    }

    free(cursor);
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function

    // Initializing variables, using first letter in word.
    char letter = word[0];
    int temp;

    // If the first letter is an alphabet, check upper/lower and 'int' it.
    // (Source: Used previous project (ie. scrabble.c) to help)
    if (isalpha(letter))
    {
        if (isupper(letter))
        {
            temp = letter - 65;
            temp = temp % N;
            return temp;
        }
        else
        {
            temp = letter - 97;
            temp = temp % N;
            return temp;
        }
    }

    return toupper(word[0]) - 'A';
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO

    // Creating file pointer to open up dictionary and initializing variables.
    FILE *f = fopen(dictionary, "r");
    char buffer[255];

    // Check for full memory from file pointer (aka NULL value).
    if (f == NULL)
    {
        return false;
    }
    else
    {
        // Looping through each line until EOF.
        while (fscanf(f, "%s", buffer) != EOF)
        {
            // Allocate memory for the word's node.
            node *n = malloc(sizeof(node));
            node *cursor = malloc(sizeof(node));

            // Check for full memory from node (aka NULL value).
            if (n == NULL || cursor == NULL)
            {
                free(n);
                free(cursor);
                return false;
            }

            // Copy the string into the node->word.
            strcpy(n->word, buffer);
            cursor = table[hash(buffer)];

            // Using hash function to determine placement inside
            // hash table. Insert node there.
            if (cursor->next == NULL)
            {
                n->next = NULL;
            }
            else
            {
                n->next = cursor->next;
            }

            cursor->next = n;

            free(cursor);
        }

        fclose(f);
        return true;
    }

    fclose(f);
    return false;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO

    // Initializing variables.
    int count = 0;
    node *cursor = malloc(sizeof(node));

    // Checking memory allocation failures.
    if (cursor == NULL)
    {
        return 0;
    }

    // Looping through each hash table array and count each linked node.
    for (int i = 0; i < N; i++)
    {
        cursor = table[i];

        while (cursor != NULL)
        {
            count++;
            cursor = cursor->next;
        }
    }

    // Free the cursor and return count.
    free(cursor);
    return count;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO

    // Initializing two traversal nodes (tmp, cursor).
    node *tmp = malloc(sizeof(node));
    node *cursor = malloc(sizeof(node));

    if (tmp == NULL || cursor == NULL)
    {
        free(tmp);
        free(cursor);
        return false;
    }

    // Looping through the entire hash array.
    for (int i = 0; i < N; i++)
    {
        // Set the nodes up for linked list traversal.
        tmp = table[i];
        cursor = table[i]->next;

        // Until the linked list is empty. Continuously free up memory.
        while (cursor != NULL)
        {
            free(tmp);
            tmp = cursor;
            cursor = cursor->next;
        }
    }

    // Free up 'tmp', 'cursor', and return true.
    free(tmp);
    free(cursor);
    return true;
}
