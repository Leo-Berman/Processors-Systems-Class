diamond_size = 5

def tips():
    for i in range(diamond_size-1):
        print(" ",end="")
    print("*")

def body():
    for i in range(diamond_size-1):
        for j in range(diamond_size-(i+2)):
            print(" ",end="")
        print("*",end="")
        
        for k in range(2*i+1):
            print(" ",end="")
        print("*")

def reverse_body():
    for i in range(diamond_size-2):
        for j in range(i+1):
            print(" ",end="")
        print("*",end="")

        for k in range((diamond_size-i-2)*2-1):
            print(" ",end="")
        print("*")

def main():

    tips()
    body()
    reverse_body()
    tips()
    
if __name__ == "__main__":
    main()
