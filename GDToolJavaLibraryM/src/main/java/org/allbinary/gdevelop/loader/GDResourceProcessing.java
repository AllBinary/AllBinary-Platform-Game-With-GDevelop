/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

public class GDResourceProcessing {
    protected final LogUtil logUtil = LogUtil.getInstance();

    public void process() throws Exception {
        try {
            final GDPaths gdPaths = GDPaths.getInstance();
            final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
            XmlToJson.getInstance().processAll(gdPaths.TWOD_RESOURCES_PATH, gdToolStrings._SVG);
        } catch(Exception e) {
            throw e;
        }
    }
        
}
