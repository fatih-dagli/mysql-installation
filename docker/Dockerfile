FROM ubuntu:22.04.2

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    openssh-client \
    ansible \
    python3 \
    python3-pip

# Copy Ansible playbook and host file
COPY ../ansible/mysql-installation.yml /root/
COPY ../ansible/mysql-uninstallation.yml /root/
COPY ../ansible/hosts /etc/ansible/
COPY ../filebeat/filebeat.yml.j2 /opt/
COPY ./send_ssh_keys.sh /root/

# Set up SSH known hosts to avoid prompts during Ansible runs
RUN ssh-keyscan 10.0.1.10 10.0.2.20 >> /etc/ssh/ssh_known_hosts

# Run send_ssh_keys.sh script
RUN chmod +x /root/send_ssh_keys.sh
RUN /root/send_ssh_keys.sh

# Run Ansible playbook
CMD ["bash"]