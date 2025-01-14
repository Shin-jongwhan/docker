#FROM shinejh0528/jhshin_base:1.1.1

RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y

# TODO

# ENV
# ENV must has default value
#ENV test test

# COPY entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
