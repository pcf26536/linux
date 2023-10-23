/*
   A program that executes a bash script
   `/mnt/files/Repositories/linux/system-upgrade.sh`

   The script is responsible for updating a manjaro system via `yay`
*/
#include <stdlib.h>

int main()
{
    system("system-upgrade.sh");
}
