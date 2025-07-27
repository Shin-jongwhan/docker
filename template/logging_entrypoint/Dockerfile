FROM shinejh0528/jhshin_base:1.1.1

WORKDIR /app

RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y curl net-tools git
# check network tools
RUN apt install -y iputils-ping netcat-openbsd dnsutils

#

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# ENV
ENV test test
ENV logfile_dir "."

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

