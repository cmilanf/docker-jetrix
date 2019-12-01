# Docker image for Jetrix using Windows Nano Server
This repo is a proof of concept Docker image of Windows Nano Server for running Jetrix Tetrinet Server, written in Java, using OpenJDK JRE. Image can be easlity build on Docker for Windows by using:

```
docker build -t myrepo/jetrix .
```

Follow ports are served:
  * **80/tcp**. HTTP, gameplay information and client download.
  * **8080/tcp**. HTTP, server web console for administration. Default user: admin, default password: adminpass
  * **31457/tcp**. TetriNET server port.

Execution is as follows:

```
docker run --docker run -it --rm -p 80:80 -p 8080:8080 -p 31457:31457 myrepo/jetrix
```