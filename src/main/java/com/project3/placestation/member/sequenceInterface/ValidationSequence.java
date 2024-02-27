package com.project3.placestation.member.sequenceInterface;

import jakarta.validation.GroupSequence;

@GroupSequence({memberValidationGroups.NotBlank.class, memberValidationGroups.Pattern.class, memberValidationGroups.Size.class})
public interface ValidationSequence {
}
