ARG platform
ARG tag
FROM $platform:$tag

# repeat ARG platform, otherwise removed by FROM!
ARG platform
COPY ./$platform/prepare-system.sh /usr/bin/prepare-system.sh
COPY ./install-rvm-ruby.sh /usr/bin/install-rvm-ruby.sh

CMD ["install-rvm-ruby.sh"]