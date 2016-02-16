nginx: nginx -g "daemon off;"
dockergen: docker-gen -watch -only-exposed -notify "nginx -s reload" /nginxconf/default.tmpl /etc/nginx/sites-available/default
