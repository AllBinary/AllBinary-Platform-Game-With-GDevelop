
        /* Generated Code Do Not Modify */
        package org.allbinary.game




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.android.view.AllBinaryMidletView
import android.content.Context
import android.util.AttributeSet
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.PreLogUtil

open public class GDGameAndroidView : AllBinaryMidletView {
        

    private val TAG: String = "GDGameAndroidView"
public constructor (context: Context, attrs: AttributeSet)                        

                            : super(context, attrs){
var context = context
var attrs = attrs


                            //For kotlin this is before the body of the constructor.
                    

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

PreLogUtil.put(commonStrings!!.START, TAG, commonStrings!!.CONSTRUCTOR)
}


}
                
            

