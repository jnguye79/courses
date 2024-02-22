/* Name: JN.
Date Started: ---
Date Finished: ---
Project 1 - Grades */

#include <stdio.h>
#include <math.h>
#define MAX 50

float true_scores(int num, int drop, int penalty, int b[], int c[], int d[]);
void end_variables(int num, int size, int b[], int d[]);

int main() {

   int N = 1, P = 0, X = 0;
   char W = '@';

   scanf(" %d%d %c", &P, &X, &W);
   scanf(" %d", &N);

   if (N < 1 || N > MAX) {
      printf("ERROR: Number of Assignments OUT OF RANGE\n");
   } else {
      if (N == 2) {
         int i, a, b, c, d, assign[2], score[2], weight[2], days_late[2];

         for (i = 0; i < N; i++) {
            scanf(" %d%*c%d%*c%d%*c%d", &a, &b, &c, &d);
            assign[a-1] = a;
            score[a-1] = b;
            weight[a-1] = c;
            days_late[a-1] = d;
         }

         printf("Numeric Score: %5.4f\n", true_scores( N, X, P, score, weight, days_late));
         printf("Points Penalty Per Day Late: %d\n", P);
         printf("Number of Assignments Dropped: %d\n", X);
         printf("Values Provided:\n");
         printf("Assignment, Score, Weight, Days Late\n");

         for (i = 0; i < N; i++) {
            printf("%d, %d, %d, %d\n", assign[i], score[i], weight[i], days_late[i]);
         }

         if (W == 'Y' || W == 'y') {
            end_variables(N, P, score, days_late);
         } else {
         }

      } else if (N == 4) {
         int i, a, b, c, d, assign[4], score[4], weight[4], days_late[4];

         for (i = 0; i < N; i++) {
            scanf(" %d%*c%d%*c%d%*c%d", &a, &b, &c, &d);
            assign[a-1] = a;
            score[a-1] = b;
            weight[a-1] = c;
            days_late[a-1] = d;
         }

         printf("Numeric Score: %5.4f\n", true_scores( N, X, P, score, weight, days_late));
         printf("Points Penalty Per Day Late: %d\n", P);
         printf("Number of Assignments Dropped: %d\n", X);
         printf("Values Provided:\n");
         printf("Assignment, Score, Weight, Days Late\n");

         for (i = 0; i < N; i++) {
            printf("%d, %d, %d, %d\n", assign[i], score[i], weight[i], days_late[i]);
         }

         if (W == 'Y' || W == 'y') {
            end_variables(N, P, score, days_late);
         } else {
         }
      }
   }
   return 0;
}

float true_scores(int num, int drop, int penalty, int b[], int c[], int d[]) {

   int new_assign = num-drop;
   int i;
   float sum = 0;

   if (drop == 2) {

      for (i = 0; i < new_assign; i++) {
         sum = sum + ((b[i] - (d[i] * penalty)) * .5);
      }

      return sum;
   } else {

      for (i = 0; i < new_assign; i++) {
         sum = sum + ((b[i] - (d[i] * penalty)) * (c[i]));
      }

      sum = sum / 100;
      return sum;
   }
}

void end_variables(int num, int size, int b[], int d[]) {
   int j;
   float mean = 0, standard_dev = 0;

   for (j = 0; j < num; j++) {
      mean = mean + (b[j] - (d[j] * size));
   }
   mean = mean / num;

   if (num == 2) {
      int diff[2];

      for (j = 0; j < num; j++) {
         diff[j] = (b[j] - (d[j] * size)) - mean;
         diff[j] = pow(diff[j], 2);
         standard_dev = standard_dev + diff[j];
      }

      standard_dev = standard_dev/num;
      standard_dev = sqrt(standard_dev);

   } else if (num == 4) {
      int diff[4];

      for (j = 0; j < num; j++) {
         diff[j] = (b[j] - (d[j] * size)) - mean;
         diff[j] = pow(diff[j], 2);
         standard_dev = standard_dev + diff[j];
      }

      standard_dev = standard_dev / num;
      standard_dev = sqrt(standard_dev);

   } else {
   }

   printf("Mean: %5.4f, Standard Deviation: %5.4f\n", mean, standard_dev);
}