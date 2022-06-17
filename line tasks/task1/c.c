#include <stdio.h>
#define number 3

int main() {
    int sizeString = 0;
    char string[6] = "Human\0";
    for(int i=0; i<number;i++) {
        for(int j=0;string[j]!='\0';j++){
            printf("%c",string[j]);
            if(i == 0)sizeString++;
        }
        if(i<number-1)printf(",");
    }
    printf("\nSize string = %d", sizeString);
    return 0;
}
