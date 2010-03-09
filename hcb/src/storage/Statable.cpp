#include <storage/Statable.h>

#include <bec-types.h>

#warning "wtf to do with this?!?!?!? src/storage/Statable.cpp"

class BStatableBridge : public BStatable
{
public:
	BStatableBridge() : BStatable() {}

	~BStatableBridge() {}


	status_t GetStat(struct stat *st) const {
//		return BStatable::GetStat(st);
	}

	status_t set_stat(struct stat &st, uint32 what) {
//		return BStatable::set_stat(st, what);
	}
	status_t _GetStat(struct stat_beos *st) const {
//		return BStatable::_GetStat(st);
	}
};


extern "C" {
	be_BStatable * be_BStatable_ctor() {
		return (be_BStatable *)new BStatableBridge;
	}

	void be_BStatable_dtor(be_BStatable *obj) {
		delete obj;
	}
} 
