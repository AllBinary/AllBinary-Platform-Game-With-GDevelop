<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="textEntryObjectAsStringActionProcess" >
                        //TextEntryObject::String - action
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //<xsl:value-of select="parameters[2]" />
                            
                            final int size = InputFactory.getInstance().MAX;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                            if(index != Canvas.KEY_NUM1) {

                            globals.inputProcessorArray[index] = new GameInputProcessor() {
                                
                                private boolean hasPressed = false;
                                
                                public void process(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception
                                {

                                }

                                public void processReleased(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception
                                {

                                }

                            };

                            }

                            }

                            //Make sure we only call this 1 time
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);
                            return true;
                        }
    </xsl:template>

</xsl:stylesheet>
