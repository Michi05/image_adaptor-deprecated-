FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/image_adaptor/msg"
  "../src/image_adaptor/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_cpp"
  "../srv_gen/cpp/include/image_adaptor/disparityImage.h"
  "../srv_gen/cpp/include/image_adaptor/setBoolean.h"
  "../srv_gen/cpp/include/image_adaptor/setString.h"
  "../srv_gen/cpp/include/image_adaptor/setInteger.h"
  "../srv_gen/cpp/include/image_adaptor/floatValue.h"
  "../srv_gen/cpp/include/image_adaptor/setFloat.h"
  "../srv_gen/cpp/include/image_adaptor/stringValue.h"
  "../srv_gen/cpp/include/image_adaptor/intValue.h"
  "../srv_gen/cpp/include/image_adaptor/booleanValue.h"
  "../srv_gen/cpp/include/image_adaptor/normalImage.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
