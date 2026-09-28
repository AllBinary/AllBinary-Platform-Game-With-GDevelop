/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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

import java.io.FileInputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDXsl {

    private static final GDXsl instance = new GDXsl();

    /**
     * @return the instance
     */
    public static GDXsl getInstance() {
        return instance;
    }

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final StreamUtil streamUtil = StreamUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();

    public final String GD_GAME_INFO = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameInfo.xsl";

    private final BasicArrayList xslPathList = new BasicArrayListD();
    private final BasicArrayList xslDataList = new BasicArrayListD();

    public String getXslAsString(final String xslPath, final SharedBytes sharedBytes) throws Exception {

        final int index = this.xslPathList.indexOf(xslPath);

        if (index == -1) {
            this.logUtil.putF(xslPath, this, this.commonStrings.PROCESS);
            final FileInputStream fileInputStream = new FileInputStream(xslPath);
            sharedBytes.outputStream.reset();
            final String xslAsString = new String(this.streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
            this.xslPathList.add(xslPath);
            this.xslDataList.add(xslAsString);
            return xslAsString;
        } else {
            return (String) this.xslDataList.get(index);
        }

    }

}
