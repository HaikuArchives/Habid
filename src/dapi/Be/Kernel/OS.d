/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Be.Kernel.OS;

import Be.Support.SupportDefs;
import Be.Storage.StorageDefs;

import tango.stdc.posix.sys.types;


/* System constants */

const int B_OS_NAME_LENGTH	= 32;
const int B_PAGE_SIZE		= 4096;
const long B_INFINITE_TIMEOUT = 9223372036854775807L;

enum {
	B_TIMEOUT						= 0x8,	/* relative timeout */
	B_RELATIVE_TIMEOUT				= 0x8,	/* fails after a relative timeout
												with B_TIMED_OUT */
	B_ABSOLUTE_TIMEOUT				= 0x10,	/* fails after an absolute timeout
												with B_TIMED_OUT */

	/* experimental Haiku only API */
	B_TIMEOUT_REAL_TIME_BASE		= 0x40,
	B_ABSOLUTE_REAL_TIME_TIMEOUT	= B_ABSOLUTE_TIMEOUT
										| B_TIMEOUT_REAL_TIME_BASE
};


/* Types */

alias int32 area_id;
alias int32 port_id;
alias int32 sem_id;
alias int32 team_id;
alias int32 thread_id;


/* Areas */

struct area_info {
	area_id		area;
	char		name[B_OS_NAME_LENGTH];
	size_t		size;
	uint32		lock;
	uint32		protection;
	team_id		team;
	uint32		ram_size;
	uint32		copy_count;
	uint32		in_count;
	uint32		out_count;
	void		*address;
}

/* area locking */
const int B_NO_LOCK				=	0;
const int B_LAZY_LOCK			=	1;
const int B_FULL_LOCK			=	2;
const int B_CONTIGUOUS			=	3;
const int	B_LOMEM				=	4;

/* address spec for create_area(), and clone_area() */
const int B_ANY_ADDRESS			=	0;
const int B_EXACT_ADDRESS		=	1;
const int B_BASE_ADDRESS		=	2;
const int B_CLONE_ADDRESS		=	3;
const int	B_ANY_KERNEL_ADDRESS=	4;

/* area protection */
const int B_READ_AREA			=	1;
const int B_WRITE_AREA			=	2;

extern (C) extern {
	area_id		create_area(char *name, void **startAddress,
						uint32 addressSpec, size_t size, uint32 lock,
						uint32 protection);
	area_id		clone_area(char *name, void **destAddress,
						uint32 addressSpec, uint32 protection, area_id source);
	area_id		find_area(char *name);
	area_id		area_for(void *address);
	status_t	delete_area(area_id id);
	status_t	resize_area(area_id id, size_t newSize);
	status_t	set_area_protection(area_id id, uint32 newProtection);

/* system private, use macros instead */
status_t		_get_area_info(area_id id, area_info *areaInfo, size_t size);
status_t		_get_next_area_info(team_id team, int32 *cookie,
						area_info *areaInfo, size_t size);
}

/* D Helper functions for area_info */
status_t get_area_info(area_id id, inout area_info info) {
	return _get_area_info(id, &info, info.sizeof);
}

status_t get_next_area_info(team_id team, inout int32 cookie, inout area_info info) {
	return _get_next_area_info(team, &cookie, &info, info.sizeof);
}

/* Ports */

struct port_info {
	port_id		port;
	team_id		team;
	char		name[B_OS_NAME_LENGTH];
	int32		capacity;		/* queue depth */
	int32		queue_count;	/* # msgs waiting to be read */
	int32		total_count;	/* total # msgs read so far */
};

extern (C) extern {
	port_id		create_port(int32 capacity, char *name);
	port_id		find_port(char *name);
	ssize_t		read_port(port_id port, int32 *code, void *buffer,
						size_t bufferSize);
	ssize_t		read_port_etc(port_id port, int32 *code, void *buffer,
						size_t bufferSize, uint32 flags, bigtime_t timeout);
	status_t	write_port(port_id port, int32 code, void *buffer,
						size_t bufferSize);
	status_t	write_port_etc(port_id port, int32 code, void *buffer,
						size_t bufferSize, uint32 flags, bigtime_t timeout);
	status_t	close_port(port_id port);
	status_t	delete_port(port_id port);

	ssize_t		port_buffer_size(port_id port);
	ssize_t		port_buffer_size_etc(port_id port, uint32 flags,
						bigtime_t timeout);
	ssize_t		port_count(port_id port);
	status_t	set_port_owner(port_id port, team_id team);

/* system private, use the macros instead */
	status_t	_get_port_info(port_id port, port_info *portInfo,
						size_t portInfoSize);
	status_t	_get_next_port_info(team_id team, int32 *cookie,
						port_info *portInfo, size_t portInfoSize);
}

/* D Helper functions for port_info */
status_t get_port_info(port_id port, inout port_info info) {
	return _get_port_info(port, &info, info.sizeof);
}

status_t get_next_port_info(team_id id, inout int32 cookie, inout port_info info) {
	return _get_next_port_info(id, &cookie, &info, info.sizeof);
}


/* WARNING: The following is Haiku experimental API. It might be removed or
   changed in the future. */

struct port_message_info {
	size_t		size;
	uid_t		sender;
	gid_t		sender_group;
	team_id		sender_team;
}

/* similar to port_buffer_size_etc(), but returns (more) info */

extern (C) extern {
	status_t		_get_port_message_info_etc(port_id port,
						port_message_info *info, size_t infoSize, uint32 flags,
						bigtime_t timeout);
}

/* D Helper functions for port_message_info */
status_t get_port_message_info_etc(port_id port, inout port_message_info info, uint32 flags, bigtime_t timeout) {
	return _get_port_message_info_etc(port, &info, info.sizeof, flags, timeout);
}

/* Semaphores */

struct sem_info {
	sem_id		sem;
	team_id		team;
	char		name[B_OS_NAME_LENGTH];
	int32		count;
	thread_id	latest_holder;
}

/* semaphore flags */
enum {
	B_CAN_INTERRUPT				= 0x01,	/* acquisition of the semaphore can be
										   interrupted (system use only) */
	B_CHECK_PERMISSION			= 0x04,	/* ownership will be checked (system use
										   only) */
	B_KILL_CAN_INTERRUPT		= 0x20,	/* acquisition of the semaphore can be
										   interrupted by SIGKILL[THR], even
										   if not B_CAN_INTERRUPT (system use
										   only) */

	/* release_sem_etc() only flags */
	B_DO_NOT_RESCHEDULE			= 0x02,	/* thread is not rescheduled */
	B_RELEASE_ALL				= 0x08,	/* all waiting threads will be woken up,
										   count will be zeroed */
	B_RELEASE_IF_WAITING_ONLY	= 0x10	/* release count only if there are any
										   threads waiting */
};

extern (C) extern {
	sem_id		create_sem(int32 count, char *name);
	status_t	delete_sem(sem_id id);
	status_t	acquire_sem(sem_id id);
	status_t	acquire_sem_etc(sem_id id, int32 count, uint32 flags,
						bigtime_t timeout);
	status_t	release_sem(sem_id id);
	status_t	release_sem_etc(sem_id id, int32 count, uint32 flags);
/* TODO: the following two calls are not part of the BeOS API, and might be
   changed or even removed for the final release of Haiku R1 */
	status_t	switch_sem(sem_id semToBeReleased, sem_id id);
	status_t	switch_sem_etc(sem_id semToBeReleased, sem_id id,
						int32 count, uint32 flags, bigtime_t timeout);
	status_t	get_sem_count(sem_id id, int32 *threadCount);
	status_t	set_sem_owner(sem_id id, team_id team);

/* system private, use the macros instead */
	status_t	_get_sem_info(sem_id id, sem_info *info,
						size_t infoSize);
	status_t	_get_next_sem_info(team_id team, int32 *cookie,
						sem_info *info, size_t infoSize);
}

/* D Helper functions for sem_info */
status_t get_sem_info(sem_id id, inout sem_info info) {
	return _get_sem_info(id, &info, info.sizeof);
}

status_t get_next_sem_info(team_id team, inout int32 cookie, inout sem_info info) {
	return _get_next_sem_info(team, &cookie, &info, info.sizeof);
}

/* Teams */

struct team_info{
	team_id			team;
	int32			thread_count;
	int32			image_count;
	int32			area_count;
	thread_id		debugger_nub_thread;
	port_id			debugger_nub_port;
	int32			argc;
	char			args[64];
	uid_t			uid;
	gid_t			gid;
}

const int B_CURRENT_TEAM	=	0;
const int B_SYSTEM_TEAM		=	1;


extern (C) extern {
	status_t	kill_team(team_id team);
	/* see also: send_signal() */

/* system private, use macros instead */
	status_t	_get_team_info(team_id id, team_info *info, size_t size);
	status_t	_get_next_team_info(int32 *cookie, team_info *info, size_t size);

}
/* D Helper functions for team_info */
status_t get_team_info(team_id id, inout team_info info) {
	return _get_team_info(id, &info, info.sizeof);
}

status_t get_next_team_info(inout int32 cookie, inout team_info info) {
	return _get_next_team_info(&cookie, &info, info.sizeof);
}


/* team usage info */

struct team_usage_info {
	bigtime_t		user_time;
	bigtime_t		kernel_time;
}

enum {
	/* compatible to sys/resource.h RUSAGE_SELF and RUSAGE_CHILDREN */
	B_TEAM_USAGE_SELF		= 0,
	B_TEAM_USAGE_CHILDREN	= -1
};

/* system private, use macros instead */
extern (C) extern {
	status_t	_get_team_usage_info(team_id team, int32 who, team_usage_info *info, size_t size);
}
/*
#define get_team_usage_info(team, who, info) \
	_get_team_usage_info((team), (who), (info), sizeof(*(info)))
*/

/* Threads */

enum thread_state {
	B_THREAD_RUNNING	= 1,
	B_THREAD_READY,
	B_THREAD_RECEIVING,
	B_THREAD_ASLEEP,
	B_THREAD_SUSPENDED,
	B_THREAD_WAITING
}

struct thread_info {
	thread_id		thread;
	team_id			team;
	char			name[B_OS_NAME_LENGTH];
	thread_state	state;
	int32			priority;
	sem_id			sem;
	bigtime_t		user_time;
	bigtime_t		kernel_time;
	void			*stack_base;
	void			*stack_end;
}

const int B_IDLE_PRIORITY				=	0;
const int B_LOWEST_ACTIVE_PRIORITY		=	1;
const int B_LOW_PRIORITY				=	5;
const int B_NORMAL_PRIORITY				=	10;
const int B_DISPLAY_PRIORITY			=	15;
const int B_URGENT_DISPLAY_PRIORITY		=	20;
const int B_REAL_TIME_DISPLAY_PRIORITY	=	100;
const int B_URGENT_PRIORITY				=	110;
const int B_REAL_TIME_PRIORITY			=	120;

const int B_SYSTEM_TIMEBASE				=	0;

const int B_FIRST_REAL_TIME_PRIORITY	=	B_REAL_TIME_DISPLAY_PRIORITY;

typedef status_t function(void *) thread_func;
	/* thread_entry is for backward compatibility only! Use thread_func */

extern (C) extern {
	thread_id		spawn_thread(thread_func, char *name, int32 priority, void *data);
	status_t		kill_thread(thread_id thread);
	status_t		resume_thread(thread_id thread);
	status_t		suspend_thread(thread_id thread);

	status_t		rename_thread(thread_id thread, char *newName);
	status_t		set_thread_priority(thread_id thread, int32 newPriority);
	void			exit_thread(status_t status);
	status_t		wait_for_thread(thread_id thread, status_t *returnValue);
	status_t		on_exit_thread(void (*callback)(void *), void *data);

	thread_id 		find_thread(char *name);

	status_t		send_data(thread_id thread, int32 code, void *buffer,
						size_t bufferSize);
	int32			receive_data(thread_id *sender, void *buffer,
						size_t bufferSize);
	bool			has_data(thread_id thread);

	status_t		snooze(bigtime_t amount);
	status_t		snooze_etc(bigtime_t amount, int timeBase, uint32 flags);
	status_t		snooze_until(bigtime_t time, int timeBase);

/* system private, use macros instead */
	status_t		_get_thread_info(thread_id id, thread_info *info, size_t size);
	status_t		_get_next_thread_info(team_id team, int32 *cookie,
						thread_info *info, size_t size);

/* bridge to the pthread API */
	thread_id		get_pthread_thread_id(pthread_t thread);
/* TODO: Would be nice to have, but we use TLS to associate a thread with its
   pthread object. So this is not trivial to implement.
extern status_t		convert_to_pthread(thread_id thread, pthread_t *_thread);
*/


/* Time */

	uint32			real_time_clock();
	void			set_real_time_clock(uint32 secsSinceJan1st1970);
	bigtime_t		real_time_clock_usecs();
	status_t		set_timezone(char *timezone);
	bigtime_t		system_time();
						/* time since booting in microseconds */
	nanotime_t		system_time_nsecs();
						/* time since booting in nanoseconds */
}

/* D Helper functions for thread_info */
status_t get_thread_info(thread_id id, inout thread_info info) {
	return _get_thread_info(id, &info, info.sizeof);
}

status_t get_next_thread_info(team_id team, inout int32 cookie, inout thread_info info) {
	return _get_next_thread_info(team, &cookie, &info, info.sizeof);
}

/* Alarm */

enum {
	B_ONE_SHOT_ABSOLUTE_ALARM	= 1,
	B_ONE_SHOT_RELATIVE_ALARM,
	B_PERIODIC_ALARM			/* "when" specifies the period */
};

extern (C) extern {
extern bigtime_t	set_alarm(bigtime_t when, uint32 flags);


/* Debugger */

	void		debugger(char *message);

/*
   calling this function with a non-zero value will cause your thread
   to receive signals for any exceptional conditions that occur (i.e.
   you'll get SIGSEGV for data access exceptions, SIGFPE for floating
   point errors, SIGILL for illegal instructions, etc).

   to re-enable the default debugger pass a zero.
*/
	int			disable_debugger(int state);

/* TODO: Remove. Temporary debug helper. */
/*
	void		debug_printf(char *format, ...)
						__attribute__ ((format (__printf__, 1, 2)));
	void		debug_vprintf(char *format, va_list args);
	void		ktrace_printf(char *format, ...)
						__attribute__ ((format (__printf__, 1, 2)));
	void		ktrace_vprintf(char *format, va_list args);
*/
}

version(__INTEL__) {
	const int B_MAX_CPU_COUNT = 8;
}
else {
	const int B_MAX_CPU_COUNT = 1;
}
/* System information */
/*
#if __INTEL__
#	define B_MAX_CPU_COUNT	8
#elif __POWERPC__
#	define B_MAX_CPU_COUNT	8
#elif __M68K__
#	define B_MAX_CPU_COUNT	1
#elif __ARM__
#	define B_MAX_CPU_COUNT	1
#elif __MIPSEL__
#	define B_MAX_CPU_COUNT	1
#else
#	warning Unknown cpu
#	define B_MAX_CPU_COUNT	1
#endif
*/
enum cpu_types {
	/* TODO: add latest models */

	/* Motorola/IBM */
	B_CPU_PPC_UNKNOWN					= 0,
	B_CPU_PPC_601						= 1,
	B_CPU_PPC_602						= 7,
	B_CPU_PPC_603						= 2,
	B_CPU_PPC_603e						= 3,
	B_CPU_PPC_603ev						= 8,
	B_CPU_PPC_604						= 4,
	B_CPU_PPC_604e						= 5,
	B_CPU_PPC_604ev						= 9,
	B_CPU_PPC_620						= 10,
	B_CPU_PPC_750   					= 6,
	B_CPU_PPC_686						= 13,
	B_CPU_PPC_860						= 25,
	B_CPU_PPC_7400						= 26,
	B_CPU_PPC_7410						= 27,
	B_CPU_PPC_7447A						= 28,
	B_CPU_PPC_7448						= 29,
	B_CPU_PPC_7450						= 30,
	B_CPU_PPC_7455						= 31,
	B_CPU_PPC_7457						= 32,
	B_CPU_PPC_8240						= 33,
	B_CPU_PPC_8245						= 34,

	B_CPU_PPC_IBM_401A1					= 35,
	B_CPU_PPC_IBM_401B2					= 36,
	B_CPU_PPC_IBM_401C2					= 37,
	B_CPU_PPC_IBM_401D2					= 38,
	B_CPU_PPC_IBM_401E2					= 39,
	B_CPU_PPC_IBM_401F2					= 40,
	B_CPU_PPC_IBM_401G2					= 41,
	B_CPU_PPC_IBM_403					= 42,
	B_CPU_PPC_IBM_405GP					= 43,
	B_CPU_PPC_IBM_405L					= 44,
	B_CPU_PPC_IBM_750FX					= 45,
	B_CPU_PPC_IBM_POWER3				= 46,

	/* Intel */

	/* Updated according to Intel(R) Processor Identification and
	 * the  CPUID instruction (Table 4)
	 * AP-485 Intel - 24161832.pdf
	 */
	B_CPU_INTEL_x86						= 0x1000,
	B_CPU_INTEL_PENTIUM					= 0x1051,
	B_CPU_INTEL_PENTIUM75,
	B_CPU_INTEL_PENTIUM_486_OVERDRIVE,
	B_CPU_INTEL_PENTIUM_MMX,
	B_CPU_INTEL_PENTIUM_MMX_MODEL_4		= B_CPU_INTEL_PENTIUM_MMX,
	B_CPU_INTEL_PENTIUM_MMX_MODEL_8		= 0x1058,
	B_CPU_INTEL_PENTIUM75_486_OVERDRIVE,
	B_CPU_INTEL_PENTIUM_PRO				= 0x1061,
	B_CPU_INTEL_PENTIUM_II				= 0x1063,
	B_CPU_INTEL_PENTIUM_II_MODEL_3		= 0x1063,
	B_CPU_INTEL_PENTIUM_II_MODEL_5		= 0x1065,
	B_CPU_INTEL_CELERON					= 0x1066,
	B_CPU_INTEL_CELERON_MODEL_22		= 0x11066,
	B_CPU_INTEL_PENTIUM_III				= 0x1067,
	B_CPU_INTEL_PENTIUM_III_MODEL_8		= 0x1068,
	B_CPU_INTEL_PENTIUM_M				= 0x1069,
	B_CPU_INTEL_PENTIUM_III_XEON		= 0x106a,
	B_CPU_INTEL_PENTIUM_III_MODEL_11 	= 0x106b,
	B_CPU_INTEL_ATOM			= 0x1106c,
	B_CPU_INTEL_PENTIUM_M_MODEL_13		= 0x106d, /* Dothan */
	B_CPU_INTEL_PENTIUM_CORE,
	B_CPU_INTEL_PENTIUM_CORE_2,
	B_CPU_INTEL_PENTIUM_CORE_2_45_NM	= 0x11067, /* Core 2 on 45 nm
	                                                   (Core 2 Extreme,
	                                                   Xeon model 23 or
	                                                   Core 2 Duo/Quad) */
	B_CPU_INTEL_PENTIUM_CORE_I7			= 0x1106a, /* Core i7 920 @ 2.6(6) */
	B_CPU_INTEL_PENTIUM_CORE_I7_Q720	= 0x1106e, /* Core i7 Q720 @ 1.6 */
	B_CPU_INTEL_PENTIUM_IV				= 0x10f0,
	B_CPU_INTEL_PENTIUM_IV_MODEL_1,
	B_CPU_INTEL_PENTIUM_IV_MODEL_2,
	B_CPU_INTEL_PENTIUM_IV_MODEL_3,
	B_CPU_INTEL_PENTIUM_IV_MODEL_4,

	/* AMD */

	/* Checked with "AMD Processor Recognition Application Note"
	 * (Table 3)
	 * 20734.pdf
	 */
	B_CPU_AMD_x86						= 0x1100,
	B_CPU_AMD_K5_MODEL_0				= 0x1150,
	B_CPU_AMD_K5_MODEL_1,
	B_CPU_AMD_K5_MODEL_2,
	B_CPU_AMD_K5_MODEL_3,
	B_CPU_AMD_K6_MODEL_6				= 0x1156,
	B_CPU_AMD_K6_MODEL_7				= 0x1157,
	B_CPU_AMD_K6_MODEL_8				= 0x1158,
	B_CPU_AMD_K6_2						= 0x1158,
	B_CPU_AMD_K6_MODEL_9				= 0x1159,
	B_CPU_AMD_K6_III					= 0x1159,
	B_CPU_AMD_K6_III_MODEL_13			= 0x115d,

	B_CPU_AMD_ATHLON_MODEL_1			= 0x1161,
	B_CPU_AMD_ATHLON_MODEL_2			= 0x1162,

	B_CPU_AMD_DURON 					= 0x1163,

	B_CPU_AMD_ATHLON_THUNDERBIRD		= 0x1164,
	B_CPU_AMD_ATHLON_XP 				= 0x1166,
	B_CPU_AMD_ATHLON_XP_MODEL_7,
	B_CPU_AMD_ATHLON_XP_MODEL_8,
	B_CPU_AMD_ATHLON_XP_MODEL_10		= 0x116a, /* Barton */

	B_CPU_AMD_SEMPRON_MODEL_8			= B_CPU_AMD_ATHLON_XP_MODEL_8,
	B_CPU_AMD_SEMPRON_MODEL_10			= B_CPU_AMD_ATHLON_XP_MODEL_10,

	/* According to "Revision Guide for AMD Family 10h
	 * Processors" (41322.pdf)
	 */
	B_CPU_AMD_PHENOM					= 0x11f2,

	/* According to "Revision guide for AMD Athlon 64
	 * and AMD Opteron Processors" (25759.pdf)
	 */
	B_CPU_AMD_ATHLON_64_MODEL_3			= 0x11f3,
	B_CPU_AMD_ATHLON_64_MODEL_4,
	B_CPU_AMD_ATHLON_64_MODEL_5,
	B_CPU_AMD_OPTERON					= B_CPU_AMD_ATHLON_64_MODEL_5,
	B_CPU_AMD_ATHLON_64_FX				= B_CPU_AMD_ATHLON_64_MODEL_5,
	B_CPU_AMD_ATHLON_64_MODEL_7			= 0x11f7,
	B_CPU_AMD_ATHLON_64_MODEL_8,
	B_CPU_AMD_ATHLON_64_MODEL_11		= 0x11fb,
	B_CPU_AMD_ATHLON_64_MODEL_12,
	B_CPU_AMD_ATHLON_64_MODEL_14		= 0x11fe,
	B_CPU_AMD_ATHLON_64_MODEL_15,

	B_CPU_AMD_GEODE_LX					= 0x115a,

	/* VIA/Cyrix */
	B_CPU_CYRIX_x86						= 0x1200,
	B_CPU_VIA_CYRIX_x86					= 0x1200,
	B_CPU_CYRIX_GXm						= 0x1254,
	B_CPU_CYRIX_6x86MX					= 0x1260,

	/* VIA/IDT */
	B_CPU_IDT_x86						= 0x1300,
	B_CPU_VIA_IDT_x86					= 0x1300,
	B_CPU_IDT_WINCHIP_C6				= 0x1354,
	B_CPU_IDT_WINCHIP_2					= 0x1358,
	B_CPU_IDT_WINCHIP_3,
	B_CPU_VIA_C3_SAMUEL					= 0x1366,
	B_CPU_VIA_C3_SAMUEL_2				= 0x1367,
	B_CPU_VIA_C3_EZRA_T					= 0x1368,
	B_CPU_VIA_C3_NEHEMIAH				= 0x1369,
	B_CPU_VIA_C7_ESTHER					= 0x136a,
	B_CPU_VIA_C7_ESTHER_2				= 0x136d,
	B_CPU_VIA_NANO_ISAIAH				= 0x136f,

	/* Transmeta */
	B_CPU_TRANSMETA_x86					= 0x1600,
	B_CPU_TRANSMETA_CRUSOE				= 0x1654,
	B_CPU_TRANSMETA_EFFICEON			= 0x16f2,
	B_CPU_TRANSMETA_EFFICEON_2			= 0x16f3,

	/* Rise */
	B_CPU_RISE_x86						= 0x1400,
	B_CPU_RISE_mP6						= 0x1450,

	/* National Semiconductor */
	B_CPU_NATIONAL_x86					= 0x1500,
	B_CPU_NATIONAL_GEODE_GX1			= 0x1554,
	B_CPU_NATIONAL_GEODE_GX2,

	/* For compatibility */
	B_CPU_AMD_29K						= 14,
	B_CPU_x86,
	B_CPU_MC6502,
	B_CPU_Z80,
	B_CPU_ALPHA,
	B_CPU_MIPS,
	B_CPU_HPPA,
	B_CPU_M68K,
	B_CPU_ARM,
	B_CPU_SH,
	B_CPU_SPARC
};

const int B_CPU_x86_VENDOR_MASK	= 0xff00;

version(__INTEL__) {
	union cpuid_info {
/*
		struct eax_0 {
			uint32	max_eax;
			char	vendor_id[12];
		}

		struct eax_1 {
			uint32	stepping		: 4;
			uint32	model			: 4;
			uint32	family			: 4;
			uint32	type			: 2;
			uint32	reserved_0		: 2;
			uint32	extended_model	: 4;
			uint32	extended_family	: 8;
			uint32	reserved_1		: 4;

			uint32	brand_index		: 8;
			uint32	clflush			: 8;
			uint32	logical_cpus	: 8;
			uint32	apic_id			: 8;

			uint32	features;
			uint32	extended_features;
		}

		struct eax_2 {
			uint8	call_num;
			uint8	cache_descriptors[15];
		}

		struct eax_3 {
			uint32	reserved[2];
			uint32	serial_number_high;
			uint32	serial_number_low;
		}

		char		as_chars[16];

		struct regs {
			uint32	eax;
			uint32	ebx;
			uint32	edx;
			uint32	ecx;
		}
		*/
	}

extern (C) extern status_t		get_cpuid(cpuid_info *info, uint32 eaxRegister, uint32 cpuNum);
}


enum platform_types {
	B_BEBOX_PLATFORM = 0,
	B_MAC_PLATFORM,
	B_AT_CLONE_PLATFORM,
	B_ENIAC_PLATFORM,
	B_APPLE_II_PLATFORM,
	B_CRAY_PLATFORM,
	B_LISA_PLATFORM,
	B_TI_994A_PLATFORM,
	B_TIMEX_SINCLAIR_PLATFORM,
	B_ORAC_1_PLATFORM,
	B_HAL_PLATFORM,
	B_BESM_6_PLATFORM,
	B_MK_61_PLATFORM,
	B_NINTENDO_64_PLATFORM,
	B_AMIGA_PLATFORM,
	B_ATARI_PLATFORM
}

struct cpu_info {
	bigtime_t	active_time;	/* usec of doing useful work since boot */
}


alias int32 machine_id[2];	/* unique machine ID */

struct system_info {
	machine_id		id;					/* unique machine ID */
	bigtime_t		boot_time;			/* time of boot (usecs since 1/1/1970) */

	int32			cpu_count;			/* number of cpus */
	cpu_types	cpu_type;			/* type of cpu */
	int32			cpu_revision;		/* revision # of cpu */
	cpu_info		cpu_infos[B_MAX_CPU_COUNT];	/* info about individual cpus */
	int64			cpu_clock_speed;	/* processor clock speed (Hz) */
	int64			bus_clock_speed;	/* bus clock speed (Hz) */
	platform_types platform_type;	/* type of machine we're on */

	int32			max_pages;			/* total # physical pages */
	int32			used_pages;			/* # physical pages in use */
	int32			page_faults;		/* # of page faults */
	int32			max_sems;
	int32			used_sems;
	int32			max_ports;
	int32			used_ports;
	int32			max_threads;
	int32			used_threads;
	int32			max_teams;
	int32			used_teams;

	char			kernel_name[B_FILE_NAME_LENGTH];
	char			kernel_build_date[B_OS_NAME_LENGTH];
	char			kernel_build_time[B_OS_NAME_LENGTH];
	int64			kernel_version;

	bigtime_t		_busy_wait_time;	/* reserved for whatever */
	int32			cached_pages;

	uint32			abi;				/* the system API */

	int32			pad[2];
}

/* system private, use macro instead */
extern (C) extern status_t	_get_system_info(system_info *info, size_t size);

/* D Helper functions for system_info */
status_t get_system_info(inout system_info info) {
	return _get_system_info(&info, info.sizeof);
}

extern (C) extern int32		is_computer_on();
extern (C) extern double	is_computer_on_fire();


/* WARNING: Experimental API! */

enum {
	B_OBJECT_TYPE_FD		= 0,
	B_OBJECT_TYPE_SEMAPHORE	= 1,
	B_OBJECT_TYPE_PORT		= 2,
	B_OBJECT_TYPE_THREAD	= 3
};

enum {
	B_EVENT_READ				= 0x0001,	/* FD/port readable */
	B_EVENT_WRITE				= 0x0002,	/* FD/port writable */
	B_EVENT_ERROR				= 0x0004,	/* FD error */
	B_EVENT_PRIORITY_READ		= 0x0008,	/* FD priority readable */
	B_EVENT_PRIORITY_WRITE		= 0x0010,	/* FD priority writable */
	B_EVENT_HIGH_PRIORITY_READ	= 0x0020,	/* FD high priority readable */
	B_EVENT_HIGH_PRIORITY_WRITE	= 0x0040,	/* FD high priority writable */
	B_EVENT_DISCONNECTED		= 0x0080,	/* FD disconnected */

	B_EVENT_ACQUIRE_SEMAPHORE	= 0x0001,	/* semaphore can be acquired */

	B_EVENT_INVALID				= 0x1000	/* FD/port/sem/thread ID not or
											   no longer valid (e.g. has been
											   close/deleted) */
};

struct object_wait_info {
	int32		object;						/* ID of the object */
	uint16		type;						/* type of the object */
	uint16		events;						/* events mask */
}

/* wait_for_objects[_etc]() waits until at least one of the specified events or,
   if given, the timeout occurred. When entering the function the
   object_wait_info::events field specifies the events for each object the
   caller is interested in. When the function returns the fields reflect the
   events that actually occurred. The events B_EVENT_INVALID, B_EVENT_ERROR,
   and B_EVENT_DISCONNECTED don't need to be specified. They will always be
   reported, when they occur. */

extern (C) extern ssize_t		wait_for_objects(object_wait_info* infos, int numInfos);
extern (C) extern ssize_t		wait_for_objects_etc(object_wait_info* infos, int numInfos,
									uint32 flags, bigtime_t timeout);
