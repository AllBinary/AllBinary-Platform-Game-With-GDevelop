/**
 * Copyright 2010 The PlayN Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package playn.html;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;

import org.allbinary.playn.AllBinaryPlayNGame;
import org.allbinary.playn.AllBinaryPlayNGameRunnable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

import playn.core.GDGameMidletFactory;
import playn.core.PlayN;
import playn.core.GDGameProcessor;

public class GDGameGameHtml implements EntryPoint {

  @Override
  public void onModuleLoad () {
    HtmlPlatform.Config config = new HtmlPlatform.Config();
    // Default devicePixelRatio (often fractional, e.g. 1.25/1.5) makes ctx.scale()
    // anti-alias 1px strokes onto a fractional pixel boundary, causing thin lines to
    // flicker between crisp and near-invisible; PlayN 1.1 had no such auto-scaling.
    config.scaleFactor = 1f;
    config.frameBufferPixelRatio = 1f;
//    try {
//      config.scaleFactor = Float.parseFloat(Window.Location.getParameter("scale"));
//    } catch (Exception e) {}
//    try {
//      config.frameBufferPixelRatio = Float.parseFloat(Window.Location.getParameter("fbpr"));
//    } catch (Exception e) {}
    final HtmlPlatform platform = new HtmlPlatform(config);
    PlayN.create(platform);

    platform.assets().setPathPrefix(GWT.getModuleBaseForStaticFiles() + "res/");
    
    final BasicArrayList list = new BasicArrayListD();
    
    list.add(new GDGameProcessor(list));

    final AllBinaryPlayNGameRunnable gameRunnable = new AllBinaryPlayNGameRunnable(list);
    new AllBinaryPlayNGame(platform, new GDGameMidletFactory(), gameRunnable);
    platform.start();
  }

}
