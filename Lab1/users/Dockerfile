FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openssh-server mysql-server
RUN mkdir /var/run/sshd
# Set root password for SSH access (change 'your_password' to your desired password)
RUN echo 'root:extremelyLongPasswordNotSupposedToBeDiscovered' | chpasswd
RUN useradd -m "randretti"
RUN useradd -m "jsmith"
# RUN echo 'randretti:anPK02#!lv3rqxh' | chpasswd
RUN echo 'randretti:anPK02#!lv3rqxh' | chpasswd
RUN echo 'jsmith:flaquita' | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN ssh-keygen -A

RUN service mysql start 
COPY users_info /home/jsmith 

CMD ["/etc/init.d/ssh", "start", "-D"]
