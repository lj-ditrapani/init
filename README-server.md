LJD Ubuntu Server Init Script
===============================================================================

Install ubuntu 16.04 server.
Hostname: life
Select Standard system utilities & OpenSSH server
Log-in and run:

    wget -O - https://goo.gl/k7s8N2 | bash

<https://goo.gl/k7s8N2> redirects to
<https://raw.githubusercontent.com/lj-ditrapani/init/master/init-server.sh>


Notes
-----

- Installing sbt seemed to fail on first try when installed from install-sever.sh.
  The steps that failed, I believe were:
  ```
  Setting up sbt (0.13.15.3) ...
  Getting org.scala-sbt sbt 0.13.15
  ```
