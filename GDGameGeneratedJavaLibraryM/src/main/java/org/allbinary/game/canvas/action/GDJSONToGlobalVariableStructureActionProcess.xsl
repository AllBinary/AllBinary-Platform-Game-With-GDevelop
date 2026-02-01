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

    <xsl:template name="jsonToGlobalVariableStructureActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        
                        //JSONToGlobalVariableStructure - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            
        <xsl:variable name="firstParametersAsString0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="firstParametersAsString" ><xsl:value-of select="translate($firstParametersAsString0, '&#10;', '')" /></xsl:variable>
                            //final JSONTokener jsonTokener = new JSONTokener(globals.<xsl:value-of select="$firstParametersAsString" />);
                        
                            //final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();

                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            
                            <xsl:variable name="start" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >Integer.parseInt(</xsl:if><xsl:if test="type = 'boolean'" ></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="end" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >)</xsl:if><xsl:if test="type = 'boolean'" >)</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                            //gameGlobals.<xsl:value-of select="$param2" />JSONObject = jsonObject;
                            //gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />jsonObject.getString("<xsl:value-of select="$param2" />")<xsl:value-of select="$end" />;
                            if(globals.<xsl:value-of select="$firstParametersAsString" /> != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="$firstParametersAsString" />.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />globals.<xsl:value-of select="$firstParametersAsString" /><xsl:value-of select="$end" />;
                                logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + gameGlobals.<xsl:value-of select="$param2" />, this, commonStrings.PROCESS);
                            } else {
                                logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "null or empty", this, commonStrings.PROCESS);
                            }

                            return true;
                        }
                        //JSONToGlobalVariableStructure - action - END
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
