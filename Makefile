
all:
	@sudo mkdir -p /home/snidbell/data/db /home/snidbell/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start	

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)

.PHONY: all restart stop start clean
