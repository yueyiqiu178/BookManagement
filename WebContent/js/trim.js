//為String類注射Trim方法
String.prototype.trim = function()
{
return this.replace(/(^\s*)|(\s*$)/g, "");
}