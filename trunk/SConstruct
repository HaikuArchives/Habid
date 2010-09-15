
BuildDir('build/', 'src/')
Default('libhabid.so')
env = Environment()


c_objs = env.SConscript('src/capi/SConscript')
d_objs = env.SConscript('src/dapi/SConscript')

env.SharedLibrary(target = 'libbed.so', source=d_objs)
env.SharedLibrary(target = 'libhabid.so', source=d_objs + c_objs)
env.SharedLibrary(target = 'libbec.so', source=c_objs)

# env.SharedLibrary('libhabid.so', source=["src/test.cpp", "src/test2.d"])
