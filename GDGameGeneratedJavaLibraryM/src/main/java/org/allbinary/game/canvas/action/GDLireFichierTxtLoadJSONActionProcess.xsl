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

    <xsl:template name="lireFichierTxtLoadJSONActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                            <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
<!--                            <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>-->
                            <xsl:variable name="param4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                
                        private final String RECORD_ID = <xsl:value-of select="$param1" />;
                        private final String SECOND_PARAM = <xsl:value-of select="$param2" />;

                        //LireFichierTxt - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            final JSONPersistance jsonPersistance = new JSONPersistance(RECORD_ID);
                            jsonPersistance.loadAll(abeClientInformation);
                            
                            final String jsonAsString = jsonPersistance.getJSONAsString();
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + jsonAsString, this, commonStrings.PROCESS);
                            if(jsonAsString != StringUtil.getInstance().EMPTY_STRING) {
                            
                                final JSONTokener jsonTokener = new JSONTokener(jsonAsString);
                                final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                            
                                if(jsonObject.has(SECOND_PARAM)) {
                                    globals.<xsl:value-of select="$param4" /> = jsonObject.getString(SECOND_PARAM);
                                    logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + globals.<xsl:value-of select="$param4" />, this, commonStrings.PROCESS);
                                } else {
                                    logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "missing", this, commonStrings.PROCESS);
                                    //globals.<xsl:value-of select="$param4" /> = CommonPhoneStrings.getInstance().ZERO;
                                    throw new RuntimeException();
                                }

                            } else {
                                logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + stringUtil.NULL_STRING, this, commonStrings.PROCESS);
                            }

                            return true;
                        }
                        //LireFichierTxt - action - END

    </xsl:template>

</xsl:stylesheet>
