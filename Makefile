##
## EPITECH PROJECT, 2020
## imageCompressor
## File description:
## makefile
##

NAME	=	imageCompressor

all:		$(NAME) message

$(NAME):
		stack install --local-bin-path .
		mv myProject-exe imageCompressor

clean:
		rm -f $(NAME)

fclean:		clean

re:		fclean all

message:
		@echo "Successfully compiled!"
