/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

module Be.Kernel.fs_attr;

import Be.Support.SupportDefs;

import tango.stdc.posix.sys.types;
import tango.stdc.posix.dirent;

struct attr_info {
	uint32	type;
	off_t	size;
}

extern (C) extern {
	ssize_t	fs_read_attr(int fd, char *attribute, uint32 type, off_t pos, void *buffer, size_t readBytes);
	ssize_t	fs_write_attr(int fd, char *attribute, uint32 type, off_t pos, void *buffer, size_t readBytes);
	int		fs_remove_attr(int fd, char *attribute);
	int		fs_stat_attr(int fd, char *attribute, attr_info *attrInfo);

	int		fs_open_attr(char *path, char *attribute, uint32 type, int openMode);
	int		fs_fopen_attr(int fd, char *attribute, uint32 type, int openMode);
	int		fs_close_attr(int fd);

	DIR		*fs_open_attr_dir(char *path);
	DIR		*fs_fopen_attr_dir(int fd);
	int		fs_close_attr_dir(DIR *dir);
	dirent *fs_read_attr_dir(DIR *dir);
	void	fs_rewind_attr_dir(DIR *dir);
}
