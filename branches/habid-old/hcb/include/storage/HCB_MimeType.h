#ifndef __MIMETYPE_H__
#define __MIMETYPE_H__

#include <storage/MimeType.h>

/* begin class BMimeTypeBridge */

class BMimeTypeBridge : public BMimeType
{
public:
	BMimeTypeBridge();
	BMimeTypeBridge(const char *mimeType);
	virtual ~BMimeTypeBridge();
};

/* end class BMimeTypeBridge */

#endif
