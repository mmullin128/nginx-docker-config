FROM nginx

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

COPY index.html /usr/share/nginx/html

ENTRYPOINT [ "./entrypoint.sh" ]
