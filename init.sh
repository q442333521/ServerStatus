if [ $USERNAME ]
then
	if [ ! $PASSWORD ]
	then
		PASSWORD="91yun"
	fi
	mv -f /ServerStatus/default.conf /etc/nginx/conf.d/default.conf
	printf "${USERNAME}:$(openssl passwd -crypt ${PASSWORD})\n" >> /root/htpasswd
	chmod 777 /root/htpasswd
fi

nohup /etc/init.d/nginx start && /ServerStatus/server/sergate --config=/ServerStatus/server/config.json --port=3561 --web-dir=/usr/share/nginx/html


/etc/init.d/nginx start 
nohup /ServerStatus/server/sergate --config=/ServerStatus/server/config.json --port=3561 --web-dir=/usr/share/nginx/html &
