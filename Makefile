# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abziouzi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/19 11:35:27 by abziouzi          #+#    #+#              #
#    Updated: 2022/06/19 12:26:59 by abziouzi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COLORS #

# This is a minimal set of ANSI/VT100 color codes
_END		=	\e[0m
_BOLD		=	\e[1m
_UNDER		=	\e[4m
_REV		=	\e[7m

# Colors
_GREY		=	\e[30m
_RED		=	\e[31m
_GREEN		=	\e[32m
_YELLOW		=	\e[33m
_BLUE		=	\e[34m
_PURPLE		=	\e[35m
_CYAN		=	\e[36m
_WHITE		=	\e[37m

# Inverted, i.e. colored backgrounds
_IGREY		=	\e[40m
_IRED		=	\e[41m
_IGREEN		=	\e[42m
_IYELLOW	=	\e[43m
_IBLUE		=	\e[44m
_IPURPLE	=	\e[45m
_ICYAN		=	\e[46m
_IWHITE		=	\e[47m

# **************************************************************************** #

# NORMINETTE #

NORMINETTE	:=	$(shell which norminette)

ifeq (, $(shell which norminette))
	NORMINETTE := ${HOME}/.norminette/norminette.rb
endif

# **************************************************************************** #

# Compilation

NAME			=	push_swap

CC				=	cc

FLAGS			=	-Wall -Wextra -Werror

RM				=	rm -rf

# Files & Directories

DIR_HEADERS		=	./inc/

DIR_OBJ			=	./obj/

DIR_SRC			=	./src/

SRCS			=	push_swap.c			\
					push_swap_utils.c

SRC				=	$(SRCS)

OBJ				=	$(SRC:%.c=$(DIR_OBJ)%.o)

# Rules

all				:	$(NAME)

$(NAME)			:	$(OBJ)
					@printf "\033[2K\r$(_GREEN) All files compiled into '$(DIR_OBJ)'. $(_END)✅\n"
					@$(CC) $(FLAGS) -I $(DIR_HEADERS) $(OBJ) -o $(NAME)
					@printf "\033[2K\r$(_GREEN) Executable '$(NAME)' created. $(_END)✅\n"

$(OBJ)			:	| $(DIR_OBJ)

$(DIR_OBJ)%.o	:	$(DIR_SRC)%.c
					@printf "\033[2K\r $(_YELLOW)Compiling $< $(_END)⌛ "
					@$(CC) $(FLAGS) -I $(DIR_HEADERS) -c $< -o $@

$(DIR_OBJ)		:
					@mkdir $(DIR_OBJ)

clean			:
					@$(RM) $(DIR_OBJ)
					@printf "\033[2K\r$(_RED) '"$(DIR_OBJ)"' has been deleted. $(_END)🗑️\n"

fclean			:	clean
					@$(RM) $(NAME)
					@printf "\033[2K\r$(_RED) '"$(NAME)"' has been deleted. $(_END)🗑️\n"

re				:	fclean all

# Norme

norm:
				@$(NORMINETTE) $(DIR_SRC)
				@$(NORMINETTE) $(DIR_HEADERS)

.PHONY:			all clean fclean re norm
