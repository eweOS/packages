#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <libgen.h>

int main(int argc, char **argv)
{
    const char * cmds[] = {
        "su",
        "ping",
        "ping6",
        "traceroute",
	"passwd",
	"login",
	"vlock",
	"wall"
    };

    const char * baseexec = basename(argv[0]);

    if (!strcmp("busybox-suidwrapper", baseexec))
    {
        if (argc > 1 && !strcmp("-l", argv[1])){
          for (int i = 0; i < sizeof(cmds) / sizeof(cmds[0]); ++i)
          {
            printf("%s ", cmds[i]);
          }
          printf("\n");
        } else {
          printf("busybox SUID wrapper\n\nSupported commands:\n");
          printf("Usage:\n -l\tList available SUID commands\n");
          if (argc > 1) return 1;
        }
        return 0;
    }

    for (int i = 0; i < sizeof(cmds) / sizeof(cmds[0]); ++i)
    {
        if (!strcmp(cmds[i], baseexec))
        {
            execv("/usr/bin/busybox", argv);
            return 0;
        }
    }
    fprintf(stderr, "%s","error: command not in suid whitelist!\n");
    return 1;
}
