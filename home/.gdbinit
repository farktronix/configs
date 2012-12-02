 define zombies
  set env NSZombieEnabled=YES
  set env NSDeallocateZombies=NO
  fb -[_NSZombie retainCount]
  fb -[_NSZombie retain]
  fb -[_NSZombie release]
  fb -[_NSZombie methodSignatureForSelector:]
  fb -[_NSZombie respondsToSelector:]
  fb -[_NSZombie class]
 end

 define coredav
    fb CoreDAVTask.m:573
    fb CoreDAVTask.m:643
    fb CoreDAVTask.m:680
    fb CoreDAVTask.m:691
    fb CoreDAVTask.m:737
    fb CoreDAVTask.m:798
 end

fb objc_exception_throw
#set start-with-shell 0
