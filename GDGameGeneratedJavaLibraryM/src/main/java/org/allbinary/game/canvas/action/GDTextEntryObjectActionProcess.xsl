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

    <xsl:template name="textEntryObjectAsStringActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                        private boolean[] hasReleased;

                        public void init() {
                            hasReleased = new boolean[InputFactory.getInstance().MAX];
                            this.reset();
                        }
        
                        public void reset() {
                            final int size = hasReleased.length;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                hasReleased[index] = true;
                            }
                        }
                        
                        //TextEntryObject::String - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry) ((GDGameLayer) globals.TextEntryGDGameLayerList.get(0)).gdObject).stringMaker.delete(0, ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry) ((GDGameLayer) globals.TextEntrGDGameLayerList.get(0)).gdObject).stringMaker.length());

                            return true;
                        }
                        
                        @Override
                        public boolean process(final Integer keyAsInteger) throws Exception {
                            super.processStats();
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            //<xsl:value-of select="parameters[2]" />
                            
                            final int key = keyAsInteger.intValue();
                            if(hasReleased[key]) {
                                //logUtil.put("append: " + keyAsInteger, this, commonStrings.PROCESS);
                                hasReleased[key] = false;
                                ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry) ((GDGameLayer) globals.TextEntryGDGameLayerList.get(0)).gdObject).stringMaker.append((char) key);
                            } else {
                                //logUtil.put("not append: " + keyAsInteger, this, commonStrings.PROCESS);
                            }

                            return true;
                        }

                        @Override
                        public boolean processReleased(final Integer keyAsInteger) throws Exception {
                            super.processStats();
                            
                            final int key = keyAsInteger.intValue();
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + key, this, commonStrings.PROCESS);
                            hasReleased[key] = true;

                            return true;
                        }
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
