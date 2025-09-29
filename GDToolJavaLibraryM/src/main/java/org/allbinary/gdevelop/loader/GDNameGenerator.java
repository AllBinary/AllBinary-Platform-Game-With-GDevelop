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

import org.allbinary.canvas.Processor;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.string.CommonStrings;

/**
 *
 * @author User
 */
public class GDNameGenerator extends Processor {

    protected final CommonStrings commonStrings = CommonStrings.getInstance();

    protected final String GD_KEY = "<name>";
    
    protected String packageName;

    public void process(final GDProject gdProject) {
        if(gdProject.packageName != null) {
            this.packageName = gdProject.packageName;
        } else {
            this.packageName = gdProject.name;
        }
    }
    
    public void process() throws Exception {
    }
}
