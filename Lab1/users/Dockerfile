FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# Set root password for SSH access (change 'your_password' to your desired password)
RUN echo 'root:extremelyLongPasswordNotSupposedToBeDiscovered' | chpasswd
RUN useradd -m "intern"
RUN useradd -m "jsmith"
RUN echo 'intern:anPK02#!lv3rqxh' | chpasswd
RUN echo 'jsmith:flaquita' | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN ssh-keygen -A
CMD ["/etc/init.d/ssh", "start", "-D"]