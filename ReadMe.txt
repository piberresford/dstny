Notes
-----

This has been developed and tested using perl v5.34.0 on Ubuntu 22.04.3
No additional perl modules, to the default Ubuntu installation, were installed to support this project.

It has not been tested using any other perl installation.

run
perl -w server-async.pl

By default the server listens on port 5000

TODO:
-----
Introduce unit tests for the Prices module.
Refactor session() into a module with unit tests.
Check and improve performance of query operation

Make server_port configurable from the command line.
Look into current perl best practice coding standards and refactor.


Completion
----------
This code passes the test provided by protohackers
[Mon Feb  5 12:06:46 2024 UTC] [0example.test] NOTE:check starts
[Mon Feb  5 12:06:46 2024 UTC] [0example.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:46 2024 UTC] [0example.test] NOTE:sending example data
[Mon Feb  5 12:06:47 2024 UTC] [0example.test] PASS
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:check starts
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:4 simultaneous clients
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:48 2024 UTC] [1main.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:49 2024 UTC] [1main.test] PASS
[Mon Feb  5 12:06:50 2024 UTC] [2largedata.test] NOTE:check starts
[Mon Feb  5 12:06:50 2024 UTC] [2largedata.test] NOTE:inserting 200k prices in random order
[Mon Feb  5 12:06:50 2024 UTC] [2largedata.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:58 2024 UTC] [2largedata.test] PASS
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:check starts
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:checking whether bad clients can disrupt good clients
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:sending an incomplete message
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:sending an illegal message type
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] NOTE:disconnecting immediately after sending a query
[Mon Feb  5 12:06:59 2024 UTC] [3badclient.test] PASS
[Mon Feb  5 12:07:01 2024 UTC] [4intoverflow.test] NOTE:check starts
[Mon Feb  5 12:07:01 2024 UTC] [4intoverflow.test] NOTE:testing for integer overflow
[Mon Feb  5 12:07:01 2024 UTC] [4intoverflow.test] NOTE:connected to 109.153.253.80 port 5000
[Mon Feb  5 12:07:01 2024 UTC] [4intoverflow.test] PASS




