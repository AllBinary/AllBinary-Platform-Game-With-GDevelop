<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="ecrireFichierTxtSaveJSONActionProcess" >
        <xsl:param name="layoutIndex" />

                        //EcrireFichierTxt - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            
                            <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            final JSONPersistance jsonPersistance = new JSONPersistance(<xsl:value-of select="$param1" />);
                            jsonPersistance.loadAll();
                            
                            final String jsonAsString = jsonPersistance.getJSONAsString();
                            JSONObject jsonObject;
                            if(jsonAsString != null) {
                                final JSONTokener jsonTokener = new JSONTokener(jsonPersistance.getJSONAsString());
                                jsonObject = (JSONObject) jsonTokener.nextValue();
                            } else {
                                jsonObject = new JSONObject();
                            }
                            
                            jsonObject.put(<xsl:value-of select="$param2" />, <xsl:value-of select="$param3" />);
                            final String jsonAsString2 = jsonObject.toString(4);
                            jsonPersistance.deleteAll();
                            jsonPersistance.save(jsonAsString2);

                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + jsonAsString, this, commonStrings.PROCESS));
                            
                            return true;
                        }
                        //EcrireFichierTxt - action - END

    </xsl:template>

</xsl:stylesheet>
