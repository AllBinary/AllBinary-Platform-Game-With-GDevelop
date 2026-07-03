<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0060)https://www.eclipse.org/articles/swt-design-2/Sleak.java.htm -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<meta content="MSHTML 6.00.2800.1141" name="GENERATOR"><style type="text/css" id="operaUserStyle">
  video {
    filter: -opera-shader(url(data:text/plain;base64,Ly8gaHR0cHM6Ly9naXRodWIuY29tL0dQVU9wZW4tRWZmZWN0cy9GaWRlbGl0eUZYLUNBUwovLyB2MwoKdW5pZm9ybSBzaGFkZXIgaUNodW5rOwp1bmlmb3JtIGZsb2F0MiBpQ2h1bmtTaXplOwp1bmlmb3JtIGZsb2F0MiBpTW91c2U7CnVuaWZvcm0gZmxvYXQgaUFyZ3NbMV07Cgpjb25zdCBmbG9hdCBFUFNJT04gPSAwLjE7CmNvbnN0IGZsb2F0IFZfTUlOID0gMDsKY29uc3QgZmxvYXQgVl9MT1cgPSAwLjI1Owpjb25zdCBmbG9hdCBWX01FRCA9IDAuNTsKY29uc3QgZmxvYXQgVl9ISUdIID0gMC43NTsKY29uc3QgZmxvYXQgVl9NQVggPSAxOwoKY29uc3QgZmxvYXQgVEhSRVNIT0xEX0FSRUEgPSA4MDAgKiA2MDA7CmNvbnN0IGZsb2F0IE1JTl9BUkVBID0gNDAwICogMTAwOwpjb25zdCBmbG9hdCBNSU5fU1RSSVAgPSAyMDsKY29uc3QgZmxvYXQgTUFSR0lOID0gMTsKCmZsb2F0MyBwaXhlbChpbnQgeCwgaW50IHksIGZsb2F0MiB4eSkgewogICAgcmV0dXJuIGlDaHVuay5ldmFsKHh5ICsgZmxvYXQyKHgsIHkpKS5yZ2I7Cn0KCmZsb2F0MyBzaGFycGVuKGZsb2F0MiB4eSkgewogICAgZmxvYXQzIGYgPQogICAgICAgIHBpeGVsKC0xLCAtMSwgeHkpICogIDEgKwogICAgICAgIHBpeGVsKCAwLCAtMSwgeHkpICogLTEgKwogICAgICAgIHBpeGVsKCAxLCAtMSwgeHkpICogIDEgKwoKICAgICAgICBwaXhlbCgtMSwgMCwgeHkpICogLTEgICsKICAgICAgICBwaXhlbCggMCwgMCwgeHkpICogLTEgICsKICAgICAgICBwaXhlbCggMSwgMCwgeHkpICogLTEgICsKCiAgICAgICAgcGl4ZWwoLTEsIDEsIHh5KSAqIDEgICArCiAgICAgICAgcGl4ZWwoIDAsIDEsIHh5KSAqIC0xICArCiAgICAgICAgcGl4ZWwoIDEsIDEsIHh5KSAqIDE7CiAgICByZXR1cm4gZiAvIC0xOwp9CgpmbG9hdDQgUkdYMihmbG9hdDIgeHkpIHsKICAgIGZsb2F0NCBjb2xvciA9IGlDaHVuay5ldmFsKHh5KTsKCiAgICBpZiAoaUNodW5rU2l6ZS54ICogaUNodW5rU2l6ZS55IDwgTUlOX0FSRUEpIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgaWYgKGlDaHVua1NpemUueSA8IE1JTl9TVFJJUCB8fCBpQ2h1bmtTaXplLnggPCBNSU5fU1RSSVApIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgaWYgKHh5LnggPCBNQVJHSU4gfHwgeHkueCA+IChpQ2h1bmtTaXplLnggLSBNQVJHSU4pIHx8CiAgICAgICAgeHkueSA8IE1BUkdJTiB8fCB4eS55ID4gKGlDaHVua1NpemUueSAtIE1BUkdJTikpIHsKICAgICAgICByZXR1cm4gY29sb3I7CiAgICB9CgogICAgcmV0dXJuIGZsb2F0NChzaGFycGVuKHh5KSwgMSk7Cn0KCmZsb2F0IG1pbjMoZmxvYXQgeCwgZmxvYXQgeSwgZmxvYXQgeikgewogICAgcmV0dXJuIG1pbih4LCBtaW4oeSwgeikpOwp9CgpmbG9hdCBtYXgzKGZsb2F0IHgsIGZsb2F0IHksIGZsb2F0IHopIHsKICAgIHJldHVybiBtYXgoeCwgbWF4KHksIHopKTsKfQoKZmxvYXQgcmNwKGZsb2F0IHYpIHsKICAgIHJldHVybiAxIC8gdjsKfQoKZmxvYXQzIFJHWDMoZmxvYXQyIHh5LCBmbG9hdCBzdHJlbmd0aCkgewogICAgZmxvYXQzIGEgPSBwaXhlbCgtMSwgLTEsIHh5KTsKICAgIGZsb2F0MyBiID0gcGl4ZWwoIDAsIC0xLCB4eSk7CiAgICBmbG9hdDMgYyA9IHBpeGVsKCAxLCAtMSwgeHkpOwoKICAgIGZsb2F0MyBkID0gcGl4ZWwoLTEsIDAsIHh5KTsKICAgIGZsb2F0MyBlID0gcGl4ZWwoIDAsIDAsIHh5KTsKICAgIGZsb2F0MyBmID0gcGl4ZWwoIDEsIDAsIHh5KTsKCiAgICBmbG9hdDMgZyA9IHBpeGVsKC0xLCAxLCB4eSk7CiAgICBmbG9hdDMgaCA9IHBpeGVsKCAwLCAxLCB4eSk7CiAgICBmbG9hdDMgaSA9IHBpeGVsKCAxLCAxLCB4eSk7CgogICAgZmxvYXQgbW5SID0gbWluMyhtaW4zKGQuciwgZS5yLCBmLnIpLCBiLnIsIGgucik7CiAgICBmbG9hdCBtbkcgPSBtaW4zKG1pbjMoZC5nLCBlLmcsIGYuZyksIGIuZywgaC5nKTsKICAgIGZsb2F0IG1uQiA9IG1pbjMobWluMyhkLmIsIGUuYiwgZi5iKSwgYi5iLCBoLmIpOwoKICAgIGZsb2F0IG1uUjIgPSBtaW4zKG1pbjMobW5SLCBhLnIsIGMuciksIGcuciwgaS5yKTsKICAgIGZsb2F0IG1uRzIgPSBtaW4zKG1pbjMobW5HLCBhLmcsIGMuZyksIGcuZywgaS5nKTsKICAgIGZsb2F0IG1uQjIgPSBtaW4zKG1pbjMobW5CLCBhLmIsIGMuYiksIGcuYiwgaS5iKTsKCiAgICBtblIgPSBtblIgKyBtblIyOwogICAgbW5HID0gbW5HICsgbW5HMjsKICAgIG1uQiA9IG1uQiArIG1uQjI7CgogICAgZmxvYXQgbXhSID0gbWF4MyhtYXgzKGQuciwgZS5yLCBmLnIpLCBiLnIsIGgucik7CiAgICBmbG9hdCBteEcgPSBtYXgzKG1heDMoZC5nLCBlLmcsIGYuZyksIGIuZywgaC5nKTsKICAgIGZsb2F0IG14QiA9IG1heDMobWF4MyhkLmIsIGUuYiwgZi5iKSwgYi5iLCBoLmIpOwoKICAgIGZsb2F0IG14UjIgPSBtYXgzKG1heDMobXhSLCBhLnIsIGMuciksIGcuciwgaS5yKTsKICAgIGZsb2F0IG14RzIgPSBtYXgzKG1heDMobXhHLCBhLmcsIGMuZyksIGcuZywgaS5nKTsKICAgIGZsb2F0IG14QjIgPSBtYXgzKG1heDMobXhCLCBhLmIsIGMuYiksIGcuYiwgaS5iKTsKCiAgICBteFIgPSBteFIgKyBteFIyOwogICAgbXhHID0gbXhHICsgbXhHMjsKICAgIG14QiA9IG14QiArIG14QjI7CgogICAgZmxvYXQgcmNwTVIgPSByY3AobXhSKTsKICAgIGZsb2F0IHJjcE1HID0gcmNwKG14Ryk7CiAgICBmbG9hdCByY3BNQiA9IHJjcChteEIpOwoKICAgIGZsb2F0IGFtcFIgPSBzYXR1cmF0ZShtaW4obW5SLCAyIC0gbXhSKSAqIHJjcE1SKTsKICAgIGZsb2F0IGFtcEcgPSBzYXR1cmF0ZShtaW4obW5HLCAyIC0gbXhHKSAqIHJjcE1HKTsKICAgIGZsb2F0IGFtcEIgPSBzYXR1cmF0ZShtaW4obW5CLCAyIC0gbXhCKSAqIHJjcE1CKTsKCiAgICBhbXBSID0gc3FydChhbXBSKTsKICAgIGFtcEcgPSBzcXJ0KGFtcEcpOwogICAgYW1wQiA9IHNxcnQoYW1wQik7CgogICAgZmxvYXQgcGVhayA9IC1yY3AobWl4KDgsIDUsIHN0cmVuZ3RoKSk7CgogICAgZmxvYXQgd1IgPSBhbXBSICogcGVhazsKICAgIGZsb2F0IHdHID0gYW1wRyAqIHBlYWs7CiAgICBmbG9hdCB3QiA9IGFtcEIgKiBwZWFrOwoKICAgIGZsb2F0IHJjcFdlaWdodFIgPSByY3AoMSArIDQgKiB3Uik7CiAgICBmbG9hdCByY3BXZWlnaHRHID0gcmNwKDEgKyA0ICogd0cpOwogICAgZmxvYXQgcmNwV2VpZ2h0QiA9IHJjcCgxICsgNCAqIHdCKTsKCiAgICByZXR1cm4gZmxvYXQzKAogICAgICAgIHNhdHVyYXRlKChiLnIgKiB3UiArIGQuciAqIHdSICsgZi5yICogd1IgKyBoLnIgKiB3UiArIGUucikgKiByY3BXZWlnaHRSKSwKICAgICAgICBzYXR1cmF0ZSgoYi5nICogd0cgKyBkLmcgKiB3RyArIGYuZyAqIHdHICsgaC5nICogd0cgKyBlLmcpICogcmNwV2VpZ2h0RyksCiAgICAgICAgc2F0dXJhdGUoKGIuYiAqIHdCICsgZC5iICogd0IgKyBmLmIgKiB3QiArIGguYiAqIHdCICsgZS5iKSAqIHJjcFdlaWdodEIpKTsKfQoKCmZsb2F0NCBtYWluKGZsb2F0MiB4eSkgewoKICAgIGZsb2F0NCBvcmlnaW5hbENvbG9yID0gaUNodW5rLmV2YWwoeHkpOwogICAgaWYgKG9yaWdpbmFsQ29sb3IuYSA8IDEpIHsKICAgICAgICByZXR1cm4gaUNodW5rLmV2YWwoeHkpOwogICAgfQoKICAgIGZsb2F0IGludGVuc2l0eSA9IGlBcmdzWzBdOwogICAgZmxvYXQgc3RyZW5ndGggPSAwOwogICAgZmxvYXQzIGNvbG9yOwoKICAgIGlmIChpbnRlbnNpdHkgPCBWX01JTiArIEVQU0lPTikgewogICAgICAgIHN0cmVuZ3RoID0gMC4xMDsKICAgICAgICBjb2xvciA9IFJHWDMoeHksIHN0cmVuZ3RoKTsKCiAgICB9IGVsc2UgaWYgKGludGVuc2l0eSA+IFZfTE9XIC0gRVBTSU9OICYmIGludGVuc2l0eSA8IFZfTE9XICsgRVBTSU9OKSB7CiAgICAgICAgc3RyZW5ndGggPSAwLjMzOwogICAgICAgIGNvbG9yID0gUkdYMyh4eSwgc3RyZW5ndGgpOwoKICAgIH0gZWxzZSBpZiAoaW50ZW5zaXR5ID4gVl9NRUQgLSBFUFNJT04gJiYgaW50ZW5zaXR5IDwgVl9NRUQgKyBFUFNJT04pIHsKICAgICAgICBzdHJlbmd0aCA9IDAuNTsKICAgICAgICBjb2xvciA9IFJHWDMoeHksIHN0cmVuZ3RoKTsKCiAgICB9IGVsc2UgaWYgKGludGVuc2l0eSA+IFZfSElHSCAtIEVQU0lPTiAmJiBpbnRlbnNpdHkgPCBWX0hJR0ggKyBFUFNJT04pIHsKICAgICAgICBzdHJlbmd0aCA9IDAuOTk7CiAgICAgICAgY29sb3IgPSBSR1gzKHh5LCBzdHJlbmd0aCk7CgogICAgfSBlbHNlIGlmIChpbnRlbnNpdHkgPiBWX01BWCAtIEVQU0lPTikgewogICAgICAgIHN0cmVuZ3RoID0gMTsKICAgICAgICBjb2xvciA9IFJHWDIoeHkpLnJnYjsKICAgIH0KCiAgICByZXR1cm4gZmxvYXQ0KGNvbG9yLCBvcmlnaW5hbENvbG9yLmEpOwp9) -opera-args(1.00 255 255 255));
  }
</style></head>
<body><pre>/*
 * Copyright (c) 2000, 2002 IBM Corp.  All rights reserved.
 * This file is made available under the terms of the Common Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/cpl-v10.html
 */
import org.eclipse.swt.*;
import org.eclipse.swt.graphics.*;
import org.eclipse.swt.widgets.*;
import java.io.*;

public class Sleak {
	Display display;
	Shell shell;
	List list;
	Canvas canvas;
	Button start, stop, check;
	Text text;
	Label label;
	
	Object [] oldObjects = new Object [0];
	Error [] oldErrors = new Error [0];
	Object [] objects = new Object [0];
	Error [] errors = new Error [0];
	
public void open () {
	display = Display.getCurrent ();
	shell = new Shell (display);
	shell.setText ("S-Leak");
	list = new List (shell, SWT.BORDER | SWT.V_SCROLL);
	list.addListener (SWT.Selection, new Listener () {
		public void handleEvent (Event event) {
			refreshObject ();
		}
	});
	text = new Text (shell, SWT.BORDER | SWT.H_SCROLL | SWT.V_SCROLL);
	canvas = new Canvas (shell, SWT.BORDER);
	canvas.addListener (SWT.Paint, new Listener () {
		public void handleEvent (Event event) {
			paintCanvas (event);
		}
	});
	check = new Button (shell, SWT.CHECK);
	check.setText ("Stack");
	check.addListener (SWT.Selection, new Listener () {
		public void handleEvent (Event e) {
			toggleStackTrace ();
		}
	});
	start = new Button (shell, SWT.PUSH);
	start.setText ("Snap");
	start.addListener (SWT.Selection, new Listener () {
		public void handleEvent (Event event) {
			refreshAll ();
		}
	});
	stop = new Button (shell, SWT.PUSH);
	stop.setText ("Diff");
	stop.addListener (SWT.Selection, new Listener () {
		public void handleEvent (Event event) {
			refreshDifference ();
		}
	});
	label = new Label (shell, SWT.BORDER);
	label.setText ("0 object(s)");
	shell.addListener (SWT.Resize, new Listener () {
		public void handleEvent (Event e) {
			layout ();
		}
	});
	check.setSelection (false);
	text.setVisible (false);
	Point size = shell.getSize ();
	shell.setSize (size.x / 2, size.y / 2);
	shell.open ();
}

void refreshLabel () {
	int colors = 0, cursors = 0, fonts = 0, gcs = 0, images = 0, regions = 0;
	for (int i=0; i&lt;objects.length; i++) {
		Object object = objects [i];
		if (object instanceof Color) colors++;
		if (object instanceof Cursor) cursors++;
		if (object instanceof Font) fonts++;
		if (object instanceof GC) gcs++;
		if (object instanceof Image) images++;
		if (object instanceof Region) regions++;
	}
	String string = "";
	if (colors != 0) string += colors + " Color(s)\n";
	if (cursors != 0) string += cursors + " Cursor(s)\n";
	if (fonts != 0) string += fonts + " Font(s)\n";
	if (gcs != 0) string += gcs + " GC(s)\n";
	if (images != 0) string += images + " Image(s)\n";
	/* Currently regions are not counted. */
//	if (regions != 0) string += regions + " Region(s)\n";
	if (string.length () != 0) {
		string = string.substring (0, string.length () - 1);
	}
	label.setText (string);
}

void refreshDifference () {
	DeviceData info = display.getDeviceData ();
	if (!info.tracking) {
		MessageBox dialog = new MessageBox (shell, SWT.ICON_WARNING | SWT.OK);
		dialog.setText (shell.getText ());
		dialog.setMessage ("Warning: Device is not tracking resource allocation");
		dialog.open ();
	}
	Object [] newObjects = info.objects;
	Error [] newErrors = info.errors;
	Object [] diffObjects = new Object [newObjects.length];
	Error [] diffErrors = new Error [newErrors.length];
	int count = 0;
	for (int i=0; i&lt;newObjects.length; i++) {
		int index = 0;
		while (index &lt; oldObjects.length) {
			if (newObjects [i] == oldObjects [index]) break;
			index++;
		}
		if (index == oldObjects.length) {
			diffObjects [count] = newObjects [i];
			diffErrors [count] = newErrors [i];
			count++;
		}
	}
	objects = new Object [count];
	errors = new Error [count];
	System.arraycopy (diffObjects, 0, objects, 0, count);
	System.arraycopy (diffErrors, 0, errors, 0, count);
	list.removeAll ();
	text.setText ("");
	canvas.redraw ();
	for (int i=0; i&lt;objects.length; i++) {
		list.add (objectName (objects [i]));
	}
	refreshLabel ();
	layout ();
}

String objectName (Object object) {
	String string = object.toString ();
	int index = string.lastIndexOf ('.');
	if (index == -1) return string;
	return string.substring (index + 1, string.length ());
}

void toggleStackTrace () {
	refreshObject ();
	layout ();
}

void paintCanvas (Event event) {
	canvas.setCursor (null);
	int index = list.getSelectionIndex ();
	if (index == -1) return;
	GC gc = event.gc;
	Object object = objects [index];
	if (object instanceof Color) {
		if (((Color)object).isDisposed ()) return;
		gc.setBackground ((Color) object);
		gc.fillRectangle (canvas.getClientArea());
		return;
	}
	if (object instanceof Cursor) {
		if (((Cursor)object).isDisposed ()) return;
		canvas.setCursor ((Cursor) object);
		return;
	}
	if (object instanceof Font) {
		if (((Font)object).isDisposed ()) return;
		gc.setFont ((Font) object);
		FontData [] array = gc.getFont ().getFontData ();
		String string = "";
		String lf = text.getLineDelimiter ();
		for (int i=0; i&lt;array.length; i++) {
			FontData data = array [i];
			String style = "NORMAL";
			int bits = data.getStyle ();
			if (bits != 0) {
				if ((bits &amp; SWT.BOLD) != 0) style = "BOLD ";
				if ((bits &amp; SWT.ITALIC) != 0) style += "ITALIC";
			}
			string += data.getName () + " " + data.getHeight () + " " + style + lf;
		}
		gc.drawString (string, 0, 0);
		return;
	}
	//NOTHING TO DRAW FOR GC
//	if (object instanceof GC) {
//		return;
//	}
	if (object instanceof Image) {
		if (((Image)object).isDisposed ()) return;
		gc.drawImage ((Image) object, 0, 0);
		return;
	}
	if (object instanceof Region) {
		if (((Region)object).isDisposed ()) return;
		String string = ((Region)object).getBounds().toString();
		gc.drawString (string, 0, 0);
		return;
	}
}

void refreshObject () {
	int index = list.getSelectionIndex ();
	if (index == -1) return;
	if (check.getSelection ()) {
		ByteArrayOutputStream stream = new ByteArrayOutputStream ();
		PrintStream s = new PrintStream (stream);
		errors [index].printStackTrace (s);
		text.setText (stream.toString ());
		text.setVisible (true);
		canvas.setVisible (false);
	} else {
		canvas.setVisible (true);
		text.setVisible (false);
		canvas.redraw ();
	}
}

void refreshAll () {
	oldObjects = new Object [0];
	oldErrors = new Error [0];
	refreshDifference ();
	oldObjects = objects;
	oldErrors = errors;
}

void layout () {
	Rectangle rect = shell.getClientArea ();
	String [] strings = new String [objects.length];
	int width = 0;
	String [] items = list.getItems ();
	GC gc = new GC (list);
	for (int i=0; i&lt;objects.length; i++) {
		width = Math.max (width, gc.stringExtent (items [i]).x);
	}
	gc.dispose ();
	Point size1 = start.computeSize (SWT.DEFAULT, SWT.DEFAULT);
	Point size2 = stop.computeSize (SWT.DEFAULT, SWT.DEFAULT);
	Point size3 = check.computeSize (SWT.DEFAULT, SWT.DEFAULT);
	Point size4 = label.computeSize (SWT.DEFAULT, SWT.DEFAULT);
	width = Math.max (size1.x, Math.max (size2.x, Math.max (size3.x, width)));
	width = Math.max (64, Math.max (size4.x, list.computeSize (width, SWT.DEFAULT).x));
	start.setBounds (0, 0, width, size1.y);
	stop.setBounds (0, size1.y, width, size2.y);
	check.setBounds (0, size1.y + size2.y, width, size3.y);
	label.setBounds (0, rect.height - size4.y, width, size4.y);
	int height = size1.y + size2.y + size3.y;
	list.setBounds (0, height, width, rect.height - height - size4.y);
	text.setBounds (width, 0, rect.width - width, rect.height);
	canvas.setBounds (width, 0, rect.width - width, rect.height);
}

public static void main (String [] args) {
	Display display = new Display ();
	Sleak sleak = new Sleak ();
	sleak.open ();
	while (!sleak.shell.isDisposed ()) {
		if (!display.readAndDispatch ()) display.sleep ();
	}
	display.dispose ();
}
		
}
</pre>
</body></html>