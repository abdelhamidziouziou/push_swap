/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abziouzi <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/19 11:31:19 by abziouzi          #+#    #+#             */
/*   Updated: 2022/06/19 12:31:32 by abziouzi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/push_swap.h"

int	main(int argc, char *argv[])
{
	int	i;

	i = 4;
	if (argc <= 4 && argv[i])
		ps_error(ERR_ARGS);
	printf("Welcome to push_swap !!\n");
	return (0);
}
