
<!-- saved from url=(0066)https://www.eclipse.org/articles/swt-design-2/LeakExample.java.htm -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>LeakExample.java</title>
<style type="text/css" id="operaUserStyle">
  video {
    filter: -opera-shader(url(data:text/plain;base64,Ly8gaHR0cHM6Ly9naXRodWIuY29tL0dQVU9wZW4tRWZmZWN0cy9GaWRlbGl0eUZYLUNBUwovLyB2MwoKdW5pZm9ybSBzaGFkZXIgaUNodW5rOwp1bmlmb3JtIGZsb2F0MiBpQ2h1bmtTaXplOwp1bmlmb3JtIGZsb2F0MiBpTW91c2U7CnVuaWZvcm0gZmxvYXQgaUFyZ3NbMV07Cgpjb25zdCBmbG9hdCBFUFNJT04gPSAwLjE7CmNvbnN0IGZsb2F0IFZfTUlOID0gMDsKY29uc3QgZmxvYXQgVl9MT1cgPSAwLjI1Owpjb25zdCBmbG9hdCBWX01FRCA9IDAuNTsKY29uc3QgZmxvYXQgVl9ISUdIID0gMC43NTsKY29uc3QgZmxvYXQgVl9NQVggPSAxOwoKY29uc3QgZmxvYXQgVEhSRVNIT0xEX0FSRUEgPSA4MDAgKiA2MDA7CmNvbnN0IGZsb2F0IE1JTl9BUkVBID0gNDAwICogMTAwOwpjb25zdCBmbG9hdCBNSU5fU1RSSVAgPSAyMDsKY29uc3QgZmxvYXQgTUFSR0lOID0gMTsKCmZsb2F0MyBwaXhlbChpbnQgeCwgaW50IHksIGZsb2F0MiB4eSkgewogICAgcmV0dXJuIGlDaHVuay5ldmFsKHh5ICsgZmxvYXQyKHgsIHkpKS5yZ2I7Cn0KCmZsb2F0MyBzaGFycGVuKGZsb2F0MiB4eSkgewogICAgZmxvYXQzIGYgPQogICAgICAgIHBpeGVsKC0xLCAtMSwgeHkpICogIDEgKwogICAgICAgIHBpeGVsKCAwLCAtMSwgeHkpICogLTEgKwogICAgICAgIHBpeGVsKCAxLCAtMSwgeHkpICogIDEgKwoKICAgICAgICBwaXhlbCgtMSwgMCwgeHkpICogLTEgICsKICAgICAgICBwaXhlbCggMCwgMCwgeHkpICogLTEgICsKICAgICAgICBwaXhlbCggMSwgMCwgeHkpICogLTEgICsKCiAgICAgICAgcGl4ZWwoLTEsIDEsIHh5KSAqIDEgICArCiAgICAgICAgcGl4ZWwoIDAsIDEsIHh5KSAqIC0xICArCiAgICAgICAgcGl4ZWwoIDEsIDEsIHh5KSAqIDE7CiAgICByZXR1cm4gZiAvIC0xOwp9CgpmbG9hdDQgUkdYMihmbG9hdDIgeHkpIHsKICAgIGZsb2F0NCBjb2xvciA9IGlDaHVuay5ldmFsKHh5KTsKCiAgICBpZiAoaUNodW5rU2l6ZS54ICogaUNodW5rU2l6ZS55IDwgTUlOX0FSRUEpIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgaWYgKGlDaHVua1NpemUueSA8IE1JTl9TVFJJUCB8fCBpQ2h1bmtTaXplLnggPCBNSU5fU1RSSVApIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgaWYgKHh5LnggPCBNQVJHSU4gfHwgeHkueCA+IChpQ2h1bmtTaXplLnggLSBNQVJHSU4pIHx8CiAgICAgICAgeHkueSA8IE1BUkdJTiB8fCB4eS55ID4gKGlDaHVua1NpemUueSAtIE1BUkdJTikpIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgcmV0dXJuIGZsb2F0NChzaGFycGVuKHh5KSwgMSk7Cn0KCmZsb2F0IG1pbjMoZmxvYXQgeCwgZmxvYXQgeSwgZmxvYXQgeikgewogICAgcmV0dXJuIG1pbih4LCBtaW4oeSwgeikpOwp9CgpmbG9hdCBtYXgzKGZsb2F0IHgsIGZsb2F0IHksIGZsb2F0IHopIHsKICAgIHJldHVybiBtYXgoeCwgbWF4KHksIHopKTsKfQoKZmxvYXQgcmNwKGZsb2F0IHYpIHsKICAgIHJldHVybiAxIC8gdjsKfQoKZmxvYXQzIFJHWDMoZmxvYXQyIHh5LCBmbG9hdCBzdHJlbmd0aCkgewogICAgZmxvYXQzIGEgPSBwaXhlbCgtMSwgLTEsIHh5KTsKICAgIGZsb2F0MyBiID0gcGl4ZWwoIDAsIC0xLCB4eSk7CiAgICBmbG9hdDMgYyA9IHBpeGVsKCAxLCAtMSwgeHkpOwoKICAgIGZsb2F0MyBkID0gcGl4ZWwoLTEsIDAsIHh5KTsKICAgIGZsb2F0MyBlID0gcGl4ZWwoIDAsIDAsIHh5KTsKICAgIGZsb2F0MyBmID0gcGl4ZWwoIDEsIDAsIHh5KTsKCiAgICBmbG9hdDMgZyA9IHBpeGVsKC0xLCAxLCB4eSk7CiAgICBmbG9hdDMgaCA9IHBpeGVsKCAwLCAxLCB4eSk7CiAgICBmbG9hdDMgaSA9IHBpeGVsKCAxLCAxLCB4eSk7CgogICAgZmxvYXQgbW5SID0gbWluMyhtaW4zKGQuciwgZS5yLCBmLnIpLCBiLnIsIGgucik7CiAgICBmbG9hdCBtbkcgPSBtaW4zKG1pbjMoZC5nLCBlLmcsIGYuZyksIGIuZywgaC5nKTsKICAgIGZsb2F0IG1uQiA9IG1pbjMobWluMyhkLmIsIGUuYiwgZi5iKSwgYi5iLCBoLmIpOwoKICAgIGZsb2F0IG1uUjIgPSBtaW4zKG1pbjMobW5SLCBhLnIsIGMuciksIGcuciwgaS5yKTsKICAgIGZsb2F0IG1uRzIgPSBtaW4zKG1pbjMobW5HLCBhLmcsIGMuZyksIGcuZywgaS5nKTsKICAgIGZsb2F0IG1uQjIgPSBtaW4zKG1pbjMobW5CLCBhLmIsIGMuYiksIGcuYiwgaS5iKTsKCiAgICBtblIgPSBtblIgKyBtblIyOwogICAgbW5HID0gbW5HICsgbW5HMjsKICAgIG1uQiA9IG1uQiArIG1uQjI7CgogICAgZmxvYXQgbXhSID0gbWF4MyhtYXgzKGQuciwgZS5yLCBmLnIpLCBiLnIsIGgucik7CiAgICBmbG9hdCBteEcgPSBtYXgzKG1heDMoZC5nLCBlLmcsIGYuZyksIGIuZywgaC5nKTsKICAgIGZsb2F0IG14QiA9IG1heDMobWF4MyhkLmIsIGUuYiwgZi5iKSwgYi5iLCBoLmIpOwoKICAgIGZsb2F0IG14UjIgPSBtYXgzKG1heDMobXhSLCBhLnIsIGMuciksIGcuciwgaS5yKTsKICAgIGZsb2F0IG14RzIgPSBtYXgzKG1heDMobXhHLCBhLmcsIGMuZyksIGcuZywgaS5nKTsKICAgIGZsb2F0IG14QjIgPSBtYXgzKG1heDMobXhCLCBhLmIsIGMuYiksIGcuYiwgaS5iKTsKCiAgICBteFIgPSBteFIgKyBteFIyOwogICAgbXhHID0gbXhHICsgbXhHMjsKICAgIG14QiA9IG14QiArIG14QjI7CgogICAgZmxvYXQgcmNwTVIgPSByY3AobXhSKTsKICAgIGZsb2F0IHJjcE1HID0gcmNwKG14Ryk7CiAgICBmbG9hdCByY3BNQiA9IHJjcChteEIpOwoKICAgIGZsb2F0IGFtcFIgPSBzYXR1cmF0ZShtaW4obW5SLCAyIC0gbXhSKSAqIHJjcE1SKTsKICAgIGZsb2F0IGFtcEcgPSBzYXR1cmF0ZShtaW4obW5HLCAyIC0gbXhHKSAqIHJjcE1HKTsKICAgIGZsb2F0IGFtcEIgPSBzYXR1cmF0ZShtaW4obW5CLCAyIC0gbXhCKSAqIHJjcE1CKTsKCiAgICBhbXBSID0gc3FydChhbXBSKTsKICAgIGFtcEcgPSBzcXJ0KGFtcEcpOwogICAgYW1wQiA9IHNxcnQoYW1wQik7CgogICAgZmxvYXQgcGVhayA9IC1yY3AobWl4KDgsIDUsIHN0cmVuZ3RoKSk7CgogICAgZmxvYXQgd1IgPSBhbXBSICogcGVhazsKICAgIGZsb2F0IHdHID0gYW1wRyAqIHBlYWs7CiAgICBmbG9hdCB3QiA9IGFtcEIgKiBwZWFrOwoKICAgIGZsb2F0IHJjcFdlaWdodFIgPSByY3AoMSArIDQgKiB3Uik7CiAgICBmbG9hdCByY3BXZWlnaHRHID0gcmNwKDEgKyA0ICogd0cpOwogICAgZmxvYXQgcmNwV2VpZ2h0QiA9IHJjcCgxICsgNCAqIHdCKTsKCiAgICByZXR1cm4gZmxvYXQzKAogICAgICAgIHNhdHVyYXRlKChiLnIgKiB3UiArIGQuciAqIHdSICsgZi5yICogd1IgKyBoLnIgKiB3UiArIGUucikgKiByY3BXZWlnaHRSKSwKICAgICAgICBzYXR1cmF0ZSgoYi5nICogd0cgKyBkLmcgKiB3RyArIGYuZyAqIHdHICsgaC5nICogd0cgKyBlLmcpICogcmNwV2VpZ2h0RyksCiAgICAgICAgc2F0dXJhdGUoKGIuYiAqIHdCICsgZC5iICogd0IgKyBmLmIgKiB3QiArIGguYiAqIHdCICsgZS5iKSAqIHJjcFdlaWdodEIpKTsKfQoKCmZsb2F0NCBtYWluKGZsb2F0MiB4eSkgewoKICAgIGZsb2F0NCBvcmlnaW5hbENvbG9yID0gaUNodW5rLmV2YWwoeHkpOwogICAgaWYgKG9yaWdpbmFsQ29sb3IuYSA8IDEpIHsKICAgICAgICByZXR1cm4gaUNodW5rLmV2YWwoeHkpOwogICAgfQoKICAgIGZsb2F0IGludGVuc2l0eSA9IGlBcmdzWzBdOwogICAgZmxvYXQgc3RyZW5ndGggPSAwOwogICAgZmxvYXQzIGNvbG9yOwoKICAgIGlmIChpbnRlbnNpdHkgPCBWX01JTiArIEVQU0lPTikgewogICAgICAgIHN0cmVuZ3RoID0gMC4xMDsKICAgICAgICBjb2xvciA9IFJHWDMoeHksIHN0cmVuZ3RoKTsKCiAgICB9IGVsc2UgaWYgKGludGVuc2l0eSA+IFZfTE9XIC0gRVBTSU9OICYmIGludGVuc2l0eSA8IFZfTE9XICsgRVBTSU9OKSB7CiAgICAgICAgc3RyZW5ndGggPSAwLjMzOwogICAgICAgIGNvbG9yID0gUkdYMyh4eSwgc3RyZW5ndGgpOwoKICAgIH0gZWxzZSBpZiAoaW50ZW5zaXR5ID4gVl9NRUQgLSBFUFNJT04gJiYgaW50ZW5zaXR5IDwgVl9NRUQgKyBFUFNJT04pIHsKICAgICAgICBzdHJlbmd0aCA9IDAuNTsKICAgICAgICBjb2xvciA9IFJHWDMoeHksIHN0cmVuZ3RoKTsKCiAgICB9IGVsc2UgaWYgKGludGVuc2l0eSA+IFZfSElHSCAtIEVQU0lPTiAmJiBpbnRlbnNpdHkgPCBWX0hJR0ggKyBFUFNJT04pIHsKICAgICAgICBzdHJlbmd0aCA9IDAuOTk7CiAgICAgICAgY29sb3IgPSBSR1gzKHh5LCBzdHJlbmd0aCk7CgogICAgfSBlbHNlIGlmIChpbnRlbnNpdHkgPiBWX01BWCAtIEVQU0lPTikgewogICAgICAgIHN0cmVuZ3RoID0gMTsKICAgICAgICBjb2xvciA9IFJHWDIoeHkpLnJnYjsKICAgIH0KCiAgICByZXR1cm4gZmxvYXQ0KGNvbG9yLCBvcmlnaW5hbENvbG9yLmEpOwp9) -opera-args(1.00 255 255 255));
  }
</style></head>

<body>

<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.*;</p>
<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.graphics.*;</p>
<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.widgets.*;</p>
<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.events.*;</p>
<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.layout.*;</p>
<b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">import </font></b>org.eclipse.swt.program.*;</p>
<b>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">public class </font></b>LeakExample
{</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
static </font></b>Display display;</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
static </font></b>Shell shell;</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
static </font></b>List list;</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
static </font></b>Canvas canvas;</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
static </font></b>Image image;</p>
<font size="2">
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
</font><b>
</b><p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">public static
void </font></b>main(String[] args) {</p>
<p style="margin-top: 0; margin-bottom: 0"><font color="#3F7F5F">&nbsp;&nbsp;&nbsp;
// DeviceData data = <b>new </b>DeviceData();</font></p>
<p style="margin-top: 0; margin-bottom: 0"><font color="#3F7F5F">&nbsp;&nbsp;&nbsp;
// data.tracking = <b>true</b>;</font></p>
<p style="margin-top: 0; margin-bottom: 0"><font color="#3F7F5F">&nbsp;&nbsp;&nbsp;
// display = <b>new </b>Display(data);</font></p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; display = <b><font color="#7f0055">new
</font></b>Display();</p>
<p style="margin-top: 0; margin-bottom: 0"><font color="#3f7f5f">&nbsp;&nbsp;&nbsp;
// Sleak sleak = new Sleak();</font></p>
<font size="2">
</font><p style="margin-top: 0; margin-bottom: 0"><font size="2"></font><font color="#3f7f5f">&nbsp;&nbsp;&nbsp;
// sleak.open();</font></p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; shell = <b><font color="#7f0055">new
</font></b>Shell(display);</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; shell.setLayout(<b><font color="#7f0055">new
</font></b>FillLayout());</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; list = <b><font color="#7f0055">new
</font></b>List(shell, SWT.BORDER | SWT.SINGLE | SWT.V_SCROLL | SWT.H_SCROLL);</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;
list.setItems(Program.getExtensions());</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; canvas = <b><font color="#7f0055">new
</font></b>Canvas(shell, SWT.BORDER);</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;
canvas.addPaintListener(<b><font color="#7f0055">new </font></b>PaintListener()
{</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
public void </font></b>paintControl(PaintEvent e) {</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
if </font></b>(image != <b><font color="#7f0055">null</font></b>) {</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
e.gc.drawImage(image, 0, 0);</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; });</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;
list.addSelectionListener(<b><font color="#7f0055">new </font></b>SelectionAdapter()
{</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
public void </font></b>widgetSelected(SelectionEvent e) {</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
image = <b><font color="#7f0055">null</font></b>; <font color="#3F7F5F">
// potentially leak one image&nbsp;</font></p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
String[] selection = list.getSelection();</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
if </font></b>(selection.length != 0) {</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Program program = Program.findProgram(selection[0]);</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
if </font></b>(program != <b><font color="#7f0055">null</font></b>) {</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ImageData imageData = program.getImageData();</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
if </font></b>(imageData != <b><font color="#7f0055">null</font></b>) {</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b><font color="#7f0055">if </font></b>(image != <b><font color="#7f0055">null</font></b>)
image.dispose();</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
image = <b><font color="#7f0055">new </font></b>Image(display, imageData);</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
canvas.redraw();</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
}</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; });</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp;
shell.setSize(shell.computeSize(SWT.DEFAULT, 200));</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; shell.open();</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
while </font></b>(!shell.isDisposed()) {</p>
<p style="margin-top: 0; margin-bottom: 0"><b><font color="#7f0055">&nbsp;&nbsp;&nbsp;
if </font></b>(!display.readAndDispatch()) display.sleep();</p>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top: 0; margin-bottom: 0">}</p>
<p style="margin-top: 0; margin-bottom: 0">}</p>




</body></html>