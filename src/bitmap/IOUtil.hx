package bitmap;

class IOUtil {
  public static function fromFile(path:String):haxe.io.Input  {
    #if js
    untyped var s = require("fs").readFileSync(path).toString('binary');
    return new haxe.io.StringInput(s);
    #else
    return sys.io.File.read("test/assets/n.png", true);   
    #end
    throw "Unexpected end of method";
  }
}