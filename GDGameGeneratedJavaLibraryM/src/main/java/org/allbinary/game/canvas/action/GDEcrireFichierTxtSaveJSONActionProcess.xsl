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
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                            <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        private final String RECORD_ID = <xsl:value-of select="$param1" />;
                        private final String SECOND_PARAM = <xsl:value-of select="$param2" />;
                        
                        //EcrireFichierTxt - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            
                            final JSONPersistance jsonPersistance = new JSONPersistance(RECORD_ID);
                            jsonPersistance.loadAll(abeClientInformation);
                            
                            final String jsonAsString = jsonPersistance.getJSONAsString();
                            JSONObject jsonObject;
                            if(jsonAsString != stringUtil.EMPTY_STRING) {
                                final JSONTokener jsonTokener = new JSONTokener(jsonPersistance.getJSONAsString());
                                jsonObject = (JSONObject) jsonTokener.nextValue();
                            } else {
                                jsonObject = new JSONObject();
                            }
                            
                            jsonObject.put(SECOND_PARAM, <xsl:value-of select="$param3" />);
                            final String jsonAsString2 = jsonObject.toString(4);
                            jsonPersistance.deleteAll(abeClientInformation);
                            jsonPersistance.save(abeClientInformation, jsonAsString2);

                            logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + jsonAsString, this, commonStrings.PROCESS);
                            
                            return true;
                        }
                        //EcrireFichierTxt - action - END
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }
    </xsl:template>

</xsl:stylesheet>
