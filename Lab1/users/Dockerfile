FROM ubuntu:18.04

ARG INTERN_NAME
ARG INTERN_PASSWD
ARG ROOT_PASSWD
ARG USER_NAME
ARG USER_PASSWD
ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'root:${ROOT_PASSWD}' | chpasswd
RUN useradd -m "${INTERN_NAME}"
RUN useradd -m "${USER_NAME}"
RUN echo "${INTERN_NAME}:${INTERN_PASSWD}" | chpasswd
RUN echo "${USER_NAME}:${USER_PASSWD}" | chpasswd
RUN apt-get update && apt-get install -y openssh-server mysql-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN ssh-keygen -A
RUN service mysql start 
COPY users_info /home/${USER_NAME}/clients

CMD ["/etc/init.d/ssh", "start", "-D"]
