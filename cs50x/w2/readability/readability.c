#include <cs50.h>
#include <stdio.h>
#include <math.h>

int count_letters();
int count_words();
int count_sentences();

int main(void)
{
    string prompt = get_string("Text: ");
    float L = (float) count_letters(prompt) / count_words(prompt) * 100;
    float S = (float) count_sentences(prompt) / count_words(prompt) * 100;

    printf("Calculations: 0.0588 * %f - 0.296 * %f - 15.8\n", L, S);
    float index = (0.0588 * L) - (0.296 * S) - 15.8;
    printf("Float Answer: %f\n", index);
    int ans = (int) round(index);
    printf("Int Answer: %i\n", ans);

    if (ans < 1) // If index is less than 1, print out "Before Grade 1"
    {
        printf("Before Grade 1\n");
    }
    else if (ans >= 16) // Otherwise, index is greater than or equal to 16, print out "Grade 16+"
    {
        printf("Grade 16+\n");
    }
    else // Else, handle grade input as originally intended
    {
        printf("Grade %i\n", ans);
    }
}

int count_letters(string text)
{
    int count = 0;
    int x = 0;

    while (text[x] != '\0')
    {
        if ((text[x] >= 'a' && text[x] <= 'z') || (text[x] >= 'A' && text[x] <= 'Z'))
        {
            count++;
            x++;
        }
        else
        {
            x++;
        }
    }
    printf("Letters: %i\n", count);
    return count;
}

int count_words(string text)
{
    int count = 0;
    int x = 0;

    while (text[x] != '\0')
    {
        if (text[x] == ' ')
        {
            count++;
            x++;
        }
        else
        {
            x++;
        }
    }

    count += 1;
    printf("Words: %i\n", count);
    return count;
}

int count_sentences(string text)
{
    int count = 0;
    int x = 0;

    while (text[x] != '\0')
    {
        if (text[x] == '.' || text[x] == '!' || text[x] == '?')
        {
            count++;
            x++;
        }
        else
        {
            x++;
        }
    }
    printf("Sentences: %i\n", count);
    return count;
}