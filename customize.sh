##########################################################################################
#
# Magisk Module Installer Script
# 酷安ID：天伞桜
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
 ui_print "                                                                                    "
 ui_print "                                                                                    "
   ui_print "**************************************"
  ui_print "         Pavlova UI 安装中...         "
  ui_print "**************************************"
  ui_print "       欢迎使用（Canary Mod）      "
  ui_print "**************************************"
  ui_print "本模块使用@RedSkulMods模板已得到作者许可.本模块修改内容仅涉及适配ColorOS 13&OxygenOS 13和莫奈图标扩展.本模块免费使用，谨防被骗."
  ui_print "                                                                                    "
  ui_print "    +++        +                                                                   "
  ui_print "   +     + +  ++   +++  +++  +  +  +  +  +  +                                   "
  ui_print "    +++  +   +  +  +++  +++  +++   + ++  ++                                    "
  ui_print "         +   + +    +++  +  +        ++ +  + +                                   "
  ui_print "                                2   0   7    7                                      "
  ui_print "   
  
                                               
                    Now Playing《Closer》   
                                                                                  
                      正在播放《Closer》
                ━━━━━━●─────── 04:41
                 ⇆ ㅤ ㅤ◁ ㅤㅤ❚❚ ㅤㅤ▷ ㅤ    ㅤ↻    "
  ui_print "                                                                                    "
  ui_print "                                                                                    "
  ui_print "                                                                                    "
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="

"
#添加您要精简的APP/文件夹目录
#例如：精简状态栏，找到状态栏目录为  /system/priv-app/SystemUI/SystemUI.apk     
#转化加入:/system/priv-app/SystemUI
#（可以搭配高级设置获取APP目录）

##########################################################################################
# Permissions
##########################################################################################
#释放文件，普通shell命令
on_install() {
  ui_print "- 正在释放文件"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
  
  #设置权限，基本不要去动
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.


CommonPath=$MODPATH/common
if [ ! -d ${CommonPath} ];then
  ui_print "模块不需要修复!"
  
elif [ "`ls -A ${CommonPath}`" = "" ];then
    ui_print "模块Dimen为空!"
    rm  -rf  ${CommonPath}
else

  ui_print "- 正在进入酷安（如果你有，点个关注吧）"
  mv  ${CommonPath}/*  $MODPATH
  rm  -rf ${CommonPath}

fi
coolapkTesting=`pm list package | grep -w 'com.coolapk.market'`
  if [[ "$coolapkTesting" != "" ]];then
  am start -d 'coolmarket://u/540690' >/dev/null 2>&1
  fi

