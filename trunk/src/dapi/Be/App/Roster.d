/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Roster;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.HelperFunctions;

import Be.App.Message;
import Be.App.Messenger;
import Be.App.Notification;

import Be.Support.List;

import Be.Storage.StorageDefs;
import Be.Storage.Entry;

import Be.Kernel.OS;

import tango.stdc.stringz;

struct app_info {
	thread_id	thread = -1;
	team_id		team = -1;
	port_id		port = -1;
	uint32		flags = B_MULTIPLE_LAUNCH | B_ARGV_ONLY;
	entry_ref	reference;
	char		signature[B_MIME_TYPE_LENGTH] = "\0";
}

// app flags
const int32 B_SINGLE_LAUNCH			= 	(0x0);
const int32 B_MULTIPLE_LAUNCH		=	(0x1);
const int32 B_EXCLUSIVE_LAUNCH		=	(0x2);
const int32 B_LAUNCH_MASK			=	(0x3);
const int32 B_BACKGROUND_APP		=	(0x4);
const int32 B_ARGV_ONLY				=	(0x8);
const int32 _B_APP_INFO_RESERVED1_	=	(0x10000000);

// watching request flags
enum {
	B_REQUEST_LAUNCHED	= 0x00000001,
	B_REQUEST_QUIT		= 0x00000002,
	B_REQUEST_ACTIVATED	= 0x00000004,
}

// notification message "what"
enum {
	B_SOME_APP_LAUNCHED		= MakeValue!("BRAS"),
	B_SOME_APP_QUIT			= MakeValue!("BRAQ"),
	B_SOME_APP_ACTIVATED	= MakeValue!("BRAW")
}

extern (C) extern {
	// BRoster* be_BRoster_ctor(void *bindInstPtr);
	void * be_BRoster_ctor(void *bindInstPtr);

	// void be_BRoster_dtor(BRoster* self);
	void be_BRoster_dtor(void* self);

	// bool be_BRoster_IsRunning(BRoster *self, const char * mimeSig);
	bool be_BRoster_IsRunning(void *self, char * mimeSig);

	// bool be_BRoster_IsRunning_1(BRoster *self, entry_ref * _ref);
	bool be_BRoster_IsRunning_1(void *self, entry_ref * _ref);

	// team_id be_BRoster_TeamFor(BRoster *self, const char * mimeSig);
	team_id be_BRoster_TeamFor(void *self, char * mimeSig);

	// team_id be_BRoster_TeamFor_1(BRoster *self, entry_ref * _ref);
	team_id be_BRoster_TeamFor_1(void *self, entry_ref * _ref);

	// void be_BRoster_GetAppList(BRoster *self, BList * teamIDList);
	void be_BRoster_GetAppList(void *self, void * teamIDList);

	// void be_BRoster_GetAppList_1(BRoster *self, const char * sig, BList * teamIDList);
	void be_BRoster_GetAppList_1(void *self, char * sig, void * teamIDList);

	// status_t be_BRoster_GetAppInfo(BRoster *self, const char * sig, app_info * info);
	status_t be_BRoster_GetAppInfo(void *self, char * sig, app_info * info);

	// status_t be_BRoster_GetAppInfo_1(BRoster *self, entry_ref * ref, app_info * info);
	status_t be_BRoster_GetAppInfo_1(void *self, entry_ref * _ref, app_info * info);

	// status_t be_BRoster_GetRunningAppInfo(BRoster *self, team_id team, app_info * info);
	status_t be_BRoster_GetRunningAppInfo(void *self, team_id team, app_info * info);

	// status_t be_BRoster_GetActiveAppInfo(BRoster *self, app_info * info);
	status_t be_BRoster_GetActiveAppInfo(void *self, app_info * info);

	// status_t be_BRoster_FindApp(BRoster *self, const char * mimeType, entry_ref * app);
	status_t be_BRoster_FindApp(void *self, char * mimeType, entry_ref * app);

	// status_t be_BRoster_FindApp_1(BRoster *self, entry_ref * ref, entry_ref * app);
	status_t be_BRoster_FindApp_1(void *self, entry_ref * _ref, entry_ref * app);

	// status_t be_BRoster_Broadcast(BRoster *self, BMessage * message);
	status_t be_BRoster_Broadcast(void *self, void * message);

	// status_t be_BRoster_Broadcast_1(BRoster *self, BMessage * message, BMessenger *replyTo);
	status_t be_BRoster_Broadcast_1(void *self, void * message, void *replyTo);

	// status_t be_BRoster_StartWatching(BRoster *self, BMessenger *target, uint32 eventMask);
	status_t be_BRoster_StartWatching(void *self, void *target, uint32 eventMask);

	// status_t be_BRoster_StopWatching(BRoster *self, BMessenger *target);
	status_t be_BRoster_StopWatching(void *self, void *target);

	// status_t be_BRoster_ActivateApp(BRoster *self, team_id team);
	status_t be_BRoster_ActivateApp(void *self, team_id team);

	// status_t be_BRoster_Launch(BRoster *self, const char * mimeType, BMessage * initialMessage, team_id * appTeam);
	status_t be_BRoster_Launch(void *self, char * mimeType, void * initialMessage, team_id * appTeam);

	// status_t be_BRoster_Launch_1(BRoster *self, const char * mimeType, BList * messageList, team_id * appTeam);
	status_t be_BRoster_Launch_1(void *self, char * mimeType, void * messageList, team_id * appTeam);

	// status_t be_BRoster_Launch_2(BRoster *self, const char * mimeType, int argc, char ** args, team_id * appTeam);
	status_t be_BRoster_Launch_2(void *self, char * mimeType, int argc, char ** args, team_id * appTeam);

	// status_t be_BRoster_Launch_3(BRoster *self, const entry_ref * ref, const BMessage * initialMessage, team_id * appTeam);
	status_t be_BRoster_Launch_3(void *self, entry_ref * _ref,  void * initialMessage, team_id * appTeam);

	// status_t be_BRoster_Launch_4(BRoster *self, const entry_ref * ref, const BList * messageList, team_id * appTeam);
	status_t be_BRoster_Launch_4(void *self, entry_ref * _ref,  void * messageList, team_id * appTeam);

	// status_t be_BRoster_Launch_5(BRoster *self, const entry_ref * ref, int argc, const char * const * args, team_id * appTeam);
	status_t be_BRoster_Launch_5(void *self, entry_ref * _ref, int argc,  char ** args, team_id * appTeam);

	// void be_BRoster_GetRecentDocuments(BRoster *self, BMessage * refList, int32 maxCount, const char * fileType, const char * appSig);
	void be_BRoster_GetRecentDocuments(void *self, void * refList, int32 maxCount,  char * fileType,  char * appSig);

	// void be_BRoster_GetRecentDocuments_1(BRoster *self, BMessage * refList, int32 maxCount, const char * fileTypes[], int32 fileTypesCount, const char * appSig);
	void be_BRoster_GetRecentDocuments_1(void *self, void * refList, int32 maxCount,  char * fileTypes[], int32 fileTypesCount,  char * appSig);

	// void be_BRoster_GetRecentFolders(BRoster *self, BMessage * refList, int32 maxCount, const char * appSig);
	void be_BRoster_GetRecentFolders(void *self, void * refList, int32 maxCount,  char * appSig);

	// void be_BRoster_GetRecentApps(BRoster *self, BMessage * refList, int32 maxCount);
	void be_BRoster_GetRecentApps(void *self, void * refList, int32 maxCount);

	// void be_BRoster_AddToRecentDocuments(BRoster *self, const entry_ref * doc, const char * appSig);
	void be_BRoster_AddToRecentDocuments(void *self, entry_ref * doc,  char * appSig);

	// void be_BRoster_AddToRecentFolders(BRoster *self, const entry_ref * folder, const char * appSig);
	void be_BRoster_AddToRecentFolders(void *self, entry_ref * folder,  char * appSig);

	// status_t be_BRoster_Notify(BRoster *self, const BNotification* notification, bigtime_t timeout);
	status_t be_BRoster_Notify(void *self, void* notification, bigtime_t timeout);

}


final class BRoster
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BRoster* be_BRoster_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BRoster_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// void be_BRoster_dtor(BRoster* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BRoster_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// bool be_BRoster_IsRunning(BRoster *self, const char * mimeSig);
	bool IsRunning(char [] mimeSig) {
		return be_BRoster_IsRunning(_InstPtr(), toStringz(mimeSig));
	}

	// bool be_BRoster_IsRunning_1(BRoster *self, entry_ref * _ref);
	bool IsRunning(entry_ref _ref) {
		return be_BRoster_IsRunning_1(_InstPtr(), &_ref);
	}

	// team_id be_BRoster_TeamFor(BRoster *self, const char * mimeSig);
	team_id TeamFor(char [] mimeSig) {
		return be_BRoster_TeamFor(_InstPtr(), toStringz(mimeSig));
	}

	// team_id be_BRoster_TeamFor_1(BRoster *self, entry_ref * _ref);
	team_id TeamFor(entry_ref _ref) {
		return be_BRoster_TeamFor_1(_InstPtr(), &_ref);
	}

	// void be_BRoster_GetAppList(BRoster *self, BList * teamIDList);
	void GetAppList(BList teamIDList) {
		be_BRoster_GetAppList(_InstPtr(), teamIDList._InstPtr);
	}

	// void be_BRoster_GetAppList_1(BRoster *self, const char * sig, BList * teamIDList);
	void GetAppList(char [] sig, BList teamIDList) {
		be_BRoster_GetAppList_1(_InstPtr(), toStringz(sig), teamIDList._InstPtr);
	}

	// status_t be_BRoster_GetAppInfo(BRoster *self, const char * sig, app_info * info);
	status_t GetAppInfo(char [] sig, inout app_info info) {
		return be_BRoster_GetAppInfo(_InstPtr(), toStringz(sig), &info);
	}

	// status_t be_BRoster_GetAppInfo_1(BRoster *self, entry_ref * ref, app_info * info);
	status_t GetAppInfo(entry_ref _ref, inout app_info info) {
		return be_BRoster_GetAppInfo_1(_InstPtr(), &_ref, &info);
	}

	// status_t be_BRoster_GetRunningAppInfo(BRoster *self, team_id team, app_info * info);
	status_t GetRunningAppInfo(team_id team, inout app_info info) {
		return be_BRoster_GetRunningAppInfo(_InstPtr(), team, &info);
	}

	// status_t be_BRoster_GetActiveAppInfo(BRoster *self, app_info * info);
	status_t GetActiveAppInfo(inout app_info info) {
		return be_BRoster_GetActiveAppInfo(_InstPtr(), &info);
	}

	// status_t be_BRoster_FindApp(BRoster *self, const char * mimeType, entry_ref * app);
	status_t FindApp(char [] mimeType, inout entry_ref app) {
		return be_BRoster_FindApp(_InstPtr(), toStringz(mimeType), &app);
	}

	// status_t be_BRoster_FindApp_1(BRoster *self, entry_ref * ref, entry_ref * app);
	status_t FindApp(entry_ref _ref, inout entry_ref app) {
		return be_BRoster_FindApp_1(_InstPtr(), &_ref, &app);
	}

	// status_t be_BRoster_Broadcast(BRoster *self, BMessage * message);
	status_t Broadcast(BMessage message) {
		return be_BRoster_Broadcast(_InstPtr(), message._InstPtr);
	}

	// status_t be_BRoster_Broadcast_1(BRoster *self, BMessage * message, BMessenger *replyTo);
	status_t Broadcast(BMessage message, BMessenger replyTo) {
		return be_BRoster_Broadcast_1(_InstPtr(), message._InstPtr, replyTo._InstPtr);
	}

	// status_t be_BRoster_StartWatching(BRoster *self, BMessenger *target, uint32 eventMask);
	status_t StartWatching(BMessenger target, uint32 eventMask = B_REQUEST_LAUNCHED | B_REQUEST_QUIT) {
		return be_BRoster_StartWatching(_InstPtr(), target._InstPtr, eventMask);
	}

	// status_t be_BRoster_StopWatching(BRoster *self, BMessenger *target);
	status_t StopWatching(BMessenger target) {
		return be_BRoster_StopWatching(_InstPtr(), target._InstPtr);
	}

	// status_t be_BRoster_ActivateApp(BRoster *self, team_id team);
	status_t ActivateApp(team_id team) {
		return be_BRoster_ActivateApp(_InstPtr(), team);
	}

	// status_t be_BRoster_Launch(BRoster *self, const char * mimeType, BMessage * initialMessage, team_id * appTeam);
	status_t Launch(char [] mimeType, BMessage initialMessage, inout team_id appTeam) {
		return be_BRoster_Launch(_InstPtr(), toStringz(mimeType), initialMessage._InstPtr, &appTeam);
	}

	// status_t be_BRoster_Launch_1(BRoster *self, const char * mimeType, BList * messageList, team_id * appTeam);
	status_t Launch(char [] mimeType, BList messageList, inout team_id appTeam) {
		return be_BRoster_Launch_1(_InstPtr(), toStringz(mimeType), messageList._InstPtr, &appTeam);
	}

	// status_t be_BRoster_Launch_2(BRoster *self, const char * mimeType, int argc, char ** args, team_id * appTeam);
	status_t Launch(char [] mimeType, int argc, char [][] args, inout team_id appTeam) {
		assert(false, "Fix Me!");
//		return be_BRoster_Launch_2(_InstPtr(), toStringz(mimeType), argc, cast(char **)args.ptr, &appTeam);
	}

	// status_t be_BRoster_Launch_3(BRoster *self, const entry_ref * ref, const BMessage * initialMessage, team_id * appTeam);
	status_t Launch(entry_ref _ref, BMessage initialMessage, inout team_id appTeam) {
		return be_BRoster_Launch_3(_InstPtr(), &_ref, initialMessage._InstPtr, &appTeam);
	}

	// status_t be_BRoster_Launch_4(BRoster *self, const entry_ref * ref, const BList * messageList, team_id * appTeam);
	status_t Launch(entry_ref _ref, BList messageList, inout team_id appTeam) {
		return be_BRoster_Launch_4(_InstPtr(), &_ref, messageList._InstPtr, &appTeam);
	}

	// status_t be_BRoster_Launch_5(BRoster *self, const entry_ref * ref, int argc, const char * const * args, team_id * appTeam);
	status_t Launch(entry_ref _ref, int argc, char [][] args, inout team_id appTeam) {
		assert(false, "Fix Me!");
		// return be_BRoster_Launch_5(_InstPtr(), &_ref, argc, cast(char **)args.ptr, &appTeam);
	}

	// void be_BRoster_GetRecentDocuments(BRoster *self, BMessage * refList, int32 maxCount, const char * fileType, const char * appSig);
	void GetRecentDocuments(BMessage refList, int32 maxCount, char [] fileType, char [] appSig) {
		be_BRoster_GetRecentDocuments(_InstPtr(), refList._InstPtr, maxCount, toStringz(fileType), toStringz(appSig));
	}

	// void be_BRoster_GetRecentDocuments_1(BRoster *self, BMessage * refList, int32 maxCount, const char * fileTypes[], int32 fileTypesCount, const char * appSig);
	void GetRecentDocuments(BMessage refList, int32 maxCount, char [][] fileTypes, int32 fileTypeCount, char [] appSig) {
		assert(false, "Fix Me!");
//		be_BRoster_GetRecentDocuments_1(_InstPtr(), refList._InstPtr, maxCount, cast(char *[])fileTypes.ptr, fileTypeCount, toStringz(appSig));
	}

	// void be_BRoster_GetRecentFolders(BRoster *self, BMessage * refList, int32 maxCount, const char * appSig);
	void GetRecentFolders(BMessage refList, int32 maxCount, char [] appSig) {
		be_BRoster_GetRecentFolders(_InstPtr(), refList._InstPtr, maxCount, toStringz(appSig));
	}

	// void be_BRoster_GetRecentApps(BRoster *self, BMessage * refList, int32 maxCount);
	void GetRecentApps(BMessage refList, int32 maxCount) {
		be_BRoster_GetRecentApps(_InstPtr(), refList._InstPtr, maxCount);
	}

	// void be_BRoster_AddToRecentDocuments(BRoster *self, const entry_ref * doc, const char * appSig);
	void AddToRecentDocuments(entry_ref doc, char [] appSig) {
		be_BRoster_AddToRecentDocuments(_InstPtr(), &doc, toStringz(appSig));
	}

	// void be_BRoster_AddToRecentFolders(BRoster *self, const entry_ref * folder, const char * appSig);
	void AddToRecentFolders(entry_ref folder, char [] appSig) {
		be_BRoster_AddToRecentFolders(_InstPtr(), &folder, toStringz(appSig));
	}

	// status_t be_BRoster_Notify(BRoster *self, const BNotification& notification, bigtime_t timeout);
	status_t Notify(BNotification notification, bigtime_t timeout) {
		return be_BRoster_Notify(_InstPtr(), notification._InstPtr, timeout);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


