inception : db wp nginx

nginx : 
	docker-compose --file ./srcs/docker-compose.yml up --detach nginx
wp : 
	docker-compose --file ./srcs/docker-compose.yml up --detach wordpress
db : 
	docker-compose --file ./srcs/docker-compose.yml up --detach mariadb

ls : 
	docker image ls
	docker ps --all
	docker volume ls

stop :
	docker-compose --file ./srcs/docker-compose.yml stop
down : 
	docker-compose --file ./srcs/docker-compose.yml down
rm : 
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
prune : 
	docker system prune --all --force
clean : 
	down prune rm

all : 
	inception
re :
	fclean all

.PHONY : clean fclean all re