
        /*
                *  
                *  Copyright 2010 The PlayN Authors 
                *  
                *  Licensed under the Apache License, Version 2.0 (the "License"); 
                *  you may not use this file except in compliance with the License. 
                *  You may obtain a copy of the License at 
                *  
                *      http://www.apache.org/licenses/LICENSE-2.0 
                *  
                *  Unless required by applicable law or agreed to in writing, software 
                *  distributed under the License is distributed on an "AS IS" BASIS, 
                *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
                *  See the License for the specific language governing permissions and  limitations under the License.  
        */
        
        /* Generated Code Do Not Modify */
        package playn.html




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import com.google.gwt.core.client.EntryPoint
import com.google.gwt.core.client.GWT
import org.allbinary.playn.AllBinaryPlayNGame
import org.allbinary.playn.AllBinaryPlayNGameRunnable
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import playn.core.GDGameMidletFactory
import playn.core.PlayN
import playn.core.GDGameProcessor

open public class GDGameGameHtml
            : Object
        
                , EntryPoint {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun onModuleLoad()
        //nullable = true from not(false or (false and true)) = true
{

    var config: HtmlPlatform.Config = HtmlPlatform.Config()

config.scaleFactor= 1f
config.frameBufferPixelRatio= 1f

    var platform: HtmlPlatform = HtmlPlatform(config)

PlayN.create(platform)
platform.assets()!!.setPathPrefix(GWT.getModuleBaseForStaticFiles() +"res/")

    var list: BasicArrayList = BasicArrayListD()

list.add(GDGameProcessor(list))

    var gameRunnable: AllBinaryPlayNGameRunnable = AllBinaryPlayNGameRunnable(list)

AllBinaryPlayNGame(platform, GDGameMidletFactory(), gameRunnable, false)
platform.start()
}


}
                
            

