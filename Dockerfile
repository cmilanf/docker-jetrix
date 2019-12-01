FROM mcr.microsoft.com/windows/nanoserver:1903
ARG JRE_DOWNLOAD="https://github.com/ojdkbuild/ojdkbuild/releases/download/java-1.8.0-openjdk-1.8.0.232-1.b09/java-1.8.0-openjdk-jre-1.8.0.232-1.b09.ojdkbuild.windows.x86_64.zip"
ARG JETRIX_DOWNLOAD="https://downloads.sourceforge.net/project/jetrix/Jetrix%20TetriNET%20Server/0.2.3/jetrix-0.2.3.zip"
ARG HTTPD_DOWNLOAD="https://github.com/ethanpil/sheret/releases/download/1.0/sheret.zip"

LABEL title="Jetrix Tetrinet Server Docker Image" \
    maintainer="Carlos Milán Figueredo" \
    version="1.1" \
    contrib1="Jetrix - http://jetrix.sourceforge.net/" \
    contrib2="sheret web server - https://github.com/ethanpil/sheret" \
    url="https://calnus.com" \
    twitter="@cmilanf" \
    usage="docker run -d -p 31457:31457 -p 8080:8080 -p 80:80 -h myhostname.domain.com --name jetrix cmilanf/jetrix" \
    thanksto="Beatriz Sebastián Peña" \
    defaultadmin="Username: admin - Password: adminpass. Please, look into server.xml"

ENV JAVA_ZIP_VERSION 1.8.0-openjdk-jre-1.8.0.232-1.b09
ENV JAVA_HOME C:\\java-${JAVA_ZIP_VERSION}.ojdkbuild.windows.x86_64

RUN curl -L -o openjdk-jre.zip %JRE_DOWNLOAD% \
    && tar xfv openjdk-jre.zip \
    && del openjdk-jre.zip \
    && md sheret && cd sheret && md htdocs \
    && curl -L -o sheret.zip %HTTPD_DOWNLOAD% \
    && tar xfv sheret.zip \
    && del sheret.zip

COPY tetriweb.zip /
    
RUN cd c:\\ && curl -L -o jetrix.zip %JETRIX_DOWNLOAD% \
    && tar xfv jetrix.zip \
    && del jetrix.zip \
    && tar xfv tetriweb.zip -C C:\\sheret\\htdocs

COPY docker-entrypoint.bat /

EXPOSE 31457 8080 80

CMD [ "c:\\docker-entrypoint.bat" ]
