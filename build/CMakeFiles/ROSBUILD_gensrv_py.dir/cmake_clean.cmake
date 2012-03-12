FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../src/image_adaptor/msg"
  "../src/image_adaptor/srv"
  "../msg_gen"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/image_adaptor/srv/__init__.py"
  "../src/image_adaptor/srv/_disparityImage.py"
  "../src/image_adaptor/srv/_setBoolean.py"
  "../src/image_adaptor/srv/_setString.py"
  "../src/image_adaptor/srv/_setInteger.py"
  "../src/image_adaptor/srv/_floatValue.py"
  "../src/image_adaptor/srv/_setFloat.py"
  "../src/image_adaptor/srv/_stringValue.py"
  "../src/image_adaptor/srv/_intValue.py"
  "../src/image_adaptor/srv/_booleanValue.py"
  "../src/image_adaptor/srv/_normalImage.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
