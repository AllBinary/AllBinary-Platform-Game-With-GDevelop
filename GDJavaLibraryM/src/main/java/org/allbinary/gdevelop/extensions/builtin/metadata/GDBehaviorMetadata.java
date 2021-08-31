/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.metadata;

import java.util.HashMap;
import org.allbinary.gdevelop.extensions.GDPlatformExtension;
import org.allbinary.gdevelop.project.GDBehavior;
import org.allbinary.gdevelop.project.GDBehaviorsSharedData;
import org.allbinary.logic.basic.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDBehaviorMetadata
{
    private static String RETURN_ = "Return ";
    private static String COMPARE_ = "Compare ";

    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final GDParameterFactory parameterFactory = GDParameterFactory.getInstance();

    public final String extensionNamespace;
    public final String name;
    public final String fullname;
    public final String defaultName;
    public final String description;
    public final String group;
    public final String icon24x24;
    public final String className;
    public final GDBehavior behavior;
    public final GDBehaviorsSharedData behaviorsSharedData;

    public final BasicArrayList conditionInstructionMetadataList = new BasicArrayList();
    public final BasicArrayList actionInstructionMetadataList = new BasicArrayList();

    private final HashMap<String, GDInstructionMetadata> nameToConditionInstructionMetadataMap = new HashMap();
    private final HashMap<String, GDInstructionMetadata> nameToActionInstructionMetadataMap = new HashMap();

    private final HashMap<String, GDExpressionMetadata> nameToExpressionMetadataMap = new HashMap();
    private final HashMap<String, GDExpressionMetadata> nameToStrExpressionMetadataMap = new HashMap();

    public GDBehaviorMetadata(
            final String extensionNamespace,
            final String name,
            final String fullname,
            final String defaultName,
            final String description,
            final String group,
            final String icon24x24,
            final String className,
            final GDBehavior behavior,
            final GDBehaviorsSharedData behaviorsSharedData)
    {
        this.extensionNamespace = extensionNamespace;
        this.name = name;
        this.fullname = fullname;
        this.defaultName = defaultName;
        this.description = description;
        this.group = group;
        this.icon24x24 = icon24x24;
        this.className = className;
        this.behavior = behavior;
        this.behaviorsSharedData = behaviorsSharedData;
    }

    public GDInstructionMetadata addCondition(
            final String name,
            final String fullname,
            final String description,
            final String sentence,
            final String group,
            final String icon,
            final String smallicon)
    {

        final String nameWithNamespace = extensionNamespace.isEmpty() ? name : extensionNamespace + name;

        final GDInstructionMetadata instructionMetadata = new GDInstructionMetadata(
                extensionNamespace,
                nameWithNamespace,
                fullname,
                description,
                sentence,
                group,
                icon,
                smallicon);

        //instructionMetadata.setHelpPath(GetHelpPath());
        //instructionMetadata.setIsBehaviorInstruction();
        this.conditionInstructionMetadataList.add(instructionMetadata);

        return instructionMetadata;
    }

    public GDInstructionMetadata addAction(
            final String name,
            final String fullname,
            final String description,
            final String sentence,
            final String group,
            final String icon,
            final String smallicon)
    {
        final String nameWithNamespace = extensionNamespace.isEmpty() ? name : extensionNamespace + name;

        final GDInstructionMetadata instructionMetadata = new GDInstructionMetadata(
                extensionNamespace,
                nameWithNamespace,
                fullname,
                description,
                sentence,
                group,
                icon,
                smallicon);

        //instructionMetadata.setHelpPath(GetHelpPath());
        //instructionMetadata.setIsBehaviorInstruction();
        this.actionInstructionMetadataList.add(instructionMetadata);

        return instructionMetadata;
    }

    public GDInstructionMetadata addScopedCondition(
            final String name,
            final String fullname,
            final String description,
            final String sentence,
            final String group,
            final String icon,
            final String smallicon)
    {

        final String nameWithNamespace = new StringBuilder().append(this.getName()).append(GDPlatformExtension.getInstance().NAMESPACE_SEP).append(name).toString();
        final GDInstructionMetadata instructionMetadata = new GDInstructionMetadata(
                extensionNamespace,
                nameWithNamespace,
                fullname,
                description,
                sentence,
                group,
                icon,
                smallicon);
        //instructionMetadata.SetHelpPath(GetHelpPath())
        //instructionMetadata.SetIsBehaviorInstruction();

        this.nameToConditionInstructionMetadataMap.put(nameWithNamespace, instructionMetadata);

        return instructionMetadata;
    }

    public GDInstructionMetadata addScopedAction(
            final String name,
            final String fullname,
            final String description,
            final String sentence,
            final String group,
            final String icon,
            final String smallicon)
    {

        final String nameWithNamespace = new StringBuilder().append(this.getName()).append(GDPlatformExtension.getInstance().NAMESPACE_SEP).append(name).toString();

        final GDInstructionMetadata instructionMetadata = new GDInstructionMetadata(
                extensionNamespace,
                nameWithNamespace,
                fullname,
                description,
                sentence,
                group,
                icon,
                smallicon);
        //.SetHelpPath(GetHelpPath())
        //.SetIsBehaviorInstruction();

        this.nameToActionInstructionMetadataMap.put(nameWithNamespace, instructionMetadata);

        return instructionMetadata;
    }

    public GDExpressionMetadata addExpression(
            final String name,
            final String fullname,
            final String description,
            final String group,
            final String smallicon)
    {

        final GDExpressionMetadata expressionMetadata = new GDExpressionMetadata(
                this.parameterFactory.NUMBER,
                extensionNamespace,
                name,
                fullname,
                description,
                group,
                smallicon);
        //.SetHelpPath(GetHelpPath());

        this.nameToExpressionMetadataMap.put(name, expressionMetadata);

        return expressionMetadata;
    }

    public GDExpressionMetadata addStrExpression(
            final String name,
            final String fullname,
            final String description,
            final String group,
            final String smallicon)
    {
        final GDExpressionMetadata expressionMetadata = new GDExpressionMetadata(
                this.parameterFactory.STRING,
                extensionNamespace,
                name,
                fullname,
                description,
                group,
                smallicon);
        //.SetHelpPath(GetHelpPath());

        this.nameToStrExpressionMetadataMap.put(name, expressionMetadata);

        return expressionMetadata;
    }

    public GDMultipleInstructionMetadata addExpressionAndConditionAndAction(
            final String type,
            final String name,
            final String fullname,
            final String descriptionSubject,
            final String sentenceName,
            final String group,
            final String icon)
    {
        final GDExpressionMetadata expression = (type == this.parameterFactory.NUMBER)
                ? addExpression(name,
                        fullname,
                        new StringBuilder().append(RETURN_).append(descriptionSubject).append(commonSeps.PERIOD).toString(),
                        group,
                        icon)
                : addStrExpression(name,
                        fullname,
                        new StringBuilder().append(RETURN_).append(descriptionSubject).append(commonSeps.PERIOD).toString(),
                        group,
                        icon);

        final GDInstructionMetadata conditionInstructionMetadata = this.addScopedCondition(
                name,
                fullname,
                new StringBuilder().append(this.COMPARE_).append(descriptionSubject).append(commonSeps.PERIOD).toString(),
                sentenceName,
                group,
                icon,
                icon);

        final GDInstructionMetadata actionInstructionMetadata = this.addScopedAction(
                "Set" + name,
                fullname,
                new StringBuilder().append(this.COMPARE_).append(descriptionSubject).append(commonSeps.PERIOD).toString(),
                sentenceName,
                group,
                icon,
                icon);

        return new GDMultipleInstructionMetadata(
                expression, conditionInstructionMetadata, actionInstructionMetadata);
    }
    
    /*

//gd::ExpressionMetadata& BehaviorMetadata::AddStrExpression(

gd::MultipleInstructionMetadata BehaviorMetadata::AddExpressionAndCondition(
    final String type,
    final String name,
    final String fullname,
    final String descriptionSubject,
    final String sentenceName,
    final String group,
    final String icon) {
  gd::String expressionDescriptionTemplate = "Return <subject>.");
  auto& expression =
      type == this.parameterFactory.NUMBER
          ? AddExpression(name,
                          fullname,
                          expressionDescriptionTemplate.FindAndReplace(
                              "<subject>", descriptionSubject),
                          group,
                          icon)
          : AddStrExpression(name,
                             fullname,
                             expressionDescriptionTemplate.FindAndReplace(
                                 "<subject>", descriptionSubject),
                             group,
                             icon);

  gd::String conditionDescriptionTemplate = "Compare <subject>.");
  auto& condition =
      AddScopedCondition(name,
                         fullname,
                         conditionDescriptionTemplate.FindAndReplace(
                             "<subject>", descriptionSubject),
                         sentenceName,
                         group,
                         icon,
                         icon);

  return MultipleInstructionMetadata::WithExpressionAndCondition(expression,
                                                                 condition);
}

//AddExpressionAndConditionAndAction(

#if defined(GD_IDE_ONLY)
gd::InstructionMetadata& BehaviorMetadata::AddDuplicatedAction(
    final String newActionName, final String copiedActionName) {
  gd::String newNameWithNamespace = extensionNamespace + newActionName;
  gd::String copiedNameWithNamespace = extensionNamespace + copiedActionName;

  auto copiedAction = actionsInfos.find(copiedNameWithNamespace);
  if (copiedAction == actionsInfos.end()) {
    gd::LogWarning("Could not find an action with name " +
                   copiedNameWithNamespace + " to copy.");
  } else {
    actionsInfos[newNameWithNamespace] = copiedAction->second;
  }

  return actionsInfos[newNameWithNamespace];
}

gd::InstructionMetadata& BehaviorMetadata::AddDuplicatedCondition(
    final String newConditionName, final String copiedConditionName) {
  gd::String newNameWithNamespace = extensionNamespace + newConditionName;
  gd::String copiedNameWithNamespace = extensionNamespace + copiedConditionName;

  auto copiedCondition = conditionsInfos.find(copiedNameWithNamespace);
  if (copiedCondition == conditionsInfos.end()) {
    gd::LogWarning("Could not find a condition with name " +
                   copiedNameWithNamespace + " to copy.");
  } else {
    conditionsInfos[newNameWithNamespace] = copiedCondition->second;
  }

  return conditionsInfos[newNameWithNamespace];
}

gd::ExpressionMetadata& BehaviorMetadata::AddDuplicatedExpression(
    final String newExpressionName,
    final String copiedExpressionName) {
  gd::String newNameWithNamespace = extensionNamespace + newExpressionName;
  gd::String copiedNameWithNamespace =
      extensionNamespace + copiedExpressionName;

  auto copiedExpression = expressionsInfos.find(copiedNameWithNamespace);
  if (copiedExpression == expressionsInfos.end()) {
    gd::LogWarning("Could not find an expression with name " +
                   copiedNameWithNamespace + " to copy.");
  } else {
    expressionsInfos[newNameWithNamespace] = copiedExpression->second;
  }

  return expressionsInfos[newNameWithNamespace];
}

gd::ExpressionMetadata& BehaviorMetadata::AddDuplicatedStrExpression(
    final String newExpressionName,
    final String copiedExpressionName) {
  gd::String newNameWithNamespace = extensionNamespace + newExpressionName;
  gd::String copiedNameWithNamespace =
      extensionNamespace + copiedExpressionName;

  auto copiedExpression = strExpressionsInfos.find(copiedNameWithNamespace);
  if (copiedExpression == strExpressionsInfos.end()) {
    gd::LogWarning("Could not find a string expression with name " +
                   copiedNameWithNamespace + " to copy.");
  } else {
    strExpressionsInfos[newNameWithNamespace] = copiedExpression->second;
  }

  return strExpressionsInfos[newNameWithNamespace];
}
#endif

BehaviorMetadata& BehaviorMetadata::SetFullName(final String fullname_) {
#if defined(GD_IDE_ONLY)
  fullname = fullname_;
#endif
  return *this;
}
BehaviorMetadata& BehaviorMetadata::SetDefaultName(
    final String defaultName_) {
#if defined(GD_IDE_ONLY)
  defaultName = defaultName_;
#endif
  return *this;
}
BehaviorMetadata& BehaviorMetadata::SetDescription(
    final String description_) {
#if defined(GD_IDE_ONLY)
  description = description_;
#endif
  return *this;
}
BehaviorMetadata& BehaviorMetadata::SetGroup(final String group_) {
#if defined(GD_IDE_ONLY)
  group = group_;
#endif
  return *this;
}
BehaviorMetadata& BehaviorMetadata::SetIncludeFile(
    final String includeFile) {
#if defined(GD_IDE_ONLY)
  includeFiles.clear();
  includeFiles.push_back(includeFile);
#endif
  return *this;
}
BehaviorMetadata& BehaviorMetadata::AddIncludeFile(
    final String includeFile) {
#if defined(GD_IDE_ONLY)
  if (std::find(includeFiles.begin(), includeFiles.end(), includeFile) ==
      includeFiles.end())
    includeFiles.push_back(includeFile);
#endif
  return *this;
}    
     */
    
    private String getName()
    {
        return this.behavior.type;
    }
}
