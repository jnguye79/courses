# Problem Set 1 - Home Federal Savings Bank

ans = input("Greeting: ").strip()

match ans:
    case "Hello" | "Hello, Newman":
        print("$0")
    case "How you doing?":
        print("$20")
    case "What's happening?"| "What's up?":
        print("$100")