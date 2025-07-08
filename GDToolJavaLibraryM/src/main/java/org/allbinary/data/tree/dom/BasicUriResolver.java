/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.data.tree.dom;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.io.path.AbPath;

import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

public class BasicUriResolver implements URIResolver
{
    protected final LogUtil logUtil = LogUtil.getInstance();


    //private TransformInfoInterface parentTransformInfoInterface;
    //TransformInfoInterface parentTransformInfoInterface,
    public BasicUriResolver()
    {
        //this.parentTransformInfoInterface = parentTransformInfoInterface;
    }

    public Source resolve(String href, String base) throws TransformerException
    {
        try
        {
            final StringBuffer stringBuffer = new StringBuffer();

            //stringBuffer.append(URLGLOBALS.getMainPath());
            //stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
            stringBuffer.append(href);

            final AbPath abPath = (AbPath) new AbFilePath(stringBuffer.toString());

            //if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(
                    //org.allbinary.logic.communication.log.config.type.LogConfigType.XMLLOGGING))
            //{
                stringBuffer.delete(0, stringBuffer.length());

                stringBuffer.append("attempt to use xsl:import: href=");
                stringBuffer.append(href);
                stringBuffer.append("\nBase= ");
                stringBuffer.append(base);
                stringBuffer.append("\nNew path= ");
                stringBuffer.append(abPath.toString());
                stringBuffer.append(" is a urlglobal");

                LogUtil.put(LogFactory.getInstance(stringBuffer.toString(), this, "resolve"));
            //}

            return null;
        } catch (TransformerException e)
        {
            throw e;
        } catch (Exception e)
        {
            throw new TransformerException(e);
        }
    }

    public String toString()
    {
        try
        {
            final StringBuffer stringBuffer = new StringBuffer();

            //stringBuffer.append(URLGLOBALS.getMainPath());
            //stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
            stringBuffer.append("/{import url}");

            return stringBuffer.toString();
        } catch (Exception e)
        {
            //Log Error
            return "BasicUriResolver - Does not work without webapp path should be changed";
        }
    }
}
