import re

def comment_checker(input):
    pattern = "\"\"\"[^\"]*\"\"\"|#.*"    
    result = re.findall(pattern, input)

    if(result):
        print("Contains comment")
    else:
        print("Does not contain comment")

    print(result)

sample = "abc\n# Sample comment\ndfb\n\"\"\"Sample\ncomment\"\"\"\nabc"
comment_checker(sample)