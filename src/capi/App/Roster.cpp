/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Roster.h>

extern "C" {
	BRoster* be_BRoster_ctor(void *bindInstPtr)
	{
		return new BRoster();
	}

	void be_BRoster_dtor(BRoster* self)
	{
		delete self;
	}

	bool be_BRoster_IsRunning(BRoster *self, const char * mimeSig)
	{
		return self->IsRunning(mimeSig);
	}

	bool be_BRoster_IsRunning_1(BRoster *self, entry_ref * _ref)
	{
		return self->IsRunning(_ref);
	}

	team_id be_BRoster_TeamFor(BRoster *self, const char * mimeSig)
	{
		return self->TeamFor(mimeSig);
	}

	team_id be_BRoster_TeamFor_1(BRoster *self, entry_ref * _ref)
	{
		return self->TeamFor(_ref);
	}

	void be_BRoster_GetAppList(BRoster *self, BList * teamIDList)
	{
		self->GetAppList(teamIDList);
	}

	void be_BRoster_GetAppList_1(BRoster *self, const char * sig, BList * teamIDList)
	{
		self->GetAppList(sig, teamIDList);
	}

	status_t be_BRoster_GetAppInfo(BRoster *self, const char * sig, app_info * info)
	{
		return self->GetAppInfo(sig, info);
	}

	status_t be_BRoster_GetAppInfo_1(BRoster *self, entry_ref * ref, app_info * info)
	{
		return self->GetAppInfo(ref, info);
	}

	status_t be_BRoster_GetRunningAppInfo(BRoster *self, team_id team, app_info * info)
	{
		return self->GetRunningAppInfo(team, info);
	}

	status_t be_BRoster_GetActiveAppInfo(BRoster *self, app_info * info)
	{
		return self->GetActiveAppInfo(info);
	}

	status_t be_BRoster_FindApp(BRoster *self, const char * mimeType, entry_ref * app)
	{
		return self->FindApp(mimeType, app);
	}

	status_t be_BRoster_FindApp_1(BRoster *self, entry_ref * ref, entry_ref * app)
	{
		return self->FindApp(ref, app);
	}

	status_t be_BRoster_Broadcast(BRoster *self, BMessage * message)
	{
		return self->Broadcast(message);
	}

	status_t be_BRoster_Broadcast_1(BRoster *self, BMessage * message, BMessenger *replyTo)
	{
		return self->Broadcast(message, *replyTo);
	}

	status_t be_BRoster_StartWatching(BRoster *self, BMessenger *target, uint32 eventMask)
	{
		return self->StartWatching(*target, eventMask);
	}

	status_t be_BRoster_StopWatching(BRoster *self, BMessenger *target)
	{
		return self->StopWatching(*target);
	}

	status_t be_BRoster_ActivateApp(BRoster *self, team_id team)
	{
		return self->ActivateApp(team);
	}

	status_t be_BRoster_Launch(BRoster *self, const char * mimeType, BMessage * initialMessage, team_id * appTeam)
	{
		return self->Launch(mimeType, initialMessage, appTeam);
	}

	status_t be_BRoster_Launch_1(BRoster *self, const char * mimeType, BList * messageList, team_id * appTeam)
	{
		return self->Launch(mimeType, messageList, appTeam);
	}

	status_t be_BRoster_Launch_2(BRoster *self, const char * mimeType, int argc, char ** args, team_id * appTeam)
	{
		return self->Launch(mimeType, argc, args, appTeam);
	}

	status_t be_BRoster_Launch_3(BRoster *self, const entry_ref * ref, const BMessage * initialMessage, team_id * appTeam)
	{
		return self->Launch(ref, initialMessage, appTeam);
	}

	status_t be_BRoster_Launch_4(BRoster *self, const entry_ref * ref, const BList * messageList, team_id * appTeam)
	{
		return self->Launch(ref, messageList, appTeam);
	}

	status_t be_BRoster_Launch_5(BRoster *self, const entry_ref * ref, int argc, const char * const * args, team_id * appTeam)
	{
		return self->Launch(ref, argc, args, appTeam);
	}

	void be_BRoster_GetRecentDocuments(BRoster *self, BMessage * refList, int32 maxCount, const char * fileType, const char * appSig)
	{
		self->GetRecentDocuments(refList, maxCount, fileType, appSig);
	}

	void be_BRoster_GetRecentDocuments_1(BRoster *self, BMessage * refList, int32 maxCount, const char * fileTypes[], int32 fileTypesCount, const char * appSig)
	{
		self->GetRecentDocuments(refList, maxCount, fileTypes, fileTypesCount, appSig);
	}

	void be_BRoster_GetRecentFolders(BRoster *self, BMessage * refList, int32 maxCount, const char * appSig)
	{
		self->GetRecentFolders(refList, maxCount, appSig);
	}

	void be_BRoster_GetRecentApps(BRoster *self, BMessage * refList, int32 maxCount)
	{
		self->GetRecentApps(refList, maxCount);
	}

	void be_BRoster_AddToRecentDocuments(BRoster *self, const entry_ref * doc, const char * appSig)
	{
		self->AddToRecentDocuments(doc, appSig);
	}

	void be_BRoster_AddToRecentFolders(BRoster *self, const entry_ref * folder, const char * appSig)
	{
		self->AddToRecentFolders(folder, appSig);
	}

	status_t be_BRoster_Notify(BRoster *self, const BNotification* notification, bigtime_t timeout)
	{
		return self->Notify(*notification, timeout);
	}

}


