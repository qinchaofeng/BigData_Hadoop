(一)时间
# Time marker for both stderr and stdout
date; date 1>&2

(二)路径
cloudera_config=`dirname $0`
cloudera_config=`cd "$cloudera_config/../common"; pwd`

(三)环境变量
echo "using $JAVA_HOME as JAVA_HOME"
echo "using $CDH_VERSION as CDH_VERSION"
echo "using $CDH_YARN_HOME as CDH_YARN_HOME"
echo "using $CDH_MR2_HOME as CDH_MR2_HOME"
echo "using $CONF_DIR as CONF_DIR"

(四)debug模式
# debug
set -x

(五)字符串非空比较
  if [ -n $2 ] && [ $2 = "true" ]; then

(六)结果判定
  RET=$?
  if [ $RET -eq 0 ]; then
    echo "RefreshQueues completed successfully"


(七)
$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
