nginx: nginx -g "daemon off;"
dockergen: docker-gen -watch $DOCKERGEN_OPTIONS -notify "service nginx reload" /nginxconf/default.tmpl /etc/nginx/sites-available/default
