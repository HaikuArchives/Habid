/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Storage.StorageDefs;

import tango.sys.consts.fcntl;

const int B_DEV_NAME_LENGTH = 128;
const int B_FILE_NAME_LENGTH = 256; // NAME_MAX
const int B_PATH_NAME_LENGTH = 1024; // MAXPATHLEN
const int B_ATTR_NAME_LENGTH = (B_FILE_NAME_LENGTH-1);
const int B_MIME_TYPE_LENGTH = (B_ATTR_NAME_LENGTH - 15);

const int B_READ_ONLY = O_RDONLY;
const int B_WRITE_ONLY = O_WRONLY;
const int B_READ_WRITE = O_RDWR;

const int B_FAIL_IF_EXISTS = O_EXCL;
const int B_CREATE_FILE = O_CREAT;
const int B_ERASE_FILE = O_TRUNC;
const int B_OPEN_AT_END = O_APPEND;

enum node_flavor
{
	B_FILE_NODE = 0x01,
	B_SYMLINK_NODE = 0x02,
	B_DIRECTORY_NODE = 0x04,
	B_ANY_MODE = 0x07
}
