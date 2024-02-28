# Problem Set 1 - File Extensions

ans = input("File name: ").strip().lower()
check = ans.find(".")

temp = ans.split(".")
new_ans = len(temp)
temp = temp[new_ans - 1]

match temp:
    case "gif" | "jpeg" | "png":
        print("image/" + temp)
    case "jpg":
        print("image/jpeg")
    case "pdf" | "zip":
        print("application/" + temp)
    case "txt":
        print("text/plain")
    case _:
        print("application/octet-stream")