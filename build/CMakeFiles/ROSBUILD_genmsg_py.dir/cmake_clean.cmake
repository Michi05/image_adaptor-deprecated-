FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/image_adaptor/msg"
  "../src/image_adaptor/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/image_adaptor/msg/__init__.py"
  "../src/image_adaptor/msg/_integer.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
