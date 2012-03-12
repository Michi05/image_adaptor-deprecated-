FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/image_adaptor/msg"
  "../src/image_adaptor/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gencfg_cpp"
  "../cfg/cpp/image_adaptor/propertiesConfig.h"
  "../docs/propertiesConfig.dox"
  "../docs/propertiesConfig-usage.dox"
  "../src/image_adaptor/cfg/propertiesConfig.py"
  "../docs/propertiesConfig.wikidoc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gencfg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
