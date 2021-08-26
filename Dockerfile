FROM centos
COPY ./entry-point /usr/local/bin
RUN yum install wget -y &$ yum install httpd -y
RUN yum insatll openssh-clients.x86_64 -y && yum install git -y 
RUN wget -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins -y && yum install java-11-openjdk.x86_64 -y
RUN yum install sudo -y && expect.x86_64
RUN echo  -e  "jenkins    ALL=(ALL)    NOPASSWD:ALL">> /etc/sudoers
COPY ./jenkins/etc/sysconfig/jenkins
COPY ./ci/usr/local/bin
COPY ./ss/usr/local/bin
COPY ./keygen/usr/local/bin
COPY ./jen/usr/local/bin
COPY ./functions/etc/init.d
EXPOSE 8080
CMD entry-point;
