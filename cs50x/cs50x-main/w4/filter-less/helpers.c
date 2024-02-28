#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Gets average of all three ranges (R,G,B) and
    // inputs that average for all three.
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            if (image[i][j].rgbtBlue == image[i][j].rgbtGreen && image[i][j].rgbtGreen == image[i][j].rgbtRed)
            {
                continue;
            }
            else
            {
                int avg = round((image[i][j].rgbtBlue + image[i][j].rgbtGreen + image[i][j].rgbtRed) / 3.0);
                image[i][j].rgbtBlue = avg;
                image[i][j].rgbtGreen = avg;
                image[i][j].rgbtRed = avg;
            }
        }
    }

    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Calculations for all RGB into 'sepia'.
            int sepiaRed = round(.393 * image[i][j].rgbtRed + .769 *  image[i][j].rgbtGreen + .189 * image[i][j].rgbtBlue);
            int sepiaGreen = round(.349 * image[i][j].rgbtRed + .686 * image[i][j].rgbtGreen + .168 * image[i][j].rgbtBlue);
            int sepiaBlue = round(.272 * image[i][j].rgbtRed + .534 * image[i][j].rgbtGreen + .131 * image[i][j].rgbtBlue);

            // Check if 'sepia' for all RGB are above 255.
            // If so, reduce them down to 255.
            if (sepiaRed > 255)
            {
                sepiaRed = 255;
            }
            if (sepiaGreen > 255)
            {
                sepiaGreen = 255;
            }
            if (sepiaBlue > 255)
            {
                sepiaBlue = 255;
            }

            // Input the new 'sepia' colors.
            image[i][j].rgbtRed = sepiaRed;
            image[i][j].rgbtGreen = sepiaGreen;
            image[i][j].rgbtBlue = sepiaBlue;
        }
    }

    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Initializing a copy of image.
    RGBTRIPLE copy[height][width];

    // Copying over pixels of image to copy.
    for (int i = 0; i < height; i++)
    {
        for (int  j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    // Looping through each pixel to flip
    for (int i = 0; i < height; i++)
    {
        // Only flip half of the pixels width-wise. Copy the first pixel to the
        // end of the row. Use 'RGBTRIPLE copy' to copy the last pixel with the
        // first pixel.
        for (int  j = 0; j < (width / 2); j++)
        {
            image[i][j] = image[i][width - j - 1];
            image[i][width - j - 1] = copy[i][j];
        }
    }

    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Initializing a copy of image.
    RGBTRIPLE copy[height][width];

    // Copying over pixels of image to copy.
    for (int i = 0; i < height; i++)
    {
        for (int  j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    // Looping through all pixels (i, j)
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Initializing variables for calculations
            int pixel_count = 0;
            float red_sum = 0;
            float green_sum = 0;
            float blue_sum = 0;

            // Using if-else cases to handle case where pixels are at the edge
            // of perimeter, then calculating the sum of all RGB colors around
            // that single pixel.

            // First Case: Top-Left Pixel
            if (i == 0 && j == 0)
            {
                // Start at pixel, add the summation of all pixels around it.
                for (int x = i; x <= (i + 1); x++)
                {
                    for (int y = j; y <= (j + 1); y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Second Case: Top-Side Pixels
            else if (i == 0 && (j > 0 && j < (width - 1)))
            {
                for (int x = i; x <= (i + 1); x++)
                {
                    for (int y = (j - 1); y <= (j + 1); y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Third Case: Top-Right Pixel
            else if (i == 0 && j == (width - 1))
            {

                for (int x = i; x <= (i + 1); x++)
                {
                    for (int y = (j - 1); y <= j; y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Fourth Case: Left-Side Pixels
            else if ((i > 0 && i < (height - 1)) && j == 0)
            {
                for (int x = (i - 1); x <= (i + 1); x++)
                {
                    for (int y = j; y <= (j + 1); y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Fifth Case: Right-Side Pixels
            else if ((i > 0 && i < (height - 1)) && j == (width - 1))
            {
                for (int x = (i - 1); x <= (i + 1); x++)
                {
                    for (int y = (j - 1); y <= j; y++)
                    {

                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Sixth Case: Bottom-Left Pixel
            else if (i == (height - 1) && j == 0)
            {
                // (j)(j+1)
                // ___ ___
                //|___|___| (i-1)
                //|___|___| (i)
                for (int x = (i - 1); x <= i; x++)
                {
                    for (int y = 0; y <= 1; y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Seventh Case: Bottom-Side Pixels
            else if (i == (height - 1) && (j > 0 && j < (width - 1)))
            {
                for (int x = (i - 1); x <= i; x++)
                {
                    for (int y = (j - 1); y <= (j + 1); y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // Eighth Case: Bottom-Right Pixel
            else if (i == (height - 1) && j == (width - 1))
            {
                for (int x = (i - 1); x <= i; x++)
                {
                    for (int y = (j - 1); y <= j; y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }
            // All Other Cases: Pixels that are NOT on the edge/border
            else
            {
                for (int x = (i - 1); x <= (i + 1); x++)
                {
                    for (int y = (j - 1); y <= (j + 1); y++)
                    {
                        pixel_count++;
                        red_sum += copy[x][y].rgbtRed;
                        green_sum += copy[x][y].rgbtGreen;
                        blue_sum += copy[x][y].rgbtBlue;
                    }
                }
            }

            // Calculating averages onto new variables:
            // (red_avg, green_avg, blue_avg)
            int red_final = round(red_sum / pixel_count);
            int green_final = round(green_sum / pixel_count);
            int blue_final = round(blue_sum / pixel_count);

            // Inputting new averages for a single pixel
            image[i][j].rgbtRed = red_final;
            image[i][j].rgbtGreen = green_final;
            image[i][j].rgbtBlue = blue_final;
        }
    }

    return;
}
