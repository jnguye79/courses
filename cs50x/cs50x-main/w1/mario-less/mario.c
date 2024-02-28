#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int input = 0; // Set outside variable for both loop usages

    while (true)
    {
        input = get_int("Height: "); // Import user response
        if (input <= 0 || input > 8)
        {
            // Handle Cases: input is less than 1, greater than 8 inclusive, continue loop

        }
        else
        {
            break; // If inside correct domain, break out of loop.
        }
    }

    for (int i = 0; i < input; i++) // 1st loop handles '\n' movement
    {
        for (int j = 0; j < input; j++) // 2nd loop handles prints per line
        {
            if (j < (input - i) - 1) // Handles print statement, j prints '.' if less than (input - i - 1)
            {
                printf(" ");
            }
            else
            {
                printf("#"); // ...otherwise, print out '#'
            }
        }
        printf("\n");
    }
}