docker stop nginx; docker rm nginx

SRC=$HOME/data/docker/nginx

FIL=""
if [[ -f "nginx.conf" ]]; then
	FIL="-v $SRC/nginx.conf:/etc/nginx.conf:ro"
fi

docker run --name nginx -v $SRC/data:/usr/local/nginx/html:ro $FIL -d -p 127.0.1.1:800:80 nginx
