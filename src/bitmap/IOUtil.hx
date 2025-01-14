package bitmap;

class IOUtil {
  
	public static function readFile(path:String):haxe.io.Input {
		#if js
		untyped var s = require("fs").readFileSync(path);
		var bytes = haxe.io.Bytes.ofData(s);
		return new haxe.io.BytesInput(bytes);
		#else
		return sys.io.File.read(path, true);
		#end
		throw "Unexpected end of method";
	}

	public static function writeFile(file:String, input:haxe.io.Input) {
		var bytes = input.readAll();
		#if js
		untyped require("fs").writeFileSync(file, Buffer.from(bytes.b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}

   public static function writeBitmap(file:String, bitmap:Bitmap) {
    //  var copy = bitmap.data.sub(0, bitmap.data.length);
    var output=  new haxe.io.BytesOutput();
    bitmap.save(output);
    var bytes = output.getBytes();
    // output.writeBytes(bitmap.data, 0, bitmap.data.length);
		// var bytes = bitmap.data;
		#if js
		untyped require("fs").writeFileSync(file, Buffer.from(bytes.b));
		return;
		#else
		sys.io.File.saveBytes(file, bytes);
		return;
		#end
		throw "Unexpected end of method";
	}

}
