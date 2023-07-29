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
                        private boolean[] hasReleased;

                        public void init() {
                            hasReleased = new boolean[InputFactory.getInstance().MAX];
                            final int size = hasReleased.length;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                hasReleased[index] = true;
                            }
                        }
        
                        //TextEntryObject::String - action
                        @Override
                        public boolean process() throws Exception {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            ((GD0GDObjectsFactory.TextEntry) globals.TextEntryGDObjectList.get(0)).stringMaker.delete(0, ((GD0GDObjectsFactory.TextEntry) globals.TextEntryGDObjectList.get(0)).stringMaker.length());

                            return true;
                        }
                        
                        @Override
                        public boolean process(final Integer keyAsInteger) throws Exception {
                            super.processStats();
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //<xsl:value-of select="parameters[2]" />
                            
                            final int key = keyAsInteger.intValue();
                            if(hasReleased[key]) {
                                //LogUtil.put(LogFactory.getInstance("append: " + keyAsInteger, this, commonStrings.PROCESS));
                                hasReleased[key] = false;
                                ((GD0GDObjectsFactory.TextEntry) globals.TextEntryGDObjectList.get(0)).stringMaker.append((char) key);
                            } else {
                                //LogUtil.put(LogFactory.getInstance("not append: " + keyAsInteger, this, commonStrings.PROCESS));
                            }

                            return true;
                        }

                        @Override
                        public boolean processReleased(final Integer keyAsInteger) throws Exception {
                            super.processStats();
                            
                            final int key = keyAsInteger.intValue();
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + key, this, commonStrings.PROCESS));
                            hasReleased[key] = true;

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>