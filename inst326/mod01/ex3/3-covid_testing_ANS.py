# Module 1 - Exercise 3: Covid Analysis

def is_valid_sample(sample_quality):
    """Test if the sample quality is acceptable.

    Returns True if the sample quality is high enough for valid test results
    and, False if it is not.
    """
    if sample_quality >= .9:
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

def main():
    total_tests = 0
    positive_tests = 0
    race = []
    gender = []
    income = []

    while True:
        # Handle Case-Exceptions (TypeError? or ValueError?)
        wrongResponse = True
        while (wrongResponse == True):
            answer = input("Test positive? [y,n or stop]: ")
            if (answer.lower() == 'y' or answer.lower() == 'n' or answer.lower() == 'stop'):
                wrongResponse = False

        if answer == "stop":
            break

        if answer == "y":
            test_result = True
        else:
            test_result = False
        # Information Collection
        race.append(input("What is your race?: "))
        gender.append(input("What is your gender?: "))
        income.append(int(input("What is your income?: ")))

        q = float(input("Sample quality: "))
        t = int(input("Hours since last calibration: "))

        total_tests += 1

        if is_valid_sample(q) and is_valid_calibration(t):
            positive_tests += 1
        else:
            # Remember to add Error Exception
            quit()


    print()
    print("Total tests: ", total_tests)
    print("Positive: ", positive_tests)
    print("Negative: ", total_tests - positive_tests)

main()
