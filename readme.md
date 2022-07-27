# Vercel Build API Bonanza

See what we can do if we just use the [Vercel Build API](https://vercel.com/docs/build-output-api/v3) directly.

- static file: `.vercel/output/static/robots.txt`
- Node.js Lambda: `.vercel/output/functions/node16.func`
- Golang Lambda: `.vercel/output/functions/golang.func`

## Deployment

Run `make production`. It uses `vercel deploy --prebuilt` to deploy the existing files without having to run a build on Vercel.

## Speed

Run `make httpstat` to see the various speeds. In Australia I see:

~~~
httpstat "https://vercel-build-bonanza.vercel.app/robots.txt"
Connected to 76.76.21.164:443 from 192.168.0.9:52337

HTTP/2 200 
date: Wed, 27 Jul 2022 02:45:28 GMT
content-type: text/plain; charset=utf-8
content-length: 14
cache-control: public, max-age=0, must-revalidate
etag: "f9418f76d1fa0dff51f045a150a6d80a"
access-control-allow-origin: *
content-disposition: inline; filename="robots.txt"
accept-ranges: bytes
age: 0
x-vercel-cache: MISS
server: Vercel
x-vercel-id: syd1:syd1::dc7fd-1658889928380-6b7426ccbbcf
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmp3mj1wz1y

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     9ms    |      21ms      |     48ms      |       257ms       |        1ms       ]
             |                |               |                   |                  |
    namelookup:9ms            |               |                   |                  |
                        connect:30ms          |                   |                  |
                                    pretransfer:78ms              |                  |
                                                      starttransfer:335ms            |
                                                                                 total:336ms  

httpstat "https://vercel-build-bonanza.vercel.app/node16"
Connected to 76.76.21.164:443 from 192.168.0.9:52340

HTTP/2 200 
content-type: text/plain
cache-control: public, max-age=0, must-revalidate
date: Wed, 27 Jul 2022 02:45:29 GMT
content-length: 104
x-vercel-cache: MISS
age: 0
server: Vercel
x-vercel-id: syd1::iad1::vt2lb-1658889928855-e490dc0372b5
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmp91bd7ve1

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     9ms    |      19ms      |     45ms      |       964ms       |        1ms       ]
             |                |               |                   |                  |
    namelookup:9ms            |               |                   |                  |
                        connect:28ms          |                   |                  |
                                    pretransfer:73ms              |                  |
                                                      starttransfer:1037ms           |
                                                                                 total:1038ms 

httpstat "https://vercel-build-bonanza.vercel.app/golang"
Connected to 76.76.21.164:443 from 192.168.0.9:52341

HTTP/2 200 
date: Wed, 27 Jul 2022 02:45:31 GMT
cache-control: public, max-age=0, must-revalidate
content-length: 23
x-vercel-cache: MISS
age: 0
server: Vercel
x-vercel-id: syd1::iad1::vt2lb-1658889930044-4656d86c67aa
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmprudnhw1d

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     8ms    |      18ms      |     45ms      |      1516ms       |        4ms       ]
             |                |               |                   |                  |
    namelookup:8ms            |               |                   |                  |
                        connect:26ms          |                   |                  |
                                    pretransfer:71ms              |                  |
                                                      starttransfer:1587ms           |
                                                                                 total:1591ms 

httpstat "https://vercel-build-bonanza.vercel.app/jsedge"
Connected to 76.76.21.164:443 from 192.168.0.9:52345

HTTP/2 200 
date: Wed, 27 Jul 2022 02:45:31 GMT
content-type: text/plain;charset=UTF-8
content-length: 21
server: Vercel
x-vercel-id: syd1::mtm8d-1658889931769-6690dee7b72f
strict-transport-security: max-age=63072000; includeSubDomains; preload
cache-control: public, max-age=0, must-revalidate
x-vercel-cache: MISS

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmpxvc8yzlu

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     6ms    |      19ms      |     47ms      |       67ms        |        0ms       ]
             |                |               |                   |                  |
    namelookup:6ms            |               |                   |                  |
                        connect:25ms          |                   |                  |
                                    pretransfer:72ms              |                  |
                                                      starttransfer:139ms            |
                                                                                 total:139ms  
~~~