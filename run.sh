docker stop nginx; docker rm nginx

SRC=$HOME/data/docker/nginx

FIL=""
if [[ -f "$SRC/nginx.conf" ]]; then
	FIL="-v $SRC/nginx.conf:/etc/nginx.conf:ro"
	FIL="-v $SRC/sites-enabled:/etc/nginx/sites-enabled:ro $FIL"
	FIL="-v $SRC/data:/usr/local/nginx/html:ro $FIL"
fi

LNK=""
#LNK="$LNK --link dockerui:dockerui"
#LNK="$LNK --link dockerui:dockerui"

#docker run -d --name nginx --net host $LNK -p 127.0.1.1:80:80 nginx
docker run -d --name nginx --net host $LNK $FIL nginx
