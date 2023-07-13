<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />

    <xsl:template name="javascriptCodeEventGDNode" >
        <xsl:param name="totalRecursions" />

                            //BuiltinCommonInstructions::JsCode
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                            
                                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                                <xsl:text>&#10;</xsl:text>
                                                        
                                <xsl:if test="contains(inlineCode, 'SpeechSynthesisUtterance')" >
                                    
                                private final TextToSpeech textToSpeech = new TextToSpeech();
                                <xsl:text>&#10;</xsl:text>

                                @Override
                                public boolean process() throws Exception {
                                    
                                    <xsl:variable name="speechVariable1" ><xsl:value-of select="substring(substring-after(inlineCode,'variables.get'), 3)" /></xsl:variable>
                                    <xsl:variable name="speechVariable2" ><xsl:value-of select="substring-before($speechVariable1,').getAsString()')" /></xsl:variable>
                                    <xsl:variable name="speechVariable" ><xsl:value-of select="substring($speechVariable2, 0, string-length($speechVariable2))" /></xsl:variable>
                                    
                                    //final String voiceName = ;
                                    final String speech = globals.<xsl:value-of select="$speechVariable" />;
                                    LogUtil.put(LogFactory.getInstance("Speaking: " + speech, this, commonStrings.PROCESS));
                                    
                                    if(speech != null) {
                                        //textToSpeech.process(voiceName, speech);
                                        textToSpeech.process(speech);
                                    }
                                </xsl:if>

                                <xsl:if test="not(contains(inlineCode, 'SpeechSynthesisUtterance'))" >

                                @Override
                                public boolean process() throws Exception {

                                    //I don't have plans to implement this event type anytime soon for especially non HTML5 builds.
                                    LogUtil.put(LogFactory.getInstance(commonStrings.NOT_IMPLEMENTED, this, EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                                </xsl:if>

                                    /*<xsl:value-of select="inlineCode" />*/

                                    return true;
                                }

                            };
    </xsl:template>

</xsl:stylesheet>
