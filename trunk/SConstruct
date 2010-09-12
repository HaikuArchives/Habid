
BuildDir('build/', 'src/')
env = Environment()

c_objs = env.SConscript('src/capi/SConscript')
d_objs = env.SConscript('src/dapi/SConscript')

env.SharedLibrary('libhabid.so', source=c_objs + d_objs)
# env.SharedLibrary('libhabid.so', source=["src/test.cpp", "src/test2.d"])
