NAME=libftprintf.a
CC=gcc
CFLAGS=-Wall -Wextra -Werror
LIBDIR=./libft/
LIB=$(LIBDIR)libft.a
SRCDIR=./srcs/
HDIR=./header/
SRCS=	$(SRCDIR)get_flag.c\
		$(SRCDIR)get_conf.c\
		$(SRCDIR)get_width.c\
		$(SRCDIR)get_precision.c\
		$(SRCDIR)get_specifier.c\
		$(SRCDIR)get_value.c\
		$(SRCDIR)get_len.c\
		$(SRCDIR)ft_printf.c\
		$(SRCDIR)print_nb.c\
		$(SRCDIR)print_conv.c\
		$(SRCDIR)ft_putnbr_base.c\
		$(SRCDIR)print_addr.c\
		$(SRCDIR)print_value.c

OBJ=$(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ) $(LIB)
	ar -rs $(LIB) $^
	mv $(LIB) $(NAME)

.c.o:
	$(CC) $(CFLAGS) -I $(HDIR) -I $(LIBDIR) -c $< -o $@

$(LIB):
	make -C $(LIBDIR)

bonus: all

clean:
	rm -f $(OBJ)
	make clean -C $(LIBDIR)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBDIR)

re: fclean all

.PHONY: all clean fclean re
