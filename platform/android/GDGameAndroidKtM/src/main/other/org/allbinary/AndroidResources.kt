package org.allbinary

import java.lang.Object
import org.allbinary.game.gd.com.zat.invaders.R

open public class AndroidResources : Object
{
    companion object {

        private val instance: AndroidResources = AndroidResources()
    
        /**
         * @return the instance
         */
        fun getInstance(): AndroidResources
        {
            return instance
        }

    }

    public constructor() : super()
    {
    }
    
    var drawable: R.Companion.drawable = R.Companion.drawable()

    var id: R.Companion.id = R.Companion.id()

    var layout: R.Companion.layout = R.Companion.layout()

    var raw: R.Companion.raw = R.Companion.raw()

    var string: R.Companion.string = R.Companion.string()
}

