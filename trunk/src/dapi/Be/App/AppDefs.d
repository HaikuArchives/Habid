/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.AppDefs;

import Be.Support.HelperFunctions;

/*
// Old-style cursors
extern const unsigned char B_HAND_CURSOR[];
extern const unsigned char B_I_BEAM_CURSOR[];

// New-style cursors
#ifdef  __cplusplus
class BCursor;
extern const BCursor *B_CURSOR_SYSTEM_DEFAULT;
extern const BCursor *B_CURSOR_I_BEAM;
#endif
*/

// System Message Codes
enum {
	B_ABOUT_REQUESTED			= MakeValue!("_ABR"),
	B_WINDOW_ACTIVATED			= MakeValue!("_ACT"),
	B_APP_ACTIVATED				= MakeValue!("_ACT"),	// Same as B_WINDOW_ACTIVATED
	B_ARGV_RECEIVED 			= MakeValue!("_ARG"),
	B_QUIT_REQUESTED 			= MakeValue!("_QRQ"),
	B_CLOSE_REQUESTED 			= MakeValue!("_QRQ"),	// Obsolete; use B_QUIT_REQUESTED
	B_CANCEL					= MakeValue!("_CNC"),
	B_INVALIDATE				= MakeValue!("_IVL"),
	B_KEY_DOWN 					= MakeValue!("_KYD"),
	B_KEY_UP 					= MakeValue!("_KYU"),
	B_UNMAPPED_KEY_DOWN 		= MakeValue!("_UKD"),
	B_UNMAPPED_KEY_UP 			= MakeValue!("_UKU"),
	B_LAYOUT_WINDOW				= MakeValue!("_LAY"),
	B_MODIFIERS_CHANGED			= MakeValue!("_MCH"),
	B_MINIMIZE					= MakeValue!("_WMN"),
	B_MOUSE_DOWN 				= MakeValue!("_MDN"),
	B_MOUSE_MOVED 				= MakeValue!("_MMV"),
	B_MOUSE_ENTER_EXIT			= MakeValue!("_MEX"),
	B_MOUSE_IDLE				= MakeValue!("_MSI"),
	B_MOUSE_UP 					= MakeValue!("_MUP"),
	B_MOUSE_WHEEL_CHANGED		= MakeValue!("_MWC"),
	B_OPEN_IN_WORKSPACE			= MakeValue!("_OWS"),
	B_PRINTER_CHANGED			= MakeValue!("_PCH"),
	B_PULSE 					= MakeValue!("_PUL"),
	B_READY_TO_RUN 				= MakeValue!("_RTR"),
	B_REFS_RECEIVED 			= MakeValue!("_RRC"),
	B_RELEASE_OVERLAY_LOCK		= MakeValue!("_ROV"),
	B_ACQUIRE_OVERLAY_LOCK		= MakeValue!("_AOV"),
	B_SCREEN_CHANGED 			= MakeValue!("_SCH"),
	B_VALUE_CHANGED 			= MakeValue!("_VCH"),
	B_TRANSLATOR_ADDED			= MakeValue!("_ART"),
	B_TRANSLATOR_REMOVED		= MakeValue!("_RRT"),
	B_VIEW_MOVED 				= MakeValue!("_VMV"),
	B_VIEW_RESIZED 				= MakeValue!("_VRS"),
	B_WINDOW_MOVED 				= MakeValue!("_WMV"),
	B_WINDOW_RESIZED 			= MakeValue!("_WRS"),
	B_WORKSPACES_CHANGED		= MakeValue!("_WCG"),
	B_WORKSPACE_ACTIVATED		= MakeValue!("_WAC"),
	B_ZOOM						= MakeValue!("_WZM"),
	_COLORS_UPDATED				= MakeValue!("_CLU"),
		// Currently internal-use only. Later, public as B_COLORS_UPDATED
	_FONTS_UPDATED				= MakeValue!("_FNU"),
		// Currently internal-use only. Later, public as B_FONTS_UPDATED
	_APP_MENU_					= MakeValue!("_AMN"),
	_BROWSER_MENUS_				= MakeValue!("_BRM"),
	_MENU_EVENT_ 				= MakeValue!("_MEV"),
	_PING_						= MakeValue!("_PBL"),
	_QUIT_ 						= MakeValue!("_QIT"),
	_VOLUME_MOUNTED_ 			= MakeValue!("_NVL"),
	_VOLUME_UNMOUNTED_			= MakeValue!("_VRM"),
	_MESSAGE_DROPPED_ 			= MakeValue!("_MDP"),
	_DISPOSE_DRAG_ 				= MakeValue!("_DPD"),
	_MENUS_DONE_				= MakeValue!("_MND"),
	_SHOW_DRAG_HANDLES_			= MakeValue!("_SDH"),
	_EVENTS_PENDING_ 			= MakeValue!("_EVP"),
	_UPDATE_ 					= MakeValue!("_UPD"),
	_UPDATE_IF_NEEDED_			= MakeValue!("_UPN"),
	_PRINTER_INFO_				= MakeValue!("_PIN"),
	_SETUP_PRINTER_				= MakeValue!("_SUP"),
	_SELECT_PRINTER_			= MakeValue!("_PSL")
	// Media Kit reserves all reserved codes starting in '_TR'
};


// Other Commands
enum {
	B_SET_PROPERTY				= MakeValue!("PSET"),
	B_GET_PROPERTY				= MakeValue!("PGET"),
	B_CREATE_PROPERTY			= MakeValue!("PCRT"),
	B_DELETE_PROPERTY			= MakeValue!("PDEL"),
	B_COUNT_PROPERTIES			= MakeValue!("PCNT"),
	B_EXECUTE_PROPERTY			= MakeValue!("PEXE"),
	B_GET_SUPPORTED_SUITES		= MakeValue!("SUIT"),
	B_UNDO						= MakeValue!("UNDO"),
	B_REDO						= MakeValue!("REDO"),
	B_CUT 						= MakeValue!("CCUT"),
	B_COPY 						= MakeValue!("COPY"),
	B_PASTE 					= MakeValue!("PSTE"),
	B_SELECT_ALL				= MakeValue!("SALL"),
	B_SAVE_REQUESTED 			= MakeValue!("SAVE"),
	B_MESSAGE_NOT_UNDERSTOOD	= MakeValue!("MNOT"),
	B_NO_REPLY 					= MakeValue!("NONE"),
	B_REPLY 					= MakeValue!("RPLY"),
	B_SIMPLE_DATA				= MakeValue!("DATA"),
	B_MIME_DATA					= MakeValue!("MIME"),
	B_ARCHIVED_OBJECT			= MakeValue!("ARCV"),
	B_UPDATE_STATUS_BAR			= MakeValue!("SBUP"),
	B_RESET_STATUS_BAR			= MakeValue!("SBRS"),
	B_NODE_MONITOR				= MakeValue!("NDMN"),
	B_QUERY_UPDATE				= MakeValue!("QUPD"),
	B_ENDORSABLE				= MakeValue!("ENDO"),
	B_COPY_TARGET				= MakeValue!("DDCP"),
	B_MOVE_TARGET				= MakeValue!("DDMV"),
	B_TRASH_TARGET				= MakeValue!("DDRM"),
	B_LINK_TARGET				= MakeValue!("DDLN"),
	B_INPUT_DEVICES_CHANGED		= MakeValue!("IDCH"),
	B_INPUT_METHOD_EVENT		= MakeValue!("IMEV"),
	B_WINDOW_MOVE_TO			= MakeValue!("WDMT"),
	B_WINDOW_MOVE_BY			= MakeValue!("WDMB"),
	B_SILENT_RELAUNCH			= MakeValue!("AREL"),
	B_OBSERVER_NOTICE_CHANGE 	= MakeValue!("NTCH"),
	B_CONTROL_INVOKED			= MakeValue!("CIVK"),
	B_CONTROL_MODIFIED			= MakeValue!("CMOD")

	// Media Kit reserves all reserved codes starting in 'TRI'
}

