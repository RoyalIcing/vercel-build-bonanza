production:
	npx vercel deploy --prebuilt --prod

build_golang:
	.vercel/output/functions/golang.func && cd GOARCH=amd64 GOOS=linux go build main
