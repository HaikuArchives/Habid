Important, im very sorry to say it but ive hit a snag in the code ... constructors and destructors are called more then once and i cant find a way around this, i will try and im hoping someone can come with some insight for me to how to cope with this problem for now im just stuck and do not have the time to work on it :/



D And C Bindings for the Haiku API, www.haiku-os.org

MAJOR MILESTONE HIT! BApplication is now up and running, working very smoothly =)

# Done parts: #

Support Kit:
  * SupportDefs (uncomplete)
  * [BArchivable](http://api.haiku-os.org/classBArchivable.html) (Needs testing)
  * [BString](http://api.haiku-os.org/classBString.html) (All except comparation operators)
  * [BList](http://api.haiku-os.org/classBList.html) (All except some operators)
  * [BDataIO](http://api.haiku-os.org/classBDataIO.html)
  * [BPositionIO](http://api.haiku-os.org/classBPositionIO.html)
  * [BMallocIO](http://api.haiku-os.org/classBMallocIO.html)
  * [BMemoryIO](http://api.haiku-os.org/classBMemoryIO.html)
  * [BBufferIO](http://api.haiku-os.org/classBBufferIO.html)
  * [BBlockCache](http://api.haiku-os.org/classBBlockCache.html) (Have to be revisited)
  * [BStopWatch](http://api.haiku-os.org/classBStopWatch.html)
  * [BLocker](http://api.haiku-os.org/classBLocker.html)
  * [BFlattenable](http://api.haiku-os.org/classBFlattenable.html)

Storage Kit: (These are extremly experimental still ... use on your own risk!)
  * StorageDefs (uncomplete)
  * [BFile](http://www.haiku-os.org/legacy-docs/bebook/BFile_Overview.html)
  * FindDirectory
  * BVolume
  * BVolumeRoster
  * BNode
  * BPath
  * BStatable
  * BDirectory
  * BEntry
  * BEntryList

Interface Kit:
  * GraphicsDefs (uncomplete)
  * InterfaceDefs (uncomplete)
  * BRect (All but operators)
  * BPoint (All but operators)
  * BSize (All but operators)
  * BPolygon (Very incomplete .. some strange stuff going on .. might it be voodoo ?)
  * BRegion (All but operators)
  * BAlignment
  * BInputDevice

Application Kit: (These are also quite untested)
  * AppDefs
  * BApplication
  * BMessage (not yet totaly completed)
  * BMessageRunner
  * BMessageFilter
  * BMessageQueue
  * BMessenger
  * BLooper
  * BHandler
  * BInvoker (Untested might not work at all)
  * BClipboard
  * BPropertyInfo (Untested)
  * BRoster (Untested)

Progress so far =)

![http://img714.imageshack.us/img714/4546/screenshot2ro.png](http://img714.imageshack.us/img714/4546/screenshot2ro.png)
