""" Module 2 - Exercise 6: COVID Testing Pt.2
Covid testing data collection utility.

2. In no less than 150 words please describe what some potential problems or pitfalls 
might be encountered with this data processing pipeline. For example, how resilient or adaptable 
is the format of the data file? What could be done to better describe the contents of the file? 
Could another data format work better? What problems might there be with how the data is sent off 
each night? How many people could use this program at the same time? These questions are just 
examples, which you may choose to answer, but you can also come up with your own. Try to think 
creatively and defensively about how this program might be used. (5 points)

ANSWER RESPONSE:
I'd like to list out the potential problems starting with the formatting of the file, to the actual
disadvantages outside of the document itself.

- Format: Starting with the format, there is no clear-cut answer for each of the values placed within
the document after the name of the client. Of course the format follows a specific structure, but most
individuals would have no clue what each value represents at face-value. There could be a change of staffs
for a specific night and the document may not get processed at all by the HHS due to the unknown values
in the document. Additionally, the format would not be able to differentiate between two specific individuals
with the same name. This feature is missing an personalized ID tag for each individual who submitted a test.
Last but not least, there should be a way to find people who have taken multiple tests.

- Adaptability: Next up, adaptability could take a lot of time and effort for files written in as this.
Say of example, HHS requires another column to be added into the csv file. How would this change the csv
file? These changes could lead to a misinterpretation by other formatting applications or even HHS staffs
who are translating this. Another topic is about how many people can be maintaining the file at a time. 
As we can tell, inputting data into an txt file only allows one individual to complete this.
"""
def main():
    results = []

    while True:
        print()

        name = input("Name (or stop): ")
        if name == "stop":
            break

        answer = input("Test positive? [y,n]: ")
        if answer == "y":
            test_result = 1 
        elif answer == "n":
            test_result = 0
        else:
            print("Invalid input, please try again")
            continue

        q = float(input("Sample quality: "))
        t = int(input("Minutes since last calibration: "))

        if not is_valid_sample(q):
            print("Invalid sample, stopping!")
            break
        elif not is_valid_calibration(t):
            print("Invalid calibration, stopping!")
            break
        else:
            results.append([name, test_result, q, t])

    save_results(results)


def save_results(results):
    """Write existing test data.

    This function accepts a list of tests results and writes them to the 
    file covid-results.csv.
    """
    # TODO: write the test results

    f = open('covid-results.csv')
    f.write(results)
    f.close()


def is_valid_sample(sample_quality):
    """Test if the sample quality is acceptable.

    Returns True if the sample quality is high enough for valid test results
    and, False if it is not.
    """
    if sample_quality > .9:
        return True
    else:
        return False


def is_valid_calibration(calibration_time):
    """Test if the calibration is acceptable.

    Returns True if the calibration time is low enough for valid results, and
    False if it is not.
    """
    if calibration_time < 5:
        return True
    else:
        return False

main()
