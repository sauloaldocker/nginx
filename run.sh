docker stop nginx; docker rm nginx

FIL=""
if [[ -f "nginx.conf" ]]; then
	FIL="-v $PWD/nginx.conf:/etc/nginx.conf:ro"
fi

docker run --name nginx -v $PWD/data:/usr/local/nginx/html:ro $FIL -d -p 127.0.1.1:80:80 nginx
