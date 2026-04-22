/**
 * Copyright 2010 The PlayN Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package playn.core;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.thread.DisplayThreadPool;
import org.allbinary.thread.SecondaryThreadPool;
import org.allbinary.thread.EmuThreadPool;
import org.allbinary.graphics.opengles.CurrentDisplayableFactory;
import org.allbinary.thread.ThreadPool;
import org.microemu.device.DeviceFactory;
import org.microemu.device.playn.PlaynDevice;
import static playn.core.PlayN.*;

import playn.core.util.Callback;
//http://localhost:8080/minispacewarvector-html-1.0-SNAPSHOT/
//null.nullMethod()

public class SoundTestGame implements Game, Keyboard.Listener
{
    protected final LogUtil logUtil = LogUtil.getInstance();


    private static final int NUM_STARS = 10;

    private SurfaceLayer gameLayer;

    private float touchVectorX, touchVectorY;

    //private javax.microedition.lcdui.Graphics graphics;
    //private DisplayAccess displayAccess;
    private Sound sound;

    @Override
    public void init()
    {

        Graphics graphics = graphics();

        graphics.setSize(800, 600);

        gameLayer = graphics.createSurfaceLayer(graphics.width(), graphics.height());
        graphics.rootLayer().add(gameLayer);

        keyboard().setListener(this);

        pointer().setListener(new Pointer.Listener()
        {
            @Override
            public void onPointerEnd(Pointer.Event event)
            {
                touchVectorX = touchVectorY = 0;
            }

            @Override
            public void onPointerDrag(Pointer.Event event)
            {
                touchMove(event.x(), event.y());
            }

            @Override
            public void onPointerStart(Pointer.Event event)
            {
                touchMove(event.x(), event.y());
            }
        });

        //Do something until loading is done here
    /*
         platform().net().get("/rpc?progress", new Callback<String>() {
         @Override
         public void onSuccess(String json) {
         //new game
         }

         @Override
         public void onFailure(Throwable error) {
         platform().log("error loading map");
         }
         });
         */
        DeviceFactory.setDevice(new PlaynDevice());

    }

    //TWB - Added for custom playn 1.0.3
    @Override
    public void onKeyTyped(Keyboard.TypedEvent event) {
        PlayN.log().debug("key typed");
    }
    
    @Override
    public void onKeyDown(Keyboard.Event event)
    {
        PlayN.log().debug("key down");
    }

    @Override
    public void onKeyUp(Keyboard.Event event)
    {
        PlayN.log().debug("key up");
        try
        {
            if(sound == null) {
                sound = PlayN.assetManager().getSound("/wav/select");
            }
        }catch(Exception e)
        {
            PlayN.log().error(CommonStrings.getInstance().EXCEPTION, e);
        }
        if(!sound.isPlaying()) {
            PlayN.log().debug("play sound");
            sound.play();
        }
    }

    private final CurrentDisplayableFactory currentDisplayableFactory = CurrentDisplayableFactory.getInstance();

    private final EmuThreadPool primaryThreadPool = DisplayThreadPool.getInstance();
    private final ThreadPool secondaryThreadPool = SecondaryThreadPool.getInstance();

    private boolean isCrashed = false;

    @Override
    public void update(float delta)
    {
        try
        {
            //sound.play();

        }catch(Exception e)
        {
            this.isCrashed = true;
            logUtil.put(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().UPDATE, e);
        }
    }

    @Override
    public void paint(float alpha)
    {
        Surface surface = gameLayer.surface();
        surface.clear();
    }

    private void touchMove(float x, float y)
    {
        float cx = graphics().screenWidth() / 2;
        float cy = graphics().screenHeight() / 2;

        touchVectorX = (x - cx) * 1.0f / cx;
        touchVectorY = (y - cy) * 1.0f / cy;
    }

    private void post(String payload)
    {
        net().post("/rpc", payload, new Callback<String>()
        {
            @Override
            public void onSuccess(String response)
            {
                // Nada.
            }

            @Override
            public void onFailure(Throwable error)
            {
                // TODO
            }
        });
    }

    @Override
    public int updateRate()
    {
        return 42;
    }
}
