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
Connected to 76.76.21.241:443 from 192.168.0.9:52076

HTTP/2 200 
date: Wed, 27 Jul 2022 02:40:27 GMT
content-type: text/plain; charset=utf-8
content-length: 14
cache-control: public, max-age=0, must-revalidate
etag: "f9418f76d1fa0dff51f045a150a6d80a"
access-control-allow-origin: *
content-disposition: inline; filename="robots.txt"
accept-ranges: bytes
age: 395
x-vercel-cache: HIT
server: Vercel
x-vercel-id: syd1:syd1::7w2xh-1658889627725-838a1a632a9a
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmp7f4otkqj

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[    17ms    |      18ms      |     66ms      |       57ms        |        0ms       ]
             |                |               |                   |                  |
    namelookup:17ms           |               |                   |                  |
                        connect:35ms          |                   |                  |
                                    pretransfer:101ms             |                  |
                                                      starttransfer:158ms            |
                                                                                 total:158ms  

httpstat "https://vercel-build-bonanza.vercel.app/node16"
Connected to 76.76.21.164:443 from 192.168.0.9:52077

HTTP/2 200 
content-type: text/plain
cache-control: public, max-age=0, must-revalidate
date: Wed, 27 Jul 2022 02:40:28 GMT
content-length: 104
x-vercel-cache: MISS
age: 0
server: Vercel
x-vercel-id: syd1::iad1::s69hr-1658889627960-9acaf7965ab7
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmp6ntwjygw

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     7ms    |      19ms      |     48ms      |       300ms       |        0ms       ]
             |                |               |                   |                  |
    namelookup:7ms            |               |                   |                  |
                        connect:26ms          |                   |                  |
                                    pretransfer:74ms              |                  |
                                                      starttransfer:374ms            |
                                                                                 total:374ms  

httpstat "https://vercel-build-bonanza.vercel.app/golang"
Connected to 76.76.21.241:443 from 192.168.0.9:52079

HTTP/2 200 
date: Wed, 27 Jul 2022 02:40:28 GMT
cache-control: public, max-age=0, must-revalidate
content-length: 23
x-vercel-cache: MISS
age: 0
server: Vercel
x-vercel-id: syd1::iad1::mk2n6-1658889628457-5f52fdbab573
strict-transport-security: max-age=63072000; includeSubDomains; preload

Body stored in: /var/folders/rb/255bj8l132gggvfkmkmlhhym0000gn/T/tmp52myn5o8

  DNS Lookup   TCP Connection   TLS Handshake   Server Processing   Content Transfer
[     9ms    |      20ms      |     48ms      |       302ms       |        1ms       ]
             |                |               |                   |                  |
    namelookup:9ms            |               |                   |                  |
                        connect:29ms          |                   |                  |
                                    pretransfer:77ms              |                  |
                                                      starttransfer:379ms            |
                                                                                 total:380ms  
~~~