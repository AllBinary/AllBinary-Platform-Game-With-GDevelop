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

    <xsl:template name="textInputVirtualKeyboardTextInputVirtualKeyboardCloseKeyboardActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                    //TextInputVirtualKeyboard::TextInputVirtualKeyboard::closeKeyboard - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                        try {
                            virtualKeyboardEventHandler.close();
                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                        }

                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>
