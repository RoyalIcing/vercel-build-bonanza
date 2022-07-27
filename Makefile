production:
	npx vercel deploy --prebuilt --prod

build_golang:
	.vercel/output/functions/golang.func && cd GOARCH=amd64 GOOS=linux go build main

httpstat:
	httpstat "https://vercel-build-bonanza.vercel.app/robots.txt"
	httpstat "https://vercel-build-bonanza.vercel.app/node16"
	httpstat "https://vercel-build-bonanza.vercel.app/golang"
	httpstat "https://vercel-build-bonanza.vercel.app/jsedge"
