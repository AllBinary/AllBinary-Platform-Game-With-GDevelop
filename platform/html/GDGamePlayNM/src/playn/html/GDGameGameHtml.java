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

import org.allbinary.playn.AllBinaryPlayNGame;
import org.allbinary.playn.AllBinaryPlayNGameRunnable;
import org.allbinary.util.BasicArrayList;
import playn.core.GDGameMidletFactory;
import playn.core.PlayN;
import playn.core.GDGameProcessor;

public class GDGameGameHtml extends HtmlGame {

  @Override
  public void start() {
    HtmlPlatform platform = HtmlPlatform.register();
    //For more than 1000 files per directory
    //platform.assetManager().setPathPrefix("gd/res/", true);
    //For renaming res from generic path like gd - also rename the directory and gd.nocache.js file
    //platform.assetManager().setPathPrefix("<app_name>/res/", false);
    platform.assetManager().setPathPrefix("gd/res/", false);
    
    
    final BasicArrayList list = new BasicArrayList();
    
    list.add(new GDGameProcessor(list));

    final AllBinaryPlayNGameRunnable gameRunnable = 
            new AllBinaryPlayNGameRunnable(list);
    PlayN.run(
            //new SoundTestGame()
            //new GraphicsTestGame()
            new AllBinaryPlayNGame(new GDGameMidletFactory(), gameRunnable, 960, 600)
            );
  }
}
