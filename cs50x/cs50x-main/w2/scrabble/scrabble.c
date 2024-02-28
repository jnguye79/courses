#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // Check score conditions
    if (score1 == score2)
    {
        printf("Tie!\n");
    }
    else if (score1 > score2)
    {
        printf("Player 1 Wins!\n");
    }
    else
    {
        printf("Player 2 Wins!\n");
    }
}

int compute_score(string word)
{
    // Initializing variables: sum
    int sum = 0;

    // Adding total sum of characters.
    // ie. Checking each letter if its an alphabet, then checking if its upper
    // or lower to handle ASCII differences.
    for (int i = 0; i < strlen(word); i++)
    {
        if (isalpha(word[i]))
        {
            if (isupper(word[i]))
            {
                int temp = word[i] - 65;
                sum += POINTS[temp];
            }
            else
            {
                int temp = word[i] - 97;
                sum += POINTS[temp];
            }
        }
    }

    // Returning an int variable
    return sum;
}
